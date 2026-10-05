#!/usr/bin/env bash
# Formula/r2-lfs.rb を指定バージョンへ更新する。
# r2-lfs は npm で配るので、レジストリのタールボールを取ってチェックサムを計算する。
#
# 検証のために Homebrew が管理する tap ディレクトリ
# (/opt/homebrew/Library/Taps/...) へ直接ファイルを置かないこと(bump.sh と同じ理由)。

set -euo pipefail

[ $# -eq 1 ] || {
    echo "usage: $0 <version>   (e.g. $0 0.5.1)" >&2
    exit 1
}
version="$1"

cd "$(dirname "${BASH_SOURCE[0]}")"

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

url="https://registry.npmjs.org/r2-lfs/-/r2-lfs-$version.tgz"
echo "fetching $url..."
curl -fsSL -o "$tmp/r2-lfs.tgz" "$url"
digest="$(shasum -a 256 "$tmp/r2-lfs.tgz" | cut -d' ' -f1)"

echo "rewriting Formula/r2-lfs.rb..."
python3 - "$version" "$digest" <<'PY'
import io
import re
import sys

version, digest = sys.argv[1], sys.argv[2]

path = "Formula/r2-lfs.rb"
text = io.open(path, encoding="utf-8").read()
text = re.sub(r"/r2-lfs-[0-9][^\"]*\.tgz", f"/r2-lfs-{version}.tgz", text)
text = re.sub(r'(sha256 ")[0-9a-f]{64}', r"\g<1>" + digest, text)
io.open(path, "w", encoding="utf-8").write(text)
PY

ruby -c Formula/r2-lfs.rb >/dev/null
echo "  now at $version ($digest)"
echo "done. review, commit, push, then: brew update && brew upgrade r2-lfs"
