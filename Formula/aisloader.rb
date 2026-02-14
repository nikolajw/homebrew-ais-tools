class Aisloader < Formula
  desc "Filter Automatic Identification System (AIS) CSV data by vessel MMSI"
  homepage "https://github.com/nikolajw/ais-replay"
  license "MIT"
  version "0.4.2"

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
    bin.install "AisLoader"
  end

  test do
    # Test that the executable exists and can show help
    output = shell_output("#{bin}/AisLoader 2>&1 || true")
    assert_match(/Usage|Error|required/, output)
  end
end
