class Rtl433 < Formula
  desc "Program to decode traffic from Devices that are broadcasting on 433.9 MHz like temperature sensors"
  homepage "https://github.com/merbanan/rtl_433"
  url "https://github.com/merbanan/rtl_433/archive/18.12.tar.gz"
  sha256 "8d9a0d57155430b03d299effd48b43b7e072f49868485f0fc79294a28402d654"

  depends_on "cmake" => :build
  depends_on "librtlsdr"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install" # if this fails, try separate make/make install steps
  end
end
