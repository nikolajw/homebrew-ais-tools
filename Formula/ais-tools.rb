class AisTools < Formula
  desc "AIS vessel tracking tools - AisStreamer (replay via UDP) and AisLoader (CSV filter)"
  homepage "https://github.com/nikolajw/ais-tools"
  license "MIT"
  version "0.4.8"

  on_macos do
    on_arm do
      url "https://github.com/nikolajw/ais-tools/releases/download/v0.4.8/aistools-macos-arm64.tar.gz"
      sha256 "68960a3da4416f49eb641caf85948a1f20b669eb676efc5b7c1e378a6d97ce69"
    end
    on_intel do
      url "https://github.com/nikolajw/ais-tools/releases/download/v0.4.8/aistools-macos-x64.tar.gz"
      sha256 "62c0408f4a34f3e6978af997d601ad6a5073dd771acfb014c65c28ae524f0752"
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