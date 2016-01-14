class Gnokii < Formula
  desc "tools and a user space driver for use with mobile phones"
  homepage "http://gnokii.org/"
  url "http://www.gnokii.org/download/gnokii/0.6.x/gnokii-0.6.31.tar.bz2"
  sha256 "8f5a083b05c1a66a3402ca5cd80084e14c2c0632c991bb53b03c78e9adb02501"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "glib" => :build
  depends_on "gettext" => :build
  depends_on "intltool" => :build
  depends_on "pkg-config" => :build
  depends_on "libusb"
  depends_on "readline"

  head do
    url "http://www.gnokii.org/download/gnokii/0.6.x/gnokii-0.6.31.tar.bz2"
  end

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-bluetooth"
    system "make"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test gnokii`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
