# typed: strict
# frozen_string_literal: true

cask "bygone-desktop" do
  version "0.10.0"
  sha256 "c8caf48224b1ccc9282413c0851d719ef316bf13bf6b5fc4fe53c7037b3e45e7"

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

  zap trash: [
    "~/Library/Application Support/Bygone",
    "~/Library/Logs/Bygone",
    "~/Library/Preferences/com.davidmashburn.bygone.plist",
    "~/Library/Saved Application State/com.davidmashburn.bygone.savedState",
  ]
end
