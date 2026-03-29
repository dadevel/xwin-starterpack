ARG UBUNTU_VERSION=25.10
FROM docker.io/library/ubuntu:$UBUNTU_VERSION
ENV DEBIAN_FRONTEND=noninteractive LC_CTYPE=C.UTF-8
RUN apt-get update && apt-get install -y --no-install-recommends bear ca-certificates curl git git-lfs make nasm

# install clang
ARG CLANG_VERSION=21
RUN apt-get install -y --no-install-recommends clang-$CLANG_VERSION clangd-$CLANG_VERSION clang-tools-$CLANG_VERSION lld-$CLANG_VERSION lldb-$CLANG_VERSION libc++-$CLANG_VERSION-dev llvm-$CLANG_VERSION-dev libclang-rt-$CLANG_VERSION-dev
RUN ln -s /usr/bin/clang-$CLANG_VERSION /usr/local/bin/clang && \
ln -s /usr/bin/clang++-$CLANG_VERSION /usr/local/bin/clang++ && \
ln -s /usr/bin/clangd-$CLANG_VERSION /usr/local/bin/clangd && \
ln -s /usr/bin/clang-cl-$CLANG_VERSION /usr/local/bin/clang-cl && \
ln -s /usr/bin/ld.lld-$CLANG_VERSION /usr/local/bin/ld.lld && \
ln -s /usr/bin/lld-link-$CLANG_VERSION /usr/local/bin/lld-link && \
ln -s /usr/bin/lldb-$CLANG_VERSION /usr/local/bin/lldb && \
ln -s /usr/bin/lldb-dap-$CLANG_VERSION /usr/local/bin/lldb-dap

# install gcc
ARG GCC_VERSION=15
RUN apt-get install -y --no-install-recommends \
g++-$GCC_VERSION-x86-64-linux-gnu binutils-x86-64-linux-gnu \
g++-$GCC_VERSION-i686-linux-gnu binutils-i686-linux-gnu \
g++-$GCC_VERSION-aarch64-linux-gnu binutils-aarch64-linux-gnu
RUN ln -s /usr/bin/x86_64-linux-gnu-gcc-$GCC_VERSION /usr/local/bin/x86_64-linux-gnu-gcc && \
ln -s /usr/bin/x86_64-linux-gnu-g++-$GCC_VERSION /usr/local/bin/x86_64-linux-gnu-g++ && \
ln -s /usr/bin/i686-linux-gnu-gcc-$GCC_VERSION /usr/local/bin/i686-linux-gnu-gcc && \
ln -s /usr/bin/i686-linux-gnu-g++-$GCC_VERSION /usr/local/bin/i686-linux-gnu-g++ && \
ln -s /usr/bin/aarch64-linux-gnu-gcc-$GCC_VERSION /usr/local/bin/aarch64-linux-gnu-gcc && \
ln -s /usr/bin/aarch64-linux-gnu-g++-$GCC_VERSION /usr/local/bin/aarch64-linux-gnu-g++

# install mingw
RUN apt-get install -y --no-install-recommends mingw-w64 gdb-mingw-w64
RUN ln -s /usr/bin/x86_64-w64-mingw32-gcc /usr/local/bin/x86_64-w64-mingw32-gcc && \
ln -s /usr/bin/x86_64-w64-mingw32-g++ /usr/local/bin/x86_64-w64-mingw32-g++ && \
ln -s /usr/bin/i686-w64-mingw32-gcc /usr/local/bin/i686-w64-mingw32-gcc && \
ln -s /usr/bin/i686-w64-mingw32-g++ /usr/local/bin/i686-w64-mingw32-g++

# setup doxygen
RUN apt-get install -y --no-install-recommends doxygen doxygen-awesome-css

# install neovim
RUN curl -fL https://github.com/neovim/neovim/releases/latest/download/nvim-linux-$(uname -m).tar.gz | tar -xz -C /usr/local --strip-components=1 nvim-linux-$(uname -m)
RUN apt-get install -y --no-install-recommends wl-clipboard kitty-terminfo

# download xwin
ARG XWIN_VERSION=0.6.7
RUN curl -sSf -L https://github.com/jake-shadle/xwin/releases/download/$XWIN_VERSION/xwin-$XWIN_VERSION-$(uname -m)-unknown-linux-musl.tar.gz | tar -xz -C /usr/local/bin --strip-components=1 xwin-$XWIN_VERSION-$(uname -m)-unknown-linux-musl/xwin
RUN xwin --accept-license --arch x86 splat --output /opt/xwin/x86
RUN xwin --accept-license --arch x86_64 splat --output opt/xwin/amd64
RUN xwin --accept-license --arch aarch64 splat --output opt/xwin/arm64
