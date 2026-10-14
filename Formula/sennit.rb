class Sennit < Formula
  desc "Dotfiles manager with symlink semantics, templating, and drift detection"
  homepage "https://github.com/ken109/sennit"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.20.0/sennit-aarch64-apple-darwin.tar.gz"
      sha256 "a17ea05968bd8311c8a820b0370fca0c91cc647d569dd1655aebbcf0bc8ea32d"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.20.0/sennit-x86_64-apple-darwin.tar.gz"
      sha256 "102a12c78af5ee2f49610d321981530070bb4df560df56eadf89cc4ce137d4b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.20.0/sennit-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "34564d65bc440ed7d1d1b6985f52eebf9256bc0e67425e82a6fcda9906cfc398"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.20.0/sennit-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "786b2635138116027fd3e306a40f65b69862add0a2d5c2c1d888828edf3c3bf2"
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
