class Linear < Formula
  desc "Fast, scriptable command-line client for Linear"
  homepage "https://github.com/ken109/linear"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/linear/releases/download/v0.8.0/linear-0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "a71b68bf8294af0317998d65491952625e9627d9f55c6e6d500e5e4a17c9858a"
    end
    on_intel do
      url "https://github.com/ken109/linear/releases/download/v0.8.0/linear-0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "ab493e6a4d090651804b9b5da917c5141b0d66af8f76e3efd7df3f8378d2c417"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ken109/linear/releases/download/v0.8.0/linear-0.8.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c64e505198c25b1255d2f85435e8dbed83eb685c2a4701edb9c352d81257f699"
    end
  end

  def install
    bin.install "linear"
    generate_completions_from_executable(bin/"linear", "completions", shells: [:bash, :zsh, :fish])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/linear --version")
  end
end
