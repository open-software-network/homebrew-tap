cask "june" do
  version "0.0.31"
  sha256 "c533a854a09404e3a47fe8121b8b393e74588a6dacac2e2c40702ae44ad13f7f"

  url "https://github.com/open-software-network/os-june-releases/releases/download/v#{version}/June_universal.dmg",
      verified: "github.com/open-software-network/os-june-releases/"
  name "June"
  desc "AI assistant for meeting notes, dictation, and agent work"
  homepage "https://opensoftware.co/june"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "June.app"

  uninstall launchctl: "ai.hermes.gateway",
            quit:      "co.opensoftware.june"

  zap trash: [
    "~/Library/Application Support/co.opensoftware.june",
    "~/Library/Caches/co.opensoftware.june",
    "~/Library/HTTPStorages/co.opensoftware.june",
    "~/Library/Preferences/co.opensoftware.june.plist",
    "~/Library/Saved Application State/co.opensoftware.june.savedState",
    "~/Library/WebKit/co.opensoftware.june",
  ]
end
