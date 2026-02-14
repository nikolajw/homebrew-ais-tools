class Aisfileloader < Formula
  desc "Filter Automatic Identification System (AIS) CSV data by vessel MMSI"
  homepage "https://github.com/nikolajw/ais-replay"
  license "MIT"
  version "0.3.1"

  on_macos do
    on_arm do
      url "https://github.com/nikolajw/ais-replay/releases/download/v0.3.1/aisreplay-macos-arm64.tar.gz"
      sha256 "8fefcf7ff07cd753c6e9796f206ff549208d2bac6731e2dbc1c5f1cf2c9b9fa0"
    end
    on_intel do
      url "https://github.com/nikolajw/ais-replay/releases/download/v0.3.1/aisreplay-macos-x64.tar.gz"
      sha256 "6fdb470a5981345df828a6b584eb32577066a380eb93c06c15a24651e103269a"
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
