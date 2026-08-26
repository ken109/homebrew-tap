class Sennit < Formula
  desc "Dotfiles manager with symlink semantics, templating, and drift detection"
  homepage "https://github.com/ken109/sennit"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.9.0/sennit-aarch64-apple-darwin.tar.gz"
      sha256 "eae231f4d892b5b3640246800e0fe57423f498c878ea53e87852604ded5f9869"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.9.0/sennit-x86_64-apple-darwin.tar.gz"
      sha256 "9c73adea91ed7cca0bcfada7827852801b6cae98416b88c20a11105062b8a05c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.9.0/sennit-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5a5f9d0d3ca8077e7c6ac366d765bf1a8c4d6556d554c965f799f1af1f70f9f6"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.9.0/sennit-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1cc357e9bf5c3bea8f85b5615c4396fdf01bada84945e010591c48fa4541d2a7"
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
