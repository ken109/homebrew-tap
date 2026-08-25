class Sennit < Formula
  desc "Dotfiles manager with symlink semantics, templating, and drift detection"
  homepage "https://github.com/ken109/sennit"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.2.0/sennit-aarch64-apple-darwin.tar.gz"
      sha256 "263f436250b13fe08aa243208c1c95ba544ff8a46ca1ca02374190ef0fe090b3"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.2.0/sennit-x86_64-apple-darwin.tar.gz"
      sha256 "2a743db782a37f847abf5bc3e48faf67fea75817eb376501c78df9bcf0c9d11d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.2.0/sennit-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1f24916f9155ff505a31bcdb2fb1a58f7cff7bd7ee9d965b4dd1d5bb4b3fb300"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.2.0/sennit-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fb9a7c22033cf101238a4814827a2bdcb6573a93de0abc4eae86b141fdcc3f8a"
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
