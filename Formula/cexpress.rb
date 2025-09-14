class Cexpress < Formula
  desc "Lightweight HTTP server framework for C (Express.js-like patterns)"
  homepage "https://github.com/Karl-Michaud/CExpress"
  url "https://github.com/Karl-Michaud/CExpress/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "7ac1ecbe5f5985dafd8cb5e57292440629103c4a678a14f3f01ee708a0daaf3a"
  license "GPL-3.0-or-later"
  version "1.0.0"

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
