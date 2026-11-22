class Cdproxy < Formula
  desc "Shared Chrome keeper and session-isolated CDP proxy for AI agents"
  homepage "https://github.com/yangyaofei/cdproxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yangyaofei/cdproxy/releases/download/v0.10.0/cdproxy_0.10.0_darwin_arm64.tar.gz"
      sha256 "53d03a02a2ae63f7c69f14d2bc16fabb5cfa7d7b545de20db3bdfb39568614b1"
    end
    on_intel do
      url "https://github.com/yangyaofei/cdproxy/releases/download/v0.10.0/cdproxy_0.10.0_darwin_amd64.tar.gz"
      sha256 "f46652bca5f77630f364af221f93eed2025a73f6ff856b28d82f77425aacaa84"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yangyaofei/cdproxy/releases/download/v0.10.0/cdproxy_0.10.0_linux_arm64.tar.gz"
      sha256 "d853440463330ebf6524b9444e6722ce7a4fdffc3365cf222b636a0ac872b83f"
    end
    on_intel do
      url "https://github.com/yangyaofei/cdproxy/releases/download/v0.10.0/cdproxy_0.10.0_linux_amd64.tar.gz"
      sha256 "3bd18b120501da928cb56648d80fedbef84089e40c3332809eba109618b121ed"
    end
  end

  def install
    bin.install "cdproxy"
  end

  def caveats
    <<~EOS
      Run `cdproxy serve` to start the shared Chrome keeper and CDP proxy
      (or install the desktop app instead: `brew install --cask cdproxy-desktop`).
      Do not run the CLI daemon and desktop app at the same time on the same ports.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cdproxy --version")
  end
end
