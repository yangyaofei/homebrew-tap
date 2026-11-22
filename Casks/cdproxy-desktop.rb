cask "cdproxy-desktop" do
  arch arm: "arm64"

  version "0.9.0"
  sha256 "1621fe070f1f5fb594f4198332a604aa1a8421161627777797cbed8bc74790ec"

  url "https://github.com/yangyaofei/cdproxy/releases/download/v#{version}/cdproxy-desktop_#{version}_darwin_#{arch}.zip"
  name "cdproxy"
  desc "Shared Chrome keeper and session-isolated CDP proxy desktop app"
  homepage "https://github.com/yangyaofei/cdproxy"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "cdproxy-desktop.app"

  uninstall quit: "com.yangyaofei.cdproxy.desktop"

  zap trash: "~/agent-browser/proxy"

  caveats <<~EOS
    cdproxy-desktop is signed with a stable self-signed certificate (not Apple-notarized).
    If Gatekeeper blocks first launch, allow it in System Settings → Privacy & Security,
    or run:
      xattr -dr com.apple.quarantine "/Applications/cdproxy-desktop.app"

    Do not run cdproxy-desktop and the CLI daemon (`cdproxy serve`) at the same time
    on the same default ports (9224 / 9225).
  EOS
end
