class Libcxx < Formula
  desc "LLVM libc++ and libc++abi"
  homepage "https://libcxx.llvm.org/"
  version "10.0.0"

  url "https://github.com/llvm/llvm-project/releases/download/llvmorg-#{version}/llvm-#{version}.src.tar.xz"
  sha256 "df83a44b3a9a71029049ec101fb0077ecbbdf5fe41e395215025779099a98fdf"

  resource "libcxx" do
    url "https://github.com/llvm/llvm-project/releases/download/llvmorg-#{Libcxx.version}/libcxx-#{Libcxx.version}.src.tar.xz"
    sha256 "270f8a3f176f1981b0f6ab8aa556720988872ec2b48ed3b605d0ced8d09156c7"
  end

  resource "libcxxabi" do
    url "https://github.com/llvm/llvm-project/releases/download/llvmorg-#{Libcxx.version}/libcxxabi-#{Libcxx.version}.src.tar.xz"
    sha256 "e71bac75a88c9dde455ad3f2a2b449bf745eafd41d2d8432253b2964e0ca14e1"
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
