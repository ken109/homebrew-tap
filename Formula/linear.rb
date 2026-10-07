class Linear < Formula
  desc "Fast, scriptable command-line client for Linear"
  homepage "https://github.com/ken109/linear"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/linear/releases/download/v0.5.0/linear-0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "33c83c4807dae47d632ee6d0466f7e1ad3e075638b4abad118963bc2e63e2aa6"
    end
    on_intel do
      url "https://github.com/ken109/linear/releases/download/v0.5.0/linear-0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "6633e5b04a8ea303f400f95cbb29f7ebe75582bc2679c3ac96a6d64d18ae4790"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ken109/linear/releases/download/v0.5.0/linear-0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "35826f6cc1c81bba1cf4f47bf1b8da830fc4f069ee8e4ac306008785e7b94c40"
    end
  end

  def install
    bin.install "linear"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/linear --version")
  end
end
