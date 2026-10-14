class Sennit < Formula
  desc "Dotfiles manager with symlink semantics, templating, and drift detection"
  homepage "https://github.com/ken109/sennit"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.21.0/sennit-aarch64-apple-darwin.tar.gz"
      sha256 "53328f34946098fa925765562974d6b159d18efdca5030c522f8a66db02a14bb"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.21.0/sennit-x86_64-apple-darwin.tar.gz"
      sha256 "73ce1f25757b2df5a10d2fbeb1221002c39b1f72cb3296ca4a5081fdf0f6f725"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.21.0/sennit-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "05bb291b2a66ab4267ab3fbedfaca1f02f40a8adcb9f2bb36b21a62235137209"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.21.0/sennit-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "310d643c18f4d44520c2c0ba66d2ba13c5f4ee87c4b7cdf9527bc29771aa950b"
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
