#!/usr/bin/env bash
# 各ツールの最新リリースを見て、formula より新しければ bump.sh / bump-r2-lfs.sh で
# 書き換えて 1 つにつき 1 コミットする。push はしない(workflow 側が行う)。
#
# 手元で試すときは、クローンした作業ツリーで流す。tap のディレクトリ
# (/opt/homebrew/Library/Taps/...)では流さないこと(bump.sh と同じ理由)。
#
# 失敗(アセットがまだ上がっていない等)は次の定期実行で自然にやり直される。
# 一方の失敗でもう一方を止めないよう、最後にまとめて終了コードを返す。

set -uo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

status=0

# $1 が $2 より新しい版なら 0
is_newer() {
    [ "$1" != "$2" ] && [ "$(printf '%s\n%s\n' "$1" "$2" | sort -V | tail -1)" = "$1" ]
}

# 安全のため、数字とドットだけの版だけを受け付ける(プレリリースは対象外)
valid_version() {
    [[ "$1" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]
}

commit_bump() {
    local name="$1" version="$2"
    git add "Formula/$name.rb"
    git -c user.name="github-actions[bot]" \
        -c user.email="41898282+github-actions[bot]@users.noreply.github.com" \
        commit -q -m "bump($name): $version"
    echo "committed bump($name): $version"
}

# --- sennit: GitHub Release(draft・prerelease を除く最新) ---
bump_sennit() {
    local latest current
    latest="$(gh release view --repo ken109/sennit --json tagName --jq .tagName)" || return 1
    latest="${latest#v}"
    valid_version "$latest" || { echo "sennit: unexpected version '$latest'" >&2; return 1; }
    current="$(sed -n 's#.*/download/v\([0-9][0-9.]*\)/.*#\1#p' Formula/sennit.rb | head -1)"
    echo "sennit: formula=$current latest=$latest"
    is_newer "$latest" "$current" || return 0
    ./bump.sh "$latest" && commit_bump sennit "$latest"
}

# --- r2-lfs: npm の latest ---
bump_r2_lfs() {
    local latest current
    latest="$(curl -fsSL https://registry.npmjs.org/r2-lfs/latest | python3 -c 'import json,sys; print(json.load(sys.stdin)["version"])')" || return 1
    valid_version "$latest" || { echo "r2-lfs: unexpected version '$latest'" >&2; return 1; }
    current="$(sed -n 's#.*/r2-lfs-\([0-9][0-9.]*\)\.tgz.*#\1#p' Formula/r2-lfs.rb | head -1)"
    echo "r2-lfs: formula=$current latest=$latest"
    is_newer "$latest" "$current" || return 0
    ./bump-r2-lfs.sh "$latest" && commit_bump r2-lfs "$latest"
}

bump_sennit || { echo "sennit: bump failed" >&2; status=1; }
bump_r2_lfs || { echo "r2-lfs: bump failed" >&2; status=1; }

exit "$status"
