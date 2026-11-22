cask "cdproxy" do
  arch arm: "arm64"

  version "0.12.0"
  sha256 "de8cc6aa6c31904a26e7698b82cd9f3e814a82382ba4e578f31b0b247b403852"

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
