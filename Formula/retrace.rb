class Retrace < Formula
  desc "Versatile Security Vulnerability / Bug Discovery Tool"
  homepage "https://github.com/riboseinc/retrace"
  head "https://github.com/riboseinc/retrace.git"
  url "https://github.com/riboseinc/retrace/archive/v1.0.1.tar.gz"
  sha256 "bb7d951ef7bb97b9856e4c5f9f66339681badae73145dd88d03417b204177cb1"
  
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "openssl"

  devel do
    version '1.0.1'
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
