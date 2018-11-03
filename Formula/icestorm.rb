class Icestorm < Formula
  desc "Lattice iCE40 FPGAs Bitstream Tools"
  homepage "http://www.clifford.at/icestorm/"
  head "https://github.com/cliffordwolf/icestorm.git"

  depends_on "python"

  def install
    system "make", "install", "PREFIX=#{prefix}"
  end
end
