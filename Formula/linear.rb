class Linear < Formula
  desc "Fast, scriptable command-line client for Linear"
  homepage "https://github.com/ken109/linear"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/linear/releases/download/v0.6.1/linear-0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "2c33aa0c7e31183b3343c6a76be8ce9746ea123e2ebce2c82667ff12ef4b7f31"
    end
    on_intel do
      url "https://github.com/ken109/linear/releases/download/v0.6.1/linear-0.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "d675c9e2b6461c406b1f005f5e651f70a199450185599ae4aef18d0096f13c83"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ken109/linear/releases/download/v0.6.1/linear-0.6.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6b196f308639406b24398b67b657df1ca63eb6f7cc4b41290371e1109b6edb0f"
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
