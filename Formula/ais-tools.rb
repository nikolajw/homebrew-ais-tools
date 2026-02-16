class AisTools < Formula
  desc "AIS vessel tracking tools - AisStreamer (replay via UDP) and AisLoader (CSV filter)"
  homepage "https://github.com/nikolajw/ais-replay"
  license "MIT"
  version "0.4.7"

  on_macos do
    on_arm do
      url "https://github.com/nikolajw/ais-replay/releases/download/v0.4.7/aistools-macos-arm64.tar.gz"
      sha256 "2e79cf1481a078d49f4f9f28eae4744fd9d4e9673c6fc5e2fecbc148f0c1690f"
    end
    on_intel do
      url "https://github.com/nikolajw/ais-replay/releases/download/v0.4.7/aistools-macos-x64.tar.gz"
      sha256 "f98c5570374aa396d3e0a2c5d6b101f1a108ea998164a04b55885f2e055e3f34"
    end
  end

  def install
    # Extract architecture-specific directory
    arch_dir = if Hardware::CPU.arm?
      "macos-arm64"
    else
      "macos-x64"
    end

    bin.install "#{arch_dir}/AisStreamer"
    bin.install "#{arch_dir}/AisLoader"
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