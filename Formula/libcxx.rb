class Libcxx < Formula
  desc "LLVM libc++ and libc++abi"
  homepage "https://libcxx.llvm.org/"
  version "7.0.1"

  url "https://releases.llvm.org/7.0.1/llvm-7.0.1.src.tar.xz"
  sha256 "a38dfc4db47102ec79dcc2aa61e93722c5f6f06f0a961073bd84b78fb949419b"

  resource "libcxx" do
    url "https://releases.llvm.org/7.0.1/libcxx-7.0.1.src.tar.xz"
    sha256 "020002618b319dc2a8ba1f2cba88b8cc6a209005ed8ad29f9de0c562c6ebb9f1"
  end

  resource "libcxxabi" do
    url "https://releases.llvm.org/7.0.1/libcxxabi-7.0.1.src.tar.xz"
    sha256 "8168903a157ca7ab8423d3b974eaa497230b1564ceb57260be2bd14412e8ded8"
  end

  depends_on "cmake" => :build
  depends_on "llvm" => :build

  def install
    (buildpath/"projects/libcxx").install resource("libcxx")
    (buildpath/"projects/libcxxabi").install resource("libcxxabi")

    mkdir "build" do
      args = %W[
        -DCMAKE_C_COMPILER=clang
        -DCMAKE_CXX_COMPILER=clang++
      ]
      system "cmake", "-G", "Unix Makefiles", "..", *(std_cmake_args + args)
      system "make", "cxxabi"
      system "make", "cxx"
      system "make", "install-cxx", "install-cxxabi"
    end
  end
end
