class Linear < Formula
  desc "Fast, scriptable command-line client for Linear"
  homepage "https://github.com/ken109/linear"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/linear/releases/download/v0.6.0/linear-0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "852362e70178abbed3828d346aac8ef2288dc16dc1d38048054389713f06d82d"
    end
    on_intel do
      url "https://github.com/ken109/linear/releases/download/v0.6.0/linear-0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "8509e094bd10c24c99718b89ffb4ab3189cf66b219f634fd69e9a85e5643a360"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/ken109/linear/releases/download/v0.6.0/linear-0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "152a67070433b7b1605e7732a8c5906517db0e9185cc385aa2fa1e9b0abb8c1e"
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
