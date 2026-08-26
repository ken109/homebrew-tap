class Sennit < Formula
  desc "Dotfiles manager with symlink semantics, templating, and drift detection"
  homepage "https://github.com/ken109/sennit"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.10.0/sennit-aarch64-apple-darwin.tar.gz"
      sha256 "ba019e69ea78759fa4c3be63daf3ebf588ed20c971c22ac58a0d1201bc91c30e"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.10.0/sennit-x86_64-apple-darwin.tar.gz"
      sha256 "17095d06dbe0cc6ea4ae872d5eaf92e79d3acd65128e9e5754b4d0d02d5fab03"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.10.0/sennit-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cc0452270f1d3108b585ee38e362437a30addbcc8f1fea5680a1bd658e6030ed"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.10.0/sennit-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "db9c50aaa272c1b3d82433840eb703c837be60934a72091b12e9c81492d15ca5"
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
