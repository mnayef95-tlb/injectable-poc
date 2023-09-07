#!/bin/bash

# ANSI escape codes for colored output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Find all directories containing pubspec.yaml excluding the root directory
MODULES=$(find . -mindepth 2 -type f -name 'pubspec.yaml' | awk -F'/pubspec.yaml' '{print $1}')

# An array to hold the PIDs of background processes
PIDS=()

for MODULE in $MODULES
do
  echo -e "Running build_runner in $MODULE"

  {
    # Change to the module directory
    cd $MODULE

    # Get the packages
    flutter pub get > pub_get.log 2>&1

    # Run the build runner
    if flutter pub run build_runner build --delete-conflicting-outputs > build_runner.log 2>&1; then
      echo -e "${GREEN}Build runner completed successfully for $MODULE${NC}"
    else
      echo -e "${RED}Build runner failed for $MODULE. Showing logs:${NC}"
      cat pub_get.log build_runner.log
    fi

    # Remove log files
    rm pub_get.log build_runner.log

    # Change back to the root directory
    cd - &>/dev/null

  } &

  # Save the PID of the background process
  PIDS+=($!)
done

# Wait for all background processes to finish
for PID in ${PIDS[@]}
do
  wait $PID
done

# Now run build_runner in the root directory
if [ -f "./pubspec.yaml" ]; then
  echo -e "Running build_runner in the root directory"

  flutter pub get > root_pub_get.log 2>&1

  if flutter pub run build_runner build --delete-conflicting-outputs > root_build_runner.log 2>&1; then
    echo -e "${GREEN}Build runner completed successfully for the root directory${NC}"
  else
    echo -e "${RED}Build runner failed for the root directory. Showing logs:${NC}"
    cat root_pub_get.log root_build_runner.log
  fi

  # Remove log files
  rm root_pub_get.log root_build_runner.log
fi

echo -e "${GREEN}Build runner completed for all modules${NC}"
