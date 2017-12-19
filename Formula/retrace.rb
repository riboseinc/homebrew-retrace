class Retrace < Formula
  desc "Versatile Security Vulnerability / Bug Discovery Tool"
  homepage "https://github.com/riboseinc/retrace"
  head "https://github.com/riboseinc/retrace.git"
  url "https://github.com/riboseinc/retrace/archive/v1.0.0.tar.gz"
  sha256 "5a8b0619852a72421cbb37a0c3f68187dab2883090834f3adbc58413519d3f99"
  
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "openssl"

  devel do
    version '1.0.0'
  end

  def install
    (buildpath/"m4").mkpath

    system "autoreconf", "-ivf"
    system "./configure", "--prefix=#{prefix}",
                          "--with-openssl=#{Formula["openssl"].opt_prefix}",
                          "--mandir=#{man}"
    system "make", "install"
  end
end
