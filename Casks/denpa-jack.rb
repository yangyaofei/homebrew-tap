cask "denpa-jack" do
  arch arm: "aarch64"

  version "0.4.0"
  sha256 "23fd73cf0b8af642b12bb58914d45b27778611cf380d451832cef320f8527519"

  url "https://github.com/yangyaofei/denpa-jack/releases/download/v#{version}/Denpa.Jack_#{version}_#{arch}.dmg"
  name "Denpa Jack"
  desc "Push-to-talk voice dictation for macOS: ASR, dictionary/LLM polish, AX/Cmd+V delivery"
  homepage "https://github.com/yangyaofei/denpa-jack"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Denpa Jack.app"

  uninstall quit: "io.github.yangyaofei.denpajack"

  caveats <<~EOS
    Denpa Jack is signed with a stable self-signed certificate (not Apple-notarized).
    If Gatekeeper blocks first launch, allow it in System Settings → Privacy & Security,
    or run:
      xattr -dr com.apple.quarantine "/Applications/Denpa Jack.app"

    Grant Microphone and Accessibility permissions on first run (Screen Recording is
    optional, for screenshot correction context). Upgrades preserve permissions.
  EOS

  zap trash: [
    "~/Library/Application Support/io.github.yangyaofei.denpajack",
  ]
end
