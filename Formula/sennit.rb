class Sennit < Formula
  desc "Dotfiles manager with symlink semantics, templating, and drift detection"
  homepage "https://github.com/ken109/sennit"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.22.0/sennit-aarch64-apple-darwin.tar.gz"
      sha256 "f767dc3e1ff1d3e23b15dc714497e7a03f2e7ca2c7cfba2eb6312711eff11da4"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.22.0/sennit-x86_64-apple-darwin.tar.gz"
      sha256 "48964340ea283b4a2abefbea74be62ddd09570db207e8fa3c27ea2f799d09904"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.22.0/sennit-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3f0d663e6095e6b3cff0797f495749c719f64a1f7a160a6fdb47a7d0c12bc6ab"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.22.0/sennit-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a067549c3d2dac35c974026c084b87e3f25ae07f426e7927e567bdef12c04c3c"
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
