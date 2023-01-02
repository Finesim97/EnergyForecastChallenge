#!/usr/bin/env bash
set -e

#
# This script clears all notebooks in the src folder
#
eval "$(conda shell.bash hook)"
#https://stackoverflow.com/questions/59895/how-can-i-get-the-source-directory-of-a-bash-script-from-within-the-script-itsel
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

eval "$(conda shell.bash hook)"
conda activate ${SCRIPT_DIR}/env/

#papermill  --request-save-on-cell-execute --autosave-cell-every 5  --progress-bar --log-output src/main/R/ExecuteLiteratureQuery.ipynb output/ExecuteLiteratureQuery.ipynb  -p inputdir src/main/data -p outputdir $(pwd)/output
#jupyter nbconvert --to html --embed-images output/ExecuteLiteratureQuery.ipynb
