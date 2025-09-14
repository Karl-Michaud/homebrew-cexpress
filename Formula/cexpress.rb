class Cexpress < Formula
  desc "Lightweight HTTP server framework for C (Express.js-like patterns)"
  homepage "https://github.com/Karl-Michaud/CExpress"
  url "https://github.com/Karl-Michaud/CExpress/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
  license "GPL-3.0-or-later"
  version "0.1.0"

  def install
    # ensure Makefile supports PREFIX; install headers & libs into Homebrew prefix
    system "make", "install", "PREFIX=#{prefix}"
    # if your Makefile installs into lib/ and include/, prefix above should work
  end

  test do
    (testpath/"test.c").write <<~EOS
      #include <CExpress/server.h>
      int main(void) { return 0; }
    EOS
    # compile a tiny test that links against the installed library
    system ENV.cc, "test.c", "-I#{include}/CExpress", "-L#{lib}", "-lCExpress", "-o", "test"
    system "./test"
  end
end
