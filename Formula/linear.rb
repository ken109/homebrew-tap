class Linear < Formula
  desc "Fast, scriptable command-line client for Linear"
  homepage "https://github.com/ken109/linear"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/linear/releases/download/v0.4.0/linear-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "effe8523081f411d43ff810574346672a6c9a02f73f2292c75fb3590ac9eefed"
    end
    on_intel do
      url "https://github.com/ken109/linear/releases/download/v0.4.0/linear-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "87e25f5fdeb5ef713a430a4a8f0e8b590ed291ffe2bb9dc04aa41317ee4dc60c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ken109/linear/releases/download/v0.4.0/linear-0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2c65ebcef0f0939d44c7ebb7184cb65af1e3a3617641c7a31ff76837ebdd98f6"
    end
  end

  def install
    bin.install "linear"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/linear --version")
  end
end
