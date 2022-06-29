#!/bin/bash

# Copyright 2020-2021 MicroEJ Corp. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be found with this software.

# 'set_project_env.bat' implementation for ECLIPSE_CDT.

# 'set_project_env' is responsible for
# - checking the availability of required environment variables 
# - setting project local variables for 'build.bat' and 'run.bat' 

DP0=$(readlink -f `dirname $0`)

export ECLIPSE_CDT_INSTALLATION_DIR="/opt/st/stm32cubeide_1.9.0/"
export CUBE_PROGRAMMER_DIR="${HOME}/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin"
export ECLIPSE_CDT_WORKSPACE_DIR="${DP0}/../cdt_workspace/"
export ECLIPSE_CDT_PROJECT_CONFIGURATION="Release"
export ECLIPSE_CDT_EXECUTABLE="stm32cubeide"
export ECLIPSE_CDT_PROJECT_DIR="${DP0}"
export ECLIPSE_CDT_PROJECT_NAME="application"



echo "ECLIPSE_CDT_INSTALLATION_DIR=$ECLIPSE_CDT_INSTALLATION_DIR"
echo "CUBE_PROGRAMMER_DIR=$CUBE_PROGRAMMER_DIR"
echo "ECLIPSE_CDT_PROJECT_DIR=$ECLIPSE_CDT_PROJECT_DIR"
echo "ECLIPSE_CDT_PROJECT_NAME=$ECLIPSE_CDT_PROJECT_NAME"
echo "ECLIPSE_CDT_PROJECT_CONFIGURATION=$ECLIPSE_CDT_PROJECT_CONFIGURATION"
echo "ECLIPSE_CDT_EXECUTABLE=$ECLIPSE_CDT_EXECUTABLE"

