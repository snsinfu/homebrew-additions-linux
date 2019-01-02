class Amdlibm < Formula
  desc "AMD math library"
  homepage "https://developer.amd.com/amd-cpu-libraries/amd-math-library-libm/"
  version "3.2.2"
  sha256 "b62c2571cf611baec6d2b6f01cbfe44460eca13a594747f33962723f0b00099d"
  url "file:///tmp/AMD-LibM-Linux-#{version}.tar.gz"

  def install
    include.install "include/amdlibm.h"
    lib.install "lib/dynamic/libamdlibm.so"
    lib.install "lib/static/libamdlibm.a"
  end
end
