class Linear < Formula
  desc "Fast, scriptable command-line client for Linear"
  homepage "https://github.com/ken109/linear"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/linear/releases/download/v0.3.0/linear-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "de7bf89304fd1dbe67c3ab77850c68fcb11c3314a5c975884e3371c571a3046c"
    end
    on_intel do
      url "https://github.com/ken109/linear/releases/download/v0.3.0/linear-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "eb3887ced73e325147824aabe1e5690d342f07a2c004c10a7854f986597bf564"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ken109/linear/releases/download/v0.3.0/linear-0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "de22ddb1c8fb495e7ce5eea24cc89ef1ea4310650da08e9876ba788fed7487d0"
    end
  end

  def install
    bin.install "linear"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/linear --version")
  end
end
