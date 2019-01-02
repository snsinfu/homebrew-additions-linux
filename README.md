Linuxbrew additional formulae
=============================

```
brew tap snsinfu/homebrew-additions-linux
```

## Packages

- `libcxx` - Installs libc++ and libc++abi, which have been removed from
  Linuxbrew's `llvm` formula (see [the PR][linuxbrew-pr9758]).
- `amdlibm` - Installs [AMD LibM][amdlibm]. AMD LibM is nonfree. You need to
  accept EULA and download tarball manually into `/tmp` before brewing.

[linuxbrew-pr9758]: https://github.com/Linuxbrew/homebrew-core/pull/9758
[amdlibm]: https://developer.amd.com/amd-cpu-libraries/amd-math-library-libm/

## Caveat

This tap is *not* compatible with Homebrew. Do not tap on mac.
