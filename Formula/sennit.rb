class Sennit < Formula
  desc "Dotfiles manager with symlink semantics, templating, and drift detection"
  homepage "https://github.com/ken109/sennit"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.10.1/sennit-aarch64-apple-darwin.tar.gz"
      sha256 "c09dd4b73ea220210f73a6e5f72462a150e0ed2ffbd32e50f82967cb9048b5c1"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.10.1/sennit-x86_64-apple-darwin.tar.gz"
      sha256 "7d1c2bf4860139360a9696c2646ebfb6f9d165d3dd3dc33281d1345d7d3551b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.10.1/sennit-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a2c459050e765980f3d711e4a0380187c74b2819c35d901a1ce7ddff52eadaba"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.10.1/sennit-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5d26288fe780fd7b09e563d202b94bd4349bd26721a4858ce711f4b4943ae1ba"
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
