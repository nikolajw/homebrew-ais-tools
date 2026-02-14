class Aisreplay < Formula
  desc "Replay Automatic Identification System (AIS) vessel tracking data"
  homepage "https://github.com/nikolajw/ais-replay"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/nikolajw/ais-replay/releases/download/v0.2.1/aisreplay-macos-arm64.tar.gz"
      sha256 "d474c168765f48c799d9901d18a3f0f90c0ac399e3b7d62574520a40a462ada3"
    end
    on_intel do
      url "https://github.com/nikolajw/ais-replay/releases/download/v0.2.1/aisreplay-macos-x64.tar.gz"
      sha256 "7e6c629a857b9ae2850f41bf492b6a7e9614bd5b1fffc0372415c6b029fd9e87"
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