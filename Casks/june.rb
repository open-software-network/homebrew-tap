cask "june" do
  version "0.0.30"
  sha256 "ddc2b1b228b413e5777c96205ba2018e8b7b65e9febd0a40923d4a20bd1ec9d2"

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
