class Aisreplay < Formula
  desc "Replay Automatic Identification System (AIS) vessel tracking data via UDP"
  homepage "https://github.com/nikolajw/ais-replay"
  license "MIT"
  version "0.4.2"
  # Note: AisTools suite archives contain both AisReplay and AisLoader. Install individually with their respective formulas.

  on_macos do
    on_arm do
      url "https://github.com/nikolajw/ais-replay/releases/download/v0.4.2/aistools-macos-arm64.tar.gz"
      sha256 "e8ac97f34f5e12962b045dac3ab04fdf9fb51a613a63ef267ff45dd003e5bdeb"
    end
    on_intel do
      url "https://github.com/nikolajw/ais-replay/releases/download/v0.4.2/aistools-macos-x64.tar.gz"
      sha256 "77ead0ec380a57f8d247a509de2e1b62ad472bb2b38484efaaed6aa93e779b05"
    end
  end

  def install
    bin.install "AisReplay"
  end

  test do
    # Test that the executable exists and can show help
    output = shell_output("#{bin}/AisReplay 2>&1 || true")
    assert_match(/Usage|Error|required/, output)
  end
end