#!/usr/bin/env bash
set -e

#
# This script configures a conda environment with all dependencies
#

#https://stackoverflow.com/questions/59895/how-can-i-get-the-source-directory-of-a-bash-script-from-within-the-script-itsel
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# https://stackoverflow.com/questions/592620/how-can-i-check-if-a-program-exists-from-a-bash-script
if ! command -v mamba &> /dev/null
then
    conda install mamba -n base -c conda-forge
fi

mamba env create -f ${SCRIPT_DIR}/environment.yml -p ${SCRIPT_DIR}/env/ 


eval "$(conda shell.bash hook)"
conda activate ${SCRIPT_DIR}/env/
# Fixes my Apache Spark Setup
conda env config vars set R_LIBS_USER=
conda activate ${SCRIPT_DIR}/env/

python -m ipykernel install --user --name energy_py --display-name "Energy Forecasting Challenge"
