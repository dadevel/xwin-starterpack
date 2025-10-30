#include <cstdio>
#include <format>
#include <string>

#if defined(_WIN32)
#include <windows.h>
#pragma comment(lib, "user32")
#pragma comment(lib, "ucrt")
#endif

void greet(char* greeter) {
    static constexpr std::string greeting = "Hello World!";
    const auto text = std::format("{} says: {}", greeter, greeting);
    std::puts(text.data());
#ifdef _WIN32
    MessageBoxA(0, text.data(), "Greeting", MB_OK);
#endif
}

int main([[maybe_unused]] int argc, char* argv[]) {
    greet(argv[0]);
    return 0;
}
