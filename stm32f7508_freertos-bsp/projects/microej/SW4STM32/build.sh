#!/bin/bash

# Copyright 2020-2021 MicroEJ Corp. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be found with this software.

# 'build.sh' implementation for Eclipse CDT.

# 'build.sh' is responsible for producing the executable file 
# then copying this executable file to the current directory where it has been executed to a file named 'application.out'

DP0=$(readlink -f `dirname $0`)

. "${DP0}/set_project_env.sh"

# Save application current directory and jump this script's directory
CURRENT_DIRECTORY=$PWD

if [ -f "${CURRENT_DIRECTORY}/${ECLIPSE_CDT_PROJECT_CONFIGURATION}/${ECLIPSE_CDT_PROJECT_NAME}.elf" ]; then
   echo "rm ${CURRENT_DIRECTORY}/${ECLIPSE_CDT_PROJECT_CONFIGURATION}/${ECLIPSE_CDT_PROJECT_NAME}.elf"
   rm "${CURRENT_DIRECTORY}/${ECLIPSE_CDT_PROJECT_CONFIGURATION}/${ECLIPSE_CDT_PROJECT_NAME}.elf" 
fi

cd ${DP0}

if [ -f "${ECLIPSE_CDT_PROJECT_CONFIGURATION}/${ECLIPSE_CDT_PROJECT_NAME}.elf" ]; then
   echo "rm $${ECLIPSE_CDT_PROJECT_CONFIGURATION}/${ECLIPSE_CDT_PROJECT_NAME}.elf"
   rm "${CURRENT_DIRECTORY}/${ECLIPSE_CDT_PROJECT_CONFIGURATION}/${ECLIPSE_CDT_PROJECT_NAME}.elf" 
fi

"$ECLIPSE_CDT_INSTALLATION_DIR/$ECLIPSE_CDT_EXECUTABLE" --launcher.suppressErrors -nosplash -application org.eclipse.cdt.managedbuilder.core.headlessbuild -data "$ECLIPSE_CDT_WORKSPACE_DIR" -import "."

"$ECLIPSE_CDT_INSTALLATION_DIR/$ECLIPSE_CDT_EXECUTABLE" --launcher.suppressErrors -nosplash -application org.eclipse.cdt.managedbuilder.core.headlessbuild -data "$ECLIPSE_CDT_WORKSPACE_DIR" -build "$ECLIPSE_CDT_PROJECT_NAME/$ECLIPSE_CDT_PROJECT_CONFIGURATION"

# copy the generated .elf file
cp $ECLIPSE_CDT_PROJECT_DIR/$ECLIPSE_CDT_PROJECT_CONFIGURATION/$ECLIPSE_CDT_PROJECT_NAME.elf "$CURRENT_DIRECTORY/application.out"

cd ${CURRENT_DIRECTORY}
