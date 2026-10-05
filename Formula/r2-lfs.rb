class R2Lfs < Formula
  desc "Git LFS server on Cloudflare Workers and R2, with a CLI to manage LFS objects"
  homepage "https://github.com/ken109/r2-lfs"
  url "https://registry.npmjs.org/r2-lfs/-/r2-lfs-0.5.0.tgz"
  sha256 "dd522c91d33b2fe5651be3c12db0ebeb7a037c2283b1ff0393d11ea986c51e2a"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/r2-lfs --version")
  end
end
