cask "june" do
  version "0.0.34"
  sha256 "7d732e4d0e608015a349888a75cdfc2a8ef17e50a9288ee0abf95f559a97ef94"

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
