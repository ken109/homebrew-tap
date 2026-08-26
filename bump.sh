#!/usr/bin/env bash
# Formula/sennit.rb を指定バージョンへ更新する。
#
# 検証のために Homebrew が管理する tap ディレクトリ
# (/opt/homebrew/Library/Taps/...) へ直接ファイルを置かないこと。
# 次の brew update がマージ衝突を起こし、tap が壊れる。
# ここでは常にこのクローン側を編集し、push してから brew update する。

set -euo pipefail

usage() {
    echo "usage: $0 <version>   (e.g. $0 0.3.2)" >&2
    exit 1
}

[ $# -eq 1 ] || usage
version="$1"
repo="ken109/sennit"
targets=(
    aarch64-apple-darwin
    x86_64-apple-darwin
    aarch64-unknown-linux-gnu
    x86_64-unknown-linux-gnu
)

cd "$(dirname "${BASH_SOURCE[0]}")"

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

echo "fetching checksums for v$version..."
for t in "${targets[@]}"; do
    gh release download "v$version" --repo "$repo" \
        --pattern "sennit-$t.tar.gz.sha256" -O "$tmp/$t.sha256"
done

echo "rewriting Formula/sennit.rb..."
python3 - "$version" "$tmp" "${targets[@]}" <<'PY'
import io
import re
import sys

version, tmp = sys.argv[1], sys.argv[2]
targets = sys.argv[3:]

path = "Formula/sennit.rb"
text = io.open(path, encoding="utf-8").read()
text = re.sub(r"/download/v[0-9.]+/", f"/download/v{version}/", text)

for target in targets:
    digest = io.open(f"{tmp}/{target}.sha256", encoding="utf-8").read().split()[0]
    text = re.sub(
        r'(sennit-%s\.tar\.gz"\n      sha256 ")[0-9a-f]{64}' % re.escape(target),
        r"\g<1>" + digest,
        text,
    )

io.open(path, "w", encoding="utf-8").write(text)
PY

ruby -c Formula/sennit.rb >/dev/null
grep -c "v$version" Formula/sennit.rb | xargs -I{} echo "  {} url(s) now point at v$version"
echo "done. review, commit, push, then: brew update && brew upgrade sennit"
