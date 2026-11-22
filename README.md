# yangyaofei/homebrew-tap

Personal Homebrew tap for [`cdproxy`](https://github.com/yangyaofei/cdproxy), [`Denpa Jack`](https://github.com/yangyaofei/denpa-jack), and OpenTabletDriver BT.

All apps can be installed in a **single command** — Homebrew automatically adds this tap for you.

## Desktop Apps (Casks)

| App | Description | Single-Command Install |
|---|---|---|
| [`cdproxy`](https://github.com/yangyaofei/cdproxy) | Desktop CDP proxy app for AI agents & browser automation (macOS Apple Silicon) | `brew install --cask yangyaofei/tap/cdproxy` |
| [`denpa-jack`](https://github.com/yangyaofei/denpa-jack) | Push-to-talk voice dictation for macOS: ASR → dictionary/LLM polish → AX/Cmd+V (Apple Silicon) | `brew install --cask yangyaofei/tap/denpa-jack` |
| `otd-bt` | OpenTabletDriver fork with Wacom Bluetooth (CTL-4100WL/6100WL) support + PenAssist plugin | `brew install --cask yangyaofei/tap/otd-bt` |

## Upgrading

```bash
brew upgrade --cask yangyaofei/tap/cdproxy
brew upgrade --cask yangyaofei/tap/denpa-jack
brew upgrade --cask yangyaofei/tap/otd-bt
```

Desktop apps (`cdproxy`, `denpa-jack`, `otd-bt`) use stable self-signed certificates, so upgrades preserve existing macOS TCC permissions (Microphone / Accessibility / Input Monitoring).

## First-Launch Gatekeeper Note

Self-signed apps downloaded outside the Mac App Store may show a Gatekeeper warning on first open. Allow under *System Settings → Privacy & Security → Open Anyway*, or run:

```bash
xattr -dr com.apple.quarantine "/Applications/<App Name>.app"
```
