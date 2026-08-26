class Sennit < Formula
  desc "Dotfiles manager with symlink semantics, templating, and drift detection"
  homepage "https://github.com/ken109/sennit"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.5.1/sennit-aarch64-apple-darwin.tar.gz"
      sha256 "34872a90401a1a0e64d68663537814384cdd2cb20b793572e31596c29bd3a0fd"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.5.1/sennit-x86_64-apple-darwin.tar.gz"
      sha256 "a81ef7e91050cc0ef26d091bc694a8c171ac69a1d32c58f0d9264011793a8184"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.5.1/sennit-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0872587b3ae9a17ac170f6514d1af11031b073827407fdaeb149b4f8b9d0a37c"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.5.1/sennit-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1dab74afc08d1a64c8495c2d502b0ce0ee97d29075d410a81d4e70904509a50e"
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
