class Sennit < Formula
  desc "Dotfiles manager with symlink semantics, templating, and drift detection"
  homepage "https://github.com/ken109/sennit"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.19.0/sennit-aarch64-apple-darwin.tar.gz"
      sha256 "904105820433b19d6d168727955c6fd493b15eab8f6eba03af8a0f67b0b85e2d"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.19.0/sennit-x86_64-apple-darwin.tar.gz"
      sha256 "cd4f7193566eb24cd6a8d921ed43cb98a7d98f09ec80103168870c0c48be3adf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.19.0/sennit-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "04cb73c33457add736e3621fc6a8cf0d86c3dedd6d435e9de516885e5ad3d9ab"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.19.0/sennit-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "13624829acc76d084b0db7e8479ae27dfcf282ead0b309727320b8a523f866bd"
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
