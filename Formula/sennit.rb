class Sennit < Formula
  desc "Dotfiles manager with symlink semantics, templating, and drift detection"
  homepage "https://github.com/ken109/sennit"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.5.0/sennit-aarch64-apple-darwin.tar.gz"
      sha256 "9b233c4861f393b314306a01a9cb16bad48d01703b2b0a3803c588d1a54b5b43"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.5.0/sennit-x86_64-apple-darwin.tar.gz"
      sha256 "d6614127c5c9ad165aca534f869d105e6010625959d171ebf56665f37edd2406"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.5.0/sennit-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "54beac9d302123ac82178924ecc986c0fc2fbd335e7d36e37391cdb564539f24"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.5.0/sennit-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "07c34b675e0bf0ae624f5c93bc6d74116eb7fb0b8e6b4a74a53b0e832a1a0880"
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
