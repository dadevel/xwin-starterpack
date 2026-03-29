CXX := bear -- clang++
CXXFLAGS := -Wall -Wextra -pedantic -std=c++23 -I./include

CXXFLAGS_LINUX_X86 := -target i386-linux-gnu -fuse-ld=lld
CXXFLAGS_LINUX_AMD64 := -target x86_64-linux-gnu -fuse-ld=lld
CXXFLAGS_LINUX_ARM64 := -target aarch64-linux-gnu -fuse-ld=lld
CXXFLAGS_LINUX_DEBUG := -g -Og  # -fsanitize=address -fno-omit-frame-pointer -fsanitize=undefined
CXXFLAGS_LINUX_RELEASE := -O2 -s -static

CXXFLAGS_WINDOWS_X86 := -target i386-pc-windows-msvc -nostdlib -nostdinc -isystem/opt/xwin/x86/crt/include -isystem/opt/xwin/x86/sdk/include/ucrt -isystem/opt/xwin/x86/sdk/include/um -isystem/opt/xwin/x86/sdk/include/shared -L/opt/xwin/x86/crt/lib/x86 -L/opt/xwin/x86/sdk/lib/ucrt/x86 -L/opt/xwin/x86/sdk/lib/um/x86 -lmsvcrt -lvcruntime -lucrt -fuse-ld=lld-link -Wl,/subsystem:console,/dynamicbase,/ignore:4099
CXXFLAGS_WINDOWS_AMD64 := -target x86_64-pc-windows-msvc -nostdlib -nostdinc -isystem/opt/xwin/amd64/crt/include -isystem/opt/xwin/amd64/sdk/include/ucrt -isystem/opt/xwin/amd64/sdk/include/um -isystem/opt/xwin/amd64/sdk/include/shared -L/opt/xwin/amd64/crt/lib/x86_64 -L/opt/xwin/amd64/sdk/lib/ucrt/x86_64 -L/opt/xwin/amd64/sdk/lib/um/x86_64 -lmsvcrt -lvcruntime -lucrt -fuse-ld=lld-link -Wl,/subsystem:console,/dynamicbase,/ignore:4099
CXXFLAGS_WINDOWS_ARM64 := -target aarch64-pc-windows-msvc -nostdlib -nostdinc -isystem/opt/xwin/arm64/crt/include -isystem/opt/xwin/arm64/sdk/include/ucrt -isystem/opt/xwin/arm64/sdk/include/um -isystem/opt/xwin/arm64/sdk/include/shared -L/opt/xwin/arm64/crt/lib/aarch64 -L/opt/xwin/arm64/sdk/lib/ucrt/aarch64 -L/opt/xwin/arm64/sdk/lib/um/aarch64 -lmsvcrt -lvcruntime -lucrt -fuse-ld=lld-link -Wl,/subsystem:console,/dynamicbase,/ignore:4099
CXXFLAGS_WINDOWS_DEBUG := -g -Og -gcodeview
CXXFLAGS_WINDOWS_RELEASE := -O2

all: out/main.x86.dbg.elf out/main.x86.elf out/main.amd64.dbg.elf out/main.amd64.elf out/main.arm64.dbg.elf out/main.arm64.elf out/main.x86.dbg.exe out/main.x86.exe out/main.amd64.dbg.exe out/main.amd64.exe out/main.arm64.dbg.exe out/main.arm64.exe


out/%.x86.dbg.elf: src/%.cpp
	$(CXX) $(CXXFLAGS) $(CXXFLAGS_LINUX_X86) $(CXXFLAGS_LINUX_DEBUG) $^ -o $@

out/%.x86.elf: src/%.cpp
	$(CXX) $(CXXFLAGS) $(CXXFLAGS_LINUX_X86) $(CXXFLAGS_LINUX_RELEASE) $^ -o $@

out/%.amd64.dbg.elf: src/%.cpp
	$(CXX) $(CXXFLAGS) $(CXXFLAGS_LINUX_AMD64) $(CXXFLAGS_LINUX_DEBUG) $^ -o $@

out/%.amd64.elf: src/%.cpp
	$(CXX) $(CXXFLAGS) $(CXXFLAGS_LINUX_AMD64) $(CXXFLAGS_LINUX_RELEASE) $^ -o $@

out/%.arm64.dbg.elf: src/%.cpp
	$(CXX) $(CXXFLAGS) $(CXXFLAGS_LINUX_ARM64) $(CXXFLAGS_LINUX_DEBUG) $^ -o $@

out/%.arm64.elf: src/%.cpp
	$(CXX) $(CXXFLAGS) $(CXXFLAGS_LINUX_ARM64) $(CXXFLAGS_LINUX_RELEASE) $^ -o $@


out/%.x86.dbg.exe: src/%.cpp
	$(CXX) $(CXXFLAGS) $(CXXFLAGS_WINDOWS_X86) $(CXXFLAGS_WINDOWS_DEBUG) $^ -o $@

out/%.x86.exe: src/%.cpp
	$(CXX) $(CXXFLAGS) $(CXXFLAGS_WINDOWS_X86) $(CXXFLAGS_WINDOWS_RELEASE) $^ -o $@

out/%.amd64.dbg.exe: src/%.cpp
	$(CXX) $(CXXFLAGS) $(CXXFLAGS_WINDOWS_AMD64) $(CXXFLAGS_WINDOWS_DEBUG) $^ -o $@

out/%.amd64.exe: src/%.cpp
	$(CXX) $(CXXFLAGS) $(CXXFLAGS_WINDOWS_AMD64) $(CXXFLAGS_WINDOWS_RELEASE) $^ -o $@

out/%.arm64.dbg.exe: src/%.cpp
	$(CXX) $(CXXFLAGS) $(CXXFLAGS_WINDOWS_ARM64) $(CXXFLAGS_WINDOWS_DEBUG) $^ -o $@

out/%.arm64.exe: src/%.cpp
	$(CXX) $(CXXFLAGS) $(CXXFLAGS_WINDOWS_ARM64) $(CXXFLAGS_WINDOWS_RELEASE) $^ -o $@


clean:
	@rm -f ./out/*
