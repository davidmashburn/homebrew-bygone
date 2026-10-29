# typed: strict
# frozen_string_literal: true

# Homebrew formula for the Bygone CLI distribution.
class Bygone < Formula
  desc "Visual diff and file history tool"
  homepage "https://github.com/davidmashburn/bygone"
  url "https://registry.npmjs.org/@davmash/bygone/-/bygone-0.11.3.tgz"
  version "0.11.3"
  sha256 "1e08eb73cb869df3476ecb883118dc0a65e2cc1ef425ecec6564d93f5dbdccdb"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args(prefix: libexec), cached_download
    bin.install_symlink libexec/"bin/bygone"
    completion_root = libexec/"lib/node_modules/@davmash/bygone/completions"
    zsh_completion.install completion_root/"_bygone"
    bash_completion.install completion_root/"bygone"
    fish_completion.install completion_root/"bygone.fish"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bygone --version")
  end
end
