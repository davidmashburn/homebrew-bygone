# typed: strict
# frozen_string_literal: true

# Homebrew formula for the Bygone CLI distribution.
class Bygone < Formula
  desc "Visual diff and file history tool"
  homepage "https://github.com/davidmashburn/bygone"
  url "https://registry.npmjs.org/@davidmashburn/bygone/-/bygone-0.4.0.tgz"
  sha256 "bcfb8cd5cfc2790f34485f09800082599bc5c373a4ec472f7ad03b9aa108066a"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args(prefix: libexec), cached_download
    bin.install_symlink libexec/"bin/bygone"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bygone --version")
  end
end
