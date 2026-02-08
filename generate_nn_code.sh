#!/bin/bash
mkdir -p generated_files

MODEL="$1"
stedgeai generate --model $MODEL --output generated_files/ --target stm32n6 --st-neural-art default@examples/user_neuralart_STM32N6570-DK.json --input-data-type float32 --output-data-type float32

cp generated_files/network.c generated_files/network_ecblobs.h generated_files/stai_network.c generated_files/stai_network.h Model/