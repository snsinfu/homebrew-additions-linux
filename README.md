Linuxbrew additional formulae
=============================

```
brew tap snsinfu/linuxbrew-additions
```

## Package

- `libcxx` - Installs libc++ and libc++abi, which have been removed from
  Linuxbrew's `llvm` formula (see [the PR][linuxbrew-pr9758]).

[linuxbrew-pr9758]: https://github.com/Linuxbrew/homebrew-core/pull/9758

## Caveat

This tap is *not* compatible with Homebrew. Do not tap on mac.
