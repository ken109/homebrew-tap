class Sennit < Formula
  desc "Dotfiles manager with symlink semantics, templating, and drift detection"
  homepage "https://github.com/ken109/sennit"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.3.2/sennit-aarch64-apple-darwin.tar.gz"
      sha256 "884b91d44710600a4c53e220bb425a7fc652b8f6ac7ab0b5568ed998ef8eb0e3"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.3.2/sennit-x86_64-apple-darwin.tar.gz"
      sha256 "397226bb509e84124467355ff6a663e667f5bc4834d517df0a70b4dd0f8b530f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.3.2/sennit-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "40c65337564a9bdbadee3d748bfeebba9aba7aeb43e06156b8c49f91ff562c0f"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.3.2/sennit-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "05f33fb397d3529b1b049999c008d063206865d99220ea69e6c9b7f09551a900"
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
