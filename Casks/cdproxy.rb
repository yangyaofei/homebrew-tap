cask "cdproxy" do
  arch arm: "arm64"

  version "0.11.0"
  sha256 "e59ef5d262967dabe3a002e6e5ca35001c41f4a27d281b649603fc4a597f07aa"

  url "https://github.com/yangyaofei/cdproxy/releases/download/v#{version}/cdproxy-desktop_#{version}_darwin_#{arch}.zip"
  name "cdproxy"
  desc "Desktop CDP proxy app for AI agents and browser automation"
  homepage "https://github.com/yangyaofei/cdproxy"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "cdproxy-desktop.app"

  uninstall quit: "com.yangyaofei.cdproxy.desktop"

  zap trash: "~/.cdproxy"

  caveats <<~EOS
    cdproxy is signed with a stable self-signed certificate (not Apple-notarized).
    If Gatekeeper blocks first launch, allow it in System Settings → Privacy & Security,
    or run:
      xattr -dr com.apple.quarantine "/Applications/cdproxy-desktop.app"
  EOS
end
