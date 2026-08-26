class Sennit < Formula
  desc "Dotfiles manager with symlink semantics, templating, and drift detection"
  homepage "https://github.com/ken109/sennit"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.6.0/sennit-aarch64-apple-darwin.tar.gz"
      sha256 "0cdcfdfaeff6c9c4b50b50587b873153ee8703b00d86a2822b74b01673cb9af8"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.6.0/sennit-x86_64-apple-darwin.tar.gz"
      sha256 "91321e03a2ad0665bf6b621d0f5053c0f8f7f5b6fbbc773ee8d71f96d572fdf0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.6.0/sennit-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4d7f5555bd0f26d1457e67e57ba5659ed99c463e4b40f6e13479359b301141e4"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.6.0/sennit-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "46bbc503ae604e960f22fc37a9190b4064ea16a969cfd5365c8d797d4de81247"
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
