class Sennit < Formula
  desc "Dotfiles manager with symlink semantics, templating, and drift detection"
  homepage "https://github.com/ken109/sennit"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.4.0/sennit-aarch64-apple-darwin.tar.gz"
      sha256 "287912fdc9a73c80045c345789960cdf7ee169eb25a6039ca912f565a68a7356"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.4.0/sennit-x86_64-apple-darwin.tar.gz"
      sha256 "64066a1d0404c1520741b975c9093c0628d19ea52afd297796c72b31927d358a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.4.0/sennit-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0786294665e3a9a8cccd767ff881ac92824fc8091434b115a2e70a9f8a137f87"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.4.0/sennit-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e215ef474abf3511d4576f18b5c0766f83c32ef3316b7ec1e7a8a668807c8f19"
    end
  end

  def install
    bin.install "sennit"
  end

  test do
    assert_match "sennit #{version}", shell_output("#{bin}/sennit --version")
    # マニフェストの無い場所では明確に失敗する
    assert_match "sennit.toml", shell_output("#{bin}/sennit list 2>&1", 1)
  end
end
