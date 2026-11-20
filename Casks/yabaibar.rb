cask "yabaibar" do
  version "1.0.0"
  sha256 "2f08b5b3205ea522cf12fa9d787bff8c27157a84ec0de6176549a3ade6702ac8"

  url "https://github.com/remixeco/YabaiBar/releases/download/v#{version}/YabaiBar-#{version}.zip"
  name "YabaiBar"
  desc "Menu bar companion for the yabai tiling window manager"
  homepage "https://github.com/remixeco/YabaiBar"

  depends_on macos: :sonoma

  app "YabaiBar.app"

  # The app is an accessory: it has no Dock icon and no bundle on disk beyond
  # the application itself.
  zap trash: [
    "~/Library/Application Support/com.yabaibar.YabaiBar",
    "~/Library/Caches/com.yabaibar.YabaiBar",
    "~/Library/LaunchAgents/com.yabaibar.yabaibar.plist",
    "~/Library/Preferences/com.yabaibar.YabaiBar.plist",
    "~/Library/Saved Application State/com.yabaibar.YabaiBar.savedState",
  ]

  caveats <<~EOS
    YabaiBar is signed ad-hoc, not notarized by Apple. Homebrew marks the
    download as quarantined, so macOS may refuse the first launch. Right-click
    YabaiBar in /Applications and choose Open, or run once:
      xattr -dr com.apple.quarantine /Applications/YabaiBar.app
  EOS
end
