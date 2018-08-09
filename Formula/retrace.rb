class Retrace < Formula
  desc "Versatile Security Vulnerability / Bug Discovery Tool"
  homepage "https://github.com/riboseinc/retrace"
  head "https://github.com/riboseinc/retrace.git"
  url "https://github.com/riboseinc/retrace/archive/v2.0.1.tar.gz"
  sha256 "9b4036b9943fea5b383747b14de8a58326904d8522b0721f9939581632f7dcf6"
  
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "openssl"

  devel do
    version '2.0.1'
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
