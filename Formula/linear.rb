class Linear < Formula
  desc "Fast, scriptable command-line client for Linear"
  homepage "https://github.com/ken109/linear"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/linear/releases/download/v0.2.0/linear-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "2fedaa4a3dfacc88a8de0b9c9a5d57d2104124286701a4e0e2ae5a350ee6231f"
    end
    on_intel do
      url "https://github.com/ken109/linear/releases/download/v0.2.0/linear-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "fa4121efb442bd886e3700682b85f9d6b7b25030ab2dc95b2b58cff9890dea29"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ken109/linear/releases/download/v0.2.0/linear-0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ee09942b7657d1ff65f675ca34c4ac3ffcfc79c8fb3fe558d3dd2d8a7a339941"
    end
  end

  def install
    bin.install "linear"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/linear --version")
  end
end
