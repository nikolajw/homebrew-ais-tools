class Aisloader < Formula
  desc "Filter Automatic Identification System (AIS) CSV data by vessel MMSI"
  homepage "https://github.com/nikolajw/ais-replay"
  license "MIT"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/nikolajw/ais-replay/releases/download/v0.4.0/aistools-macos-arm64.tar.gz"
      sha256 "937d93aa12c1c1b6b9ac2f6d05eaa65d0aa36aa6b2d348aa263921015537227e"
    end
    on_intel do
      url "https://github.com/nikolajw/ais-replay/releases/download/v0.4.0/aistools-macos-x64.tar.gz"
      sha256 "9aa0bc65b3ac7f61477f35803d3bbfdb38e54934dc398d773748ae9fc958c7fc"
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
