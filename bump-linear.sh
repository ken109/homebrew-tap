#!/usr/bin/env bash
# Formula/linear.rb を指定バージョンで生成する。
# 他の formula と違い、書き換えではなくスクリプト内のテンプレートから毎回作り直す
# (Formula/linear.rb が無い最初の bump でも動く)。
#
# 検証のために Homebrew が管理する tap ディレクトリ
# (/opt/homebrew/Library/Taps/...) へ直接ファイルを置かないこと(bump.sh と同じ理由)。
# ここでは常にこのクローン側を編集し、push してから brew update する。

set -euo pipefail

usage() {
    echo "usage: $0 <version>   (e.g. $0 0.1.0)" >&2
    exit 1
}

[ $# -eq 1 ] || usage
version="$1"
[[ "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || {
    echo "not a version (no leading v): $version" >&2
    exit 1
}
repo="ken109/linear"
# linux の arm64 は配っていない
targets=(
    aarch64-apple-darwin
    x86_64-apple-darwin
    x86_64-unknown-linux-musl
)

cd "$(dirname "${BASH_SOURCE[0]}")"

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

echo "fetching checksums for v$version..."
for t in "${targets[@]}"; do
    gh release download "v$version" --repo "$repo" \
        --pattern "linear-$version-$t.tar.gz.sha256" -O "$tmp/$t.sha256"
    digest="$(awk '{print $1; exit}' "$tmp/$t.sha256")"
    [[ "$digest" =~ ^[0-9a-f]{64}$ ]] || {
        echo "not a sha256 for $t: '$digest'" >&2
        exit 1
    }
    printf '%s\n' "$digest" >"$tmp/$t.digest"
done

echo "writing Formula/linear.rb..."
mkdir -p Formula
sha_arm="$(cat "$tmp/aarch64-apple-darwin.digest")"
sha_intel="$(cat "$tmp/x86_64-apple-darwin.digest")"
sha_linux="$(cat "$tmp/x86_64-unknown-linux-musl.digest")"
base="https://github.com/$repo/releases/download/v$version/linear-$version"

cat >"$tmp/linear.rb" <<RUBY
class Linear < Formula
  desc "Fast, scriptable command-line client for Linear"
  homepage "https://github.com/$repo"
  license "MIT"

  on_macos do
    on_arm do
      url "$base-aarch64-apple-darwin.tar.gz"
      sha256 "$sha_arm"
    end
    on_intel do
      url "$base-x86_64-apple-darwin.tar.gz"
      sha256 "$sha_intel"
    end
  end

  on_linux do
    on_intel do
      url "$base-x86_64-unknown-linux-musl.tar.gz"
      sha256 "$sha_linux"
    end
  end

  def install
    bin.install "linear"
    generate_completions_from_executable(bin/"linear", "completions", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/linear --version")
  end
end
RUBY

ruby -c "$tmp/linear.rb" >/dev/null
mv "$tmp/linear.rb" Formula/linear.rb
echo "  now at $version"
echo "done. review, commit, push, then: brew update && brew upgrade linear"
