class ArachnePnr < Formula
  desc "Place and route tool for FPGAs"
  homepage "https://github.com/YosysHQ/arachne-pnr"
  head "https://github.com/YosysHQ/arachne-pnr.git"

  depends_on "icestorm"

  def install
    system "make", "install", "PREFIX=#{prefix}",
      "ICEBOX=#{HOMEBREW_PREFIX}/opt/icestorm/share/icebox"
  end
end
