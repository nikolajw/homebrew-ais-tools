class AisTools < Formula
  desc "AIS vessel tracking tools - AisStreamer (replay via UDP) and AisLoader (CSV filter)"
  homepage "https://github.com/nikolajw/ais-replay"
  license "MIT"
  version "0.4.6"

  on_macos do
    on_arm do
      url "https://github.com/nikolajw/ais-replay/releases/download/v0.4.6/aistools-macos-arm64.tar.gz"
      sha256 "e8b52bbcd964f1ca8561f7fd2cade3a287b04a4d8af6031143051d64a692b1ea"
    end
    on_intel do
      url "https://github.com/nikolajw/ais-replay/releases/download/v0.4.6/aistools-macos-x64.tar.gz"
      sha256 "e7f7961fdb625954bdf6fa500131effa20cfbec386ae00e0e021082bc975fd36"
    end
  end

  def install
    bin.install "AisStreamer"
    bin.install "AisLoader"
  end

  test do
    # Test AisStreamer
    output = shell_output("#{bin}/AisStreamer 2>&1 || true")
    assert_match(/Usage|Error|required/, output)

    # Test AisLoader
    output = shell_output("#{bin}/AisLoader 2>&1 || true")
    assert_match(/Usage|Error|required/, output)
  end
end