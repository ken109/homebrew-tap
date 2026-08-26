class Sennit < Formula
  desc "Dotfiles manager with symlink semantics, templating, and drift detection"
  homepage "https://github.com/ken109/sennit"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.3.1/sennit-aarch64-apple-darwin.tar.gz"
      sha256 "c25570f85ea6bbca333c39e8b22548daa13d207f229a3b4ac3b9d11b9cd675d0"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.3.1/sennit-x86_64-apple-darwin.tar.gz"
      sha256 "3fb1cf7a69c4e1d076d51ae1f9836a0e891f6371bc80ab81fc5175ee6e483a06"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.3.1/sennit-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "79f0439a75b68a84911652505aaaca7c109950ed8a252311f3b3d3e3e7accea6"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.3.1/sennit-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e1315ef5d5f3211f5d1c635dc271ec85e747ba6df9ef7816c1663f93782e6d52"
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
