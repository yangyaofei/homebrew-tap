# yangyaofei/homebrew-tap

Personal Homebrew tap for [`cdproxy`](https://github.com/yangyaofei/cdproxy), [`Denpa Jack`](https://github.com/yangyaofei/denpa-jack), and OpenTabletDriver BT.

## Usage

```bash
brew tap yangyaofei/tap
```

### Formulas (CLI)

| Package | Description | Install |
|---|---|---|
| [`cdproxy`](https://github.com/yangyaofei/cdproxy) | Shared Chrome keeper & session-isolated CDP proxy CLI (macOS / Linux) | `brew install cdproxy` |

### Casks (macOS Desktop Apps)

| Package | Description | Install |
|---|---|---|
| [`cdproxy-desktop`](https://github.com/yangyaofei/cdproxy) | cdproxy Wails v3 desktop app with tray menu & bundled `agent-browser` (Apple Silicon) | `brew install --cask cdproxy-desktop` |
| [`denpa-jack`](https://github.com/yangyaofei/denpa-jack) | Push-to-talk voice dictation for macOS: ASR → dictionary/LLM polish → AX/Cmd+V (Apple Silicon) | `brew install --cask denpa-jack` |
| `otd-bt` | OpenTabletDriver fork with Wacom Bluetooth (CTL-4100WL/6100WL) support + PenAssist plugin | `brew install --cask otd-bt` |

## Upgrading

```bash
brew upgrade cdproxy
brew upgrade --cask cdproxy-desktop
brew upgrade --cask denpa-jack
brew upgrade --cask otd-bt
```

Desktop apps (`cdproxy-desktop`, `denpa-jack`, `otd-bt`) use stable self-signed certificates, so upgrades preserve existing macOS TCC permissions (Microphone / Accessibility / Input Monitoring).

## First-Launch Gatekeeper Note

Self-signed apps downloaded outside the Mac App Store may show a Gatekeeper warning on first open. Allow under *System Settings → Privacy & Security → Open Anyway*, or run:

```bash
xattr -dr com.apple.quarantine "/Applications/<App Name>.app"
```
