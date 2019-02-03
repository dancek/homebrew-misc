class Tiv < Formula
  desc "Display images in a terminal"
  homepage "https://github.com/stefanhaustein/TerminalImageViewer"
  url "https://github.com/stefanhaustein/TerminalImageViewer/archive/v1.0.0.tar.gz"
  sha256 "d28c5746d25d83ea707db52b54288c4fc1851c642ae021951967e69296450c8c"

  depends_on "imagemagick"

  fails_with :clang do
    cause "experimental/filesystem missing"
  end

  def install
    chdir "src/main/cpp"
    system "make", "CXX=#{ENV.cxx}"
    bin.install "tiv"
  end
end
