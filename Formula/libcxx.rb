class Libcxx < Formula
  desc "LLVM libc++ and libc++abi"
  homepage "https://libcxx.llvm.org/"
  version "8.0.0"

  url "https://releases.llvm.org/8.0.0/llvm-8.0.0.src.tar.xz"
  sha256 "8872be1b12c61450cacc82b3d153eab02be2546ef34fa3580ed14137bb26224c"

  resource "libcxx" do
    url "https://releases.llvm.org/8.0.0/libcxx-8.0.0.src.tar.xz"
    sha256 "c2902675e7c84324fb2c1e45489220f250ede016cc3117186785d9dc291f9de2"
  end

  resource "libcxxabi" do
    url "https://releases.llvm.org/8.0.0/libcxxabi-8.0.0.src.tar.xz"
    sha256 "c2d6de9629f7c072ac20ada776374e9e3168142f20a46cdb9d6df973922b07cd"
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
