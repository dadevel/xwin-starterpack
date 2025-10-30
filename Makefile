CXX := bear -- clang++
CXXFLAGS := -Wall -Wextra -pedantic -std=c++23
CXXFLAGS_LINUX := -target x86_64-pc-linux-gnu -static -fuse-ld=lld
CXXFLAGS_LINUX_DEBUG := -g -Og
CXXFLAGS_LINUX_RELEASE := -Os
CXXFLAGS_WINDOWS := -target x86_64-pc-windows-msvc -nostdlib -nostdinc -isystem./xwin/crt/include -isystem./xwin/sdk/include/ucrt -isystem./xwin/sdk/include/um -isystem./xwin/sdk/include/shared -L./xwin/crt/lib/x86_64 -L./xwin/sdk/lib/ucrt/x86_64 -L./xwin/sdk/lib/um/x86_64 -lmsvcrt -lvcruntime -lucrt -fuse-ld=lld-link -Wl,/subsystem:console,/dynamicbase,/ignore:4099 -D_AMD64_
CXXFLAGS_WINDOWS_DEBUG := -g -Og -gcodeview
CXXFLAGS_WINDOWS_RELEASE := -Os

all: main.dbg.elf main.elf main.dbg.exe main.exe

%.dbg.elf: src/%.cpp
	$(CXX) $(CXXFLAGS) $(CXXFLAGS_LINUX) $(CXXFLAGS_LINUX_DEBUG) $^ -o $@

%.elf: src/%.cpp
	$(CXX) $(CXXFLAGS) $(CXXFLAGS_LINUX) $(CXXFLAGS_LINUX_RELEASE) $^ -o $@

%.dbg.exe: src/%.cpp
	$(CXX) $(CXXFLAGS) $(CXXFLAGS_WINDOWS) $(CXXFLAGS_WINDOWS_DEBUG) $^ -o $@

%.exe: src/%.cpp
	$(CXX) $(CXXFLAGS) $(CXXFLAGS_WINDOWS) $(CXXFLAGS_WINDOWS_RELEASE) $^ -o $@

clean:
	@rm -f ./main.*
