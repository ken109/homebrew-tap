class Sennit < Formula
  desc "Dotfiles manager with symlink semantics, templating, and drift detection"
  homepage "https://github.com/ken109/sennit"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.7.1/sennit-aarch64-apple-darwin.tar.gz"
      sha256 "57d9e60d527a4eda129208a74f231f08bedab3d5520cce690f68ca0af810ef39"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.7.1/sennit-x86_64-apple-darwin.tar.gz"
      sha256 "c5b564b952daf58cf6fdc46560e46590b71fc333fc7078dd08be9c403c5f15d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.7.1/sennit-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3d2d2e1f86e65e7d15ef57bd3059e56fe1f0606c793648b6f1330eed73dbf03b"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.7.1/sennit-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "338165f39a5b14b5c22e8f2ba631ecc54a109d933d7c9c0a40aa6b2b3da155fa"
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
