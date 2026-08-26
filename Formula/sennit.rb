class Sennit < Formula
  desc "Dotfiles manager with symlink semantics, templating, and drift detection"
  homepage "https://github.com/ken109/sennit"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.3.0/sennit-aarch64-apple-darwin.tar.gz"
      sha256 "975ca1c4baa9a32dcbce0d443c8aeddd134a8c782a6f4cff762f9a63933584c6"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.3.0/sennit-x86_64-apple-darwin.tar.gz"
      sha256 "c6e306af6ae870bc97bf44447ab6d6519e4166291772c4eadbbe01776b643351"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.3.0/sennit-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8f3f86139eb3c5760065c7bbdb22f2980686c9151b5d1cfff3fbfcf3e0d451ac"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.3.0/sennit-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c57417794153e1e5624d81a0c53aa704e58a89fa293e7d6bf405c99b181c7146"
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
