class Sennit < Formula
  desc "Dotfiles manager with symlink semantics, templating, and drift detection"
  homepage "https://github.com/ken109/sennit"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.8.0/sennit-aarch64-apple-darwin.tar.gz"
      sha256 "b89363ebac3fadb2c75acd5a7133cfef553162d18069850770c13a17f91b28d0"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.8.0/sennit-x86_64-apple-darwin.tar.gz"
      sha256 "eed6f5ab05bac16f76063a80555c29468e0c789e4ddf2d1ae671d3a741b07335"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.8.0/sennit-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ee94a88eb8a946de400922398405b36e99a71983aa5fd92a29f8d6efc0d8a900"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.8.0/sennit-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f3583b3088f3d5d275f2d87f9d31baffa5f9fa96b37d1b2575c975530497d150"
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
