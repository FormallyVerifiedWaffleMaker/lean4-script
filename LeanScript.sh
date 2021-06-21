#!/bin/bash

REPO_URL='https://github.com/leanprover/lean4.git'

RED='\033[0;31m'
RESET='\033[0m'

printError () {
  printf "${RED}Error:${RESET} $1\n"
}

cat << END
This script downloads and compiles Lean 4 inside a directory of your choice.
It assumes that you have already installed Git, GMP, and other dependencies as described in the Lean 4 documentation.
Note that this script creates one new directory inside the directory you choose.
If a subdirectory is already present, this script overwrites it, with your permission.
END

directoryChoice="$1"
overwriteChoice="$2"

if [[ -z $directoryChoice ]]; then
  printError "Please specify a directory."
  exit 1
fi

if [[ $directoryChoice = *" "* ]]; then
  printError "Please specify a directory with no spaces in its path, as Make does not support it."
  exit 1
fi

cd $directoryChoice

if [[ -e "./lean4" ]]; then
  if [[ $overwriteChoice != "--overwrite" ]]; then
    printError "There is a subdirectory named lean4. Specify --overwrite to allow the script to overwrite it."
    exit 1
  fi

  rm -rf lean4
fi

git clone $REPO_URL lean4
