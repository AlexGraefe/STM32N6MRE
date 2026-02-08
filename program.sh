#!/bin/bash
set -euo pipefail

run() {
    "$@" || {
        echo ""
        echo -e "\033[0;31mError: Failed to run: $*.\033[0m" >&2
        exit 1
    }
}

run STM32_Programmer_CLI -c port=SWD -d ./FSBL/ai_fsbl.hex -el /usr/local/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin/ExternalLoader/MX66UW1G45G_STM32N6570-DK.stldr
run STM32_Programmer_CLI -c port=SWD -d ./build/Debug/Appli-trusted.bin 0x70100000 -el /usr/local/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin/ExternalLoader/MX66UW1G45G_STM32N6570-DK.stldr
run arm-none-eabi-objcopy -I binary generated_files/network_atonbuf.xSPI2.raw --change-addresses 0x70380000 -O ihex generated_files/network_data.hex
run STM32_Programmer_CLI -c port=SWD -d generated_files/network_data.hex -el /usr/local/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin/ExternalLoader/MX66UW1G45G_STM32N6570-DK.stldr

echo ""
echo -e "\033[0;32mSuccessfully wrote FSBL and application binaries into memory!\033[0m"
