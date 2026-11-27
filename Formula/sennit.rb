class Sennit < Formula
  desc "Dotfiles manager with symlink semantics, templating, and drift detection"
  homepage "https://github.com/ken109/sennit"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.23.0/sennit-aarch64-apple-darwin.tar.gz"
      sha256 "24b5806969fbef7f40b89b8468053dd301648f9ca3ff20b8655901a1ccd9c1f3"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.23.0/sennit-x86_64-apple-darwin.tar.gz"
      sha256 "a2c9654d26e7017fcb4289917b75b464b015a9c2faabac11c878f25864d96e93"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.23.0/sennit-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f8601cc551adf492a80f89371a7588ad954a4b50a0b1c6be1f56d716c3c3aca2"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.23.0/sennit-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "251f96be8294179e730e087d7f16585937a227ae9afbbcf1107616a789d13771"
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
