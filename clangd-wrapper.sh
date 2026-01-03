#!/bin/bash
# Clangd wrapper to filter out annoying warnings
exec ~/.local/share/nvim/mason/bin/clangd \
  --background-index \
  --clang-tidy \
  --header-insertion=never \
  --completion-style=detailed \
  --function-arg-placeholders \
  --fallback-style=llvm \
  --pch-storage=memory \
  --all-scopes-completion \
  --cross-file-rename \
  --log=error \
  --limit-results=100 \
  --offset-encoding=utf-16 \
  "$@" 2>&1 | grep -v "includes are not stored properly" | grep -v "LIBC_NAMESPACE"