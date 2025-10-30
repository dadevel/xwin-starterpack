ARG UBUNTU_VERSION=25.10
FROM docker.io/library/ubuntu:$UBUNTU_VERSION
ENV DEBIAN_FRONTEND=noninteractive LC_CTYPE=C.UTF-8
RUN apt-get update && apt-get install -y --no-install-recommends build-essential ca-certificates curl git git-lfs neovim
ARG CLANG_VERSION=21
RUN apt-get install -y --no-install-recommends bear clang-$CLANG_VERSION clangd-$CLANG_VERSION lld-$CLANG_VERSION lldb-$CLANG_VERSION libc++-$CLANG_VERSION-dev llvm-$CLANG_VERSION-dev
RUN ln -s /usr/bin/clang-$CLANG_VERSION /usr/local/bin/clang && \
ln -s /usr/bin/clang++-$CLANG_VERSION /usr/local/bin/clang++ && \
ln -s /usr/bin/clangd-$CLANG_VERSION /usr/local/bin/clangd && \
ln -s /usr/bin/ld.lld-$CLANG_VERSION /usr/local/bin/ld.lld && \
ln -s /usr/bin/lld-link-$CLANG_VERSION /usr/local/bin/lld-link && \
ln -s /usr/bin/lldb-$CLANG_VERSION /usr/local/bin/lldb && \
ln -s /usr/bin/lldb-dap-$CLANG_VERSION /usr/local/bin/lldb-dap
