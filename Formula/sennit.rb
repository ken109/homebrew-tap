class Sennit < Formula
  desc "Dotfiles manager with symlink semantics, templating, and drift detection"
  homepage "https://github.com/ken109/sennit"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.18.1/sennit-aarch64-apple-darwin.tar.gz"
      sha256 "ef309a378049c1b92629ee0026acc5f1db3bcd103dcdc49287123b5678145f76"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.18.1/sennit-x86_64-apple-darwin.tar.gz"
      sha256 "de66d8aa0ba31e21ce4f6cc7a77718dc8db41b9b57a7c5b1f93b6069063842b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.18.1/sennit-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "95ea0fad9a1c15c97951c6bcef994844058b535a3fafdda119bc0bea9f794d66"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.18.1/sennit-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6fe4cdf407558d1f773a82ef593a5567938b3add7b761769993e2c416573760b"
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
