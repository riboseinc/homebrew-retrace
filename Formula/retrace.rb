class Retrace < Formula
  desc "Versatile Security Vulnerability / Bug Discovery Tool"
  homepage "https://github.com/riboseinc/retrace"
  head "https://github.com/riboseinc/retrace.git"
  url "https://github.com/riboseinc/retrace/archive/v1.0.2.tar.gz"
  sha256 "299faba3894f1283b5e0d1700bb313a240b671d934b107acc9d9d61ef68e211c"
  
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "openssl"

  devel do
    version '1.0.2'
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
