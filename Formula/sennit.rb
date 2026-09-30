class Sennit < Formula
  desc "Dotfiles manager with symlink semantics, templating, and drift detection"
  homepage "https://github.com/ken109/sennit"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.18.2/sennit-aarch64-apple-darwin.tar.gz"
      sha256 "58c0dfad79228370f69becb765c13a92c35eb6091fe960a7c2ad2fc60ec629ae"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.18.2/sennit-x86_64-apple-darwin.tar.gz"
      sha256 "d3b62378a04ad3401022dfc59502fc7bc798e737379a40bd508c49793ed10b55"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ken109/sennit/releases/download/v0.18.2/sennit-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bae9f399d55c8c8628cea79be906083f437f9f7b021d219204a212f82d33434a"
    end
    on_intel do
      url "https://github.com/ken109/sennit/releases/download/v0.18.2/sennit-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "367834b09ec98856ec1a221ebb6cb1d0aa4b6a6cdd54ef56eedb75b5de31556a"
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
