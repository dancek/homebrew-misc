class Fragmentarium < Formula
  desc "IDE for exploring pixel based graphics on the GPU"
  homepage "https://syntopia.github.io/Fragmentarium/"
  url "https://github.com/Syntopia/Fragmentarium/archive/v1.0.0.tar.gz"
  sha256 "49cd5a6c37c5df3e267777bce4139391dff676e6bb40a64db6122ac23dd78f86"
  head "https://github.com/Syntopia/Fragmentarium.git"

  depends_on "qt"

  def install
    cd "Fragmentarium-Source"

    # change Examples directory to match install location
    inreplace "Fragmentarium/GUI/MainWindow.cpp",
              '"Examples/Include;"',
              '"/usr/local/share/fragmentarium/Examples/Include;"'

    inreplace "Fragmentarium/GUI/MainWindow.cpp",
              'QDir(getExamplesDir()).absoluteFilePath("Historical 3D Fractals/Mandelbulb.frag")',
              '"/usr/local/share/fragmentarium/Examples/Historical 3D Fractals/Mandelbulb.frag"'

    system "qmake", "-project", "-o", "Fragmentarium.pro", "-after", "QT += widgets opengl"
    system "qmake"
    system "make"
    prefix.install "Fragmentarium.app"
    (share/"fragmentarium").install "Examples"
  end

  def caveats
    "Examples have been installed at /usr/local/share/fragmentarium/Examples"
  end

  test do
    # check that Fragmentarium.app exists and includes an executable
    assert_match /Mach-O.*executable/,
      shell_output("file #{prefix}/Fragmentarium.app/Contents/MacOS/Fragmentarium")
  end
end
