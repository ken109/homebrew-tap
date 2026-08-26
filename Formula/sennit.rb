class Sennit < Formula
  desc "Dotfiles manager with symlink semantics, templating, and drift detection"
  homepage "https://github.com/ken109/sennit"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.11.0/sennit-aarch64-apple-darwin.tar.gz"
      sha256 "eb5b97f51cb0cf96ee34ff5e63ca10fb2a674f80982747065ad231b3d880206d"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.11.0/sennit-x86_64-apple-darwin.tar.gz"
      sha256 "0b1028ef12edb02410e5e22b6a752d8becbb434f001443e8879b4f0eceaec764"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.11.0/sennit-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3edc3a11cd7858bee2901abafb0020d4bb089d87ecbac1fda7e2d1af5d2d4ca0"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.11.0/sennit-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "caf12b08035cb26db0f3495ace5c60c5c6df30d1886bd13260b09458b407d17a"
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
