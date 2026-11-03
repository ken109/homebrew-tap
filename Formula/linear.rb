class Linear < Formula
  desc "Fast, scriptable command-line client for Linear"
  homepage "https://github.com/ken109/linear"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/linear/releases/download/v0.7.0/linear-0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "f561d723da3037f41162f02e7537740808910e462d7cc5c066777ffe8c04b8d1"
    end
    on_intel do
      url "https://github.com/ken109/linear/releases/download/v0.7.0/linear-0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "1a22fff079fddd91371c5c6bc169d5671e99bfc4cbc9f0b1399f441b19994549"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ken109/linear/releases/download/v0.7.0/linear-0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3429bd36e65174ff62c9ff79b93dc64ff7c5078c70df3676b239ebd545e8e429"
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
