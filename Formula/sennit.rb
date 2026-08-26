class Sennit < Formula
  desc "Dotfiles manager with symlink semantics, templating, and drift detection"
  homepage "https://github.com/ken109/sennit"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.7.0/sennit-aarch64-apple-darwin.tar.gz"
      sha256 "9e90dfd341c815d069b62aba6e2b6667e9f325113a2b5fd9e4c1a8c3c06bdf7d"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.7.0/sennit-x86_64-apple-darwin.tar.gz"
      sha256 "b977f2d66c92a0183f7cfaa3c5fd1dbf0df8e8e7b9e5b0fc3fd63c53d855e22c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.7.0/sennit-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6afe6e260a8ef712dc1a71b94e2c7d26003328a112cca33820d1fe34db363ee3"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.7.0/sennit-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0c9a1d12cd92193c9b4e7260e26c245f7a36332875954da5c2e67a6b48232417"
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
