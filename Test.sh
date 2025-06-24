#!/bin/bash
set -eu

enroot import --output /home/reinaae80667/images/python_image.sqsh docker://python:3.11-slim

sbatch <<EOF
#!/bin/bash
#SBATCH --job-name=python_container_job
#SBATCH --output=container_output.log
#SBATCH --ntasks=1
#SBATCH --time=00:05:00
#SBATCH --partition=p0
#SBATCH --container-image=/home/reinaae80667/images/python_image.sqsh
#SBATCH --container-name=python-container

python -c 'print("hallo container")'
EOF