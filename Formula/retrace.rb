class Retrace < Formula
  desc "Versatile Security Vulnerability / Bug Discovery Tool"
  homepage "https://github.com/riboseinc/retrace"
  head "https://github.com/riboseinc/retrace.git"
  
  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "cmocka"
  depends_on "openssl"

  devel do
    version '0.9.0'
  end

  def install
    cmocka = Formula["cmocka"]
    openssl = Formula["openssl"]
    
    ENV.append "CFLAGS", "-I#{openssl.opt_include}/"
    ENV.append "LDFLAGS", "-L#{cmocka.opt_lib} -L#{openssl.opt_lib}"
    
    (buildpath/"m4").mkpath

    system "autoreconf", "-ivf"
    system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
    system "make", "install"
  end
end
