# Installation
1. Install STM32CubeCLT: https://www.st.com/en/development-tools/stm32cubeclt.html
2. Install STEdgeAi-Core: https://www.st.com/en/development-tools/stedgeai-core.html
3. Install VSCode and in VSCode, the CMakeTools and C/C++ extension.
4. Reopen VSCode. It should ask you to select a configure preset. Select Debug. If it does not show, enter ctrl + shift + P and search for CMake: Select Configure Preset. Press enter and select Debug.
4. Generate a virtual environment with Python 3.12 (tested version, others might also work):
    ```bash
    python3.12 -m venv ./venv
    ```
5. Activate the virtual environment
    ```bash
    source ./venv/bin/activate
    ```
6. Install torch: https://pytorch.org/get-started/locally/
7. Install the requirements
    ```bash
    pip install -r requirements.txt
    ```

# Run a simple example:
1. Activate the virtual environment
    ```bash
    source ./venv/bin/activate
    ```
2. Generate the .onnx file of a simple neural network
    ```bash
    python -m examples.simple_fc
    ```
3. Generate the nn files
    ```bash
    ./generate_nn_code.sh generated_files/simple_fc_quant.onnx
    ```
4. Press the Build button on the bottom left part of your VSCode window. This will compile the project and also automatically sign the binary. For a clean rebuild, type ctrl + shift + P and search for CMake: Claen Rebuild.
5. Program the STM32N6. Set Boot1 to 1 and reset
    ```bash
    ./program.sh
    ```
    Set Boot 1 to 0 and reset.
6. Open a serial terminal and connect to the STM32N6 (baudrate 115200). You should see some prints.

# How to use peripherals.
Use CubeMX to generate the code to initialize the peripherals and then copy it. In [`./Core/Inc/stm32n6xx_hal_conf.h`](./Core/Inc/stm32n6xx_hal_conf.h) uncomment the line #define HAL_<peripherl>_MODULE_ENABLED
