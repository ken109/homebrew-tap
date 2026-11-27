class Sennit < Formula
  desc "Dotfiles manager with symlink semantics, templating, and drift detection"
  homepage "https://github.com/ken109/sennit"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.24.0/sennit-aarch64-apple-darwin.tar.gz"
      sha256 "779abbfeba06d469fdc2bab7329eacce1b4fe3fce33817461653aad3a54f515d"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.24.0/sennit-x86_64-apple-darwin.tar.gz"
      sha256 "ce544e136617b561cd920c915b9057ef5f2caf3dfb6c3c8d3894bffbd3f538d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.24.0/sennit-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "65373c72f07b5c170b29e0e3b8d167654c8099b0c794c250a1aba03dee98816e"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.24.0/sennit-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "74a545aac3edc4b068e5c7ec41e832c8b419ce2501656ab1bd6f745d7654606e"
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
