cask "cdproxy" do
  arch arm: "arm64"

  version "0.12.4"
  sha256 "2db99743bd43767389a8feae3d7685f6bf2d608d397e62dfc3b1090e4b0f77db"

  url "https://github.com/yangyaofei/cdproxy/releases/download/v#{version}/cdproxy_#{version}_darwin_#{arch}.zip"
  name "cdproxy"
  desc "Desktop CDP proxy app for AI agents and browser automation"
  homepage "https://github.com/yangyaofei/cdproxy"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "cdproxy.app"

  uninstall quit: [
    "com.yangyaofei.cdproxy.desktop",
    "com.yangyaofei.cdproxy",
  ]

  zap trash: [
    "~/.cdproxy",
    "~/Library/Caches/com.yangyaofei.cdproxy.desktop",
    "~/Library/HTTPStorages/com.yangyaofei.cdproxy.desktop",
    "~/Library/Preferences/com.yangyaofei.cdproxy.desktop.plist",
    "~/Library/Saved Application State/com.yangyaofei.cdproxy.desktop.savedState",
    "~/Library/WebKit/com.yangyaofei.cdproxy.desktop",
  ]

  caveats <<~EOS
    cdproxy is signed with a stable self-signed certificate (not Apple-notarized).
    If Gatekeeper blocks first launch, allow it in System Settings → Privacy & Security,
    or run:
      xattr -dr com.apple.quarantine "/Applications/cdproxy.app"
  EOS
end
