class Sennit < Formula
  desc "Dotfiles manager that keeps symlink semantics, and adds templating and drift detection"
  homepage "https://github.com/ken109/sennit"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v#{version}/sennit-aarch64-apple-darwin.tar.gz"
      sha256 "cb6f0497720b10dbf1f8e7ccf05bd22069eef9cdb682874df1098e84ddde759c"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v#{version}/sennit-x86_64-apple-darwin.tar.gz"
      sha256 "0c848964ca8a05172e48cf4e42cd18ca54a9aa38d4c8d2bc35dc1161d705a1ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v#{version}/sennit-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4d7b962820fd3fc696c0598a1d2b26608c1c78ed5b3ce1829084d74ef8c0b246"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v#{version}/sennit-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5e64643f6e81e0826b94907714ac9faa5090959174316fb4ada45e29ea0a378a"
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
