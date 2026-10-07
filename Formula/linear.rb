class Linear < Formula
  desc "Fast, scriptable command-line client for Linear"
  homepage "https://github.com/ken109/linear"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/linear/releases/download/v0.1.0/linear-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "c0913f3e19aecf400b3f443973f932ef7bfe04f2d5f58c74817a78d0f3182180"
    end
    on_intel do
      url "https://github.com/ken109/linear/releases/download/v0.1.0/linear-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "da9c4d0453ba3b89d09e590d73a2a1c729ce3f2a03b763b939856d601997ef20"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ken109/linear/releases/download/v0.1.0/linear-0.1.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8ff8dd4f5f1979c7cea12b2915be19b52706c3e44e388e717a0ca56a4d02c3de"
    end
  end

  def install
    bin.install "linear"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/linear --version")
  end
end
