class Aisfileloader < Formula
  desc "Filter Automatic Identification System (AIS) CSV data by vessel MMSI"
  homepage "https://github.com/nikolajw/ais-replay"
  license "MIT"
  version "0.3.3"

  on_macos do
    on_arm do
      url "https://github.com/nikolajw/ais-replay/releases/download/v0.3.3/aisreplay-macos-arm64.tar.gz"
      sha256 "1a6f6a15adc3bfa1b2e500933f5b46dc39b5608d8357432b06f5e948ebac8c6f"
    end
    on_intel do
      url "https://github.com/nikolajw/ais-replay/releases/download/v0.3.3/aisreplay-macos-x64.tar.gz"
      sha256 "23aef0333d7193c06a9a960af059a9734ea68fff53c2624a8fbc95f3e8ee01cf"
    end
  end

  def install
    bin.install "AisFileLoader"
  end

  test do
    # Test that the executable exists and can show help
    output = shell_output("#{bin}/AisFileLoader 2>&1 || true")
    assert_match(/Usage|Error|required/, output)
  end
end
