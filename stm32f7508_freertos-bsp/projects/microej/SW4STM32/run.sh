#!/bin/bash

# Copyright 2020 MicroEJ Corp. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be found with this software.

# 'run.sh' implementation for STM32CubeIDE.

# 'run.sh' is responsible for flashing the executable file on the target device 
# then resetting target device

# Reset ERRORLEVEL between multiple run in the same shell
ERRORLEVEL=0
DP0=$(readlink -f `dirname $0`)

if [ -z "$1"]; then
    APPLICATION_FILE="${PWD}/application.out"
else
    APPLICATION_FILE="$(readlink -f `dirname $1`)"
fi

if [ ! -f "${APPLICATION_FILE}" ]; then
	echo "FAILED - file ${APPLICATION_FILE} does not exist"
	exit  1
fi

. "${DP0}/set_project_env.sh"

# Uncomment (delete REM) the definition below and adjust the path for STM32_Programmer_CLI
#CUBEPROGRAMMER_DIR="${ECLIPSE_CDT_INSTALLATION_DIR}/plugins/com.st.stm32cube.ide.mcu.externaltools.cubeprogrammer.win32_2.0.200.202202231230/tools/bin"
if [ -z "$CUBE_PROGRAMMER_DIR" ]; then
	echo "The CUBE_PROGRAMMER_DIR path for STM32_Programmer_CLI is not set"
	exit 1
fi

arm-none-eabi-objcopy -O ihex "${APPLICATION_FILE}" "${APPLICATION_FILE}.hex"
"${CUBE_PROGRAMMER_DIR}/STM32_Programmer_CLI" -c port=SWD mode=UR -w "${APPLICATION_FILE}.hex" -el "${CUBE_PROGRAMMER_DIR}/ExternalLoader/N25Q128A_STM32F7508-DISCO.stldr" -rst
