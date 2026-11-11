# typed: strict
# frozen_string_literal: true

cask "bygone-desktop" do
  version "0.13.3"
  sha256 "777efb862a116a4a2fc38d65583be8dcc2b61ed3dc3152744880da09705a00de"

  url "https://github.com/davidmashburn/bygone/releases/download/v#{version}/Bygone-#{version}-arm64.dmg"
  name "Bygone"
  desc "Visual diff and file history desktop app"
  homepage "https://github.com/davidmashburn/bygone"

  depends_on :macos

  app "Bygone.app"
  binary "#{appdir}/Bygone.app/Contents/Resources/bygone-launcher.sh", target: "bygone"
  artifact "Bygone.app/Contents/Resources/completions/_bygone",
           target: "#{HOMEBREW_PREFIX}/share/zsh/site-functions/_bygone"
  artifact "Bygone.app/Contents/Resources/completions/bygone",
           target: "#{HOMEBREW_PREFIX}/etc/bash_completion.d/bygone"
  artifact "Bygone.app/Contents/Resources/completions/bygone.fish",
           target: "#{HOMEBREW_PREFIX}/share/fish/vendor_completions.d/bygone.fish"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Bygone.app"],
        sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Bygone",
    "~/Library/Logs/Bygone",
    "~/Library/Preferences/com.davidmashburn.bygone.plist",
    "~/Library/Saved Application State/com.davidmashburn.bygone.savedState",
  ]

  caveats <<~EOS
    Bygone is unsigned and not notarized. This cask removes the macOS quarantine
    attribute from Bygone.app so it can launch.
    Only install it if you trust the source.
  EOS
end
