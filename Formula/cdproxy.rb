class Cdproxy < Formula
  desc "Shared Chrome keeper and session-isolated CDP proxy for AI agents"
  homepage "https://github.com/yangyaofei/cdproxy"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yangyaofei/cdproxy/releases/download/v#{version}/cdproxy_#{version}_darwin_arm64.tar.gz"
      sha256 "d8f7d8037422580deba3077d3fb187cfd32cea7b1827d5b6e1e304f63a5c3376"
    end
    on_intel do
      url "https://github.com/yangyaofei/cdproxy/releases/download/v#{version}/cdproxy_#{version}_darwin_amd64.tar.gz"
      sha256 "ecebca6dce133dd00364162bebd7d9266aea89fdd367123f9cf5b73babe8a6fd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yangyaofei/cdproxy/releases/download/v#{version}/cdproxy_#{version}_linux_arm64.tar.gz"
      sha256 "7ed160665453344c6e3c6ec19371c8185a5f7ea91ad83f877d2dba21cb2a6c7b"
    end
    on_intel do
      url "https://github.com/yangyaofei/cdproxy/releases/download/v#{version}/cdproxy_#{version}_linux_amd64.tar.gz"
      sha256 "d224ec636733b70342f29e4e4074515ba6922c8932fd915aec4586e9e82c84ba"
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
