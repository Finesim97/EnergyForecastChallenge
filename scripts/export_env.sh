#!/usr/bin/env bash
set -e

#
# This script creates a environment file using the history and pip-chill
#
eval "$(conda shell.bash hook)"
#https://stackoverflow.com/questions/59895/how-can-i-get-the-source-directory-of-a-bash-script-from-within-the-script-itsel
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

conda env export -p ${SCRIPT_DIR}/../env/ | head -n -1 > ${SCRIPT_DIR}/../exact_environment.yml

conda env export --from-history -p ${SCRIPT_DIR}/../env/ | head -n -1 > ${SCRIPT_DIR}/../environment.yml
echo "  - pip:" >> ${SCRIPT_DIR}/../environment.yml
conda activate ${SCRIPT_DIR}/../env/
# pyspark is manually added, but still found by chill everytime :(
pip-chill  | awk '{print "    - " $0}' | grep -v pyspark  >> ${SCRIPT_DIR}/../environment.yml