class Ufag < Formula
  desc "Ultra fast anagram generator"
  homepage "https://github.com/sliedes/ufag"
  head "https://github.com/sliedes/ufag.git", :revision => "46759e14ef12224d065dbcca7bbcf10bff9f651d"

  depends_on "icu4c" => :build
  depends_on "boost" => :build
  depends_on "llvm" => :build

  def install
    inreplace "ufag.cpp" do |s|
      s.gsub! '"words.txt"', '"' + share/'words.txt"'
    end

    system "make", "ufag"
    bin.install "ufag"
    share.install "words.txt"
  end

  # currently compiles only on Clang 5+
  fails_with :gcc => "7"
  fails_with :clang do
    build 900
    cause "Requires Clang with C++17 support"
  end

  test do
    assert_match /ajot eteni/, shell_output("#{bin}/ufag \"tee jotain\"")
  end
end
