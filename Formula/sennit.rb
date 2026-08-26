class Sennit < Formula
  desc "Dotfiles manager with symlink semantics, templating, and drift detection"
  homepage "https://github.com/ken109/sennit"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.11.1/sennit-aarch64-apple-darwin.tar.gz"
      sha256 "810d00bc1bfff5ea23247ad4859b4f275a175f1cc94980b9d3581aafcaeec6ff"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.11.1/sennit-x86_64-apple-darwin.tar.gz"
      sha256 "49a946f8d6e960b919b791078fc89871e73a41d65df14e95efec2c4c48cffeb3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.11.1/sennit-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "93056f3ebcf0f902fd63517ddc236e03efd5c6dad9f98e0be5bd2a86c4058aaf"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.11.1/sennit-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8f4e7cc96e9444278c6fb7cceb8286c2bc23d20db0a32a849a9be6bcb495c837"
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
