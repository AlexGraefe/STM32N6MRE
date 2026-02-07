# Compile
Run:
```bash
# Example for a terminal environment
cmake -S . -B build -DCMAKE_TOOLCHAIN_FILE=gcc-arm-none-eabi.cmake -DCMAKE_BUILD_TYPE=Debug
```
to configure cmake

Run:
```bash
cmake --build build
```
to compile

Alternative: Using Cmake tools in vscode: Just open and it will ask you to select a preset. Select debug.

# Program FSBL
Connect the board, set it to development mode (Boot0=0, Boot1=1) and reset. Run:
```bash
./program.sh
```
Set the board to bootloader mode (Boot0=0, Boot1=0) and reset. FSBL should now run. On the STM32N6570-DK LED2 should turn on, when the FSBL is active.
