# Prepare workshop environment
#!/bin/bash

set -u

# Replace this with the URL of your git repository
export REPOSITORY_URL="https://github.com/nasa-impact/hls-foundation-sagemaker.git"
export PRITHVI_EO_ENV="prithvi_eo"
export PRITHVI_WX_ENV="prithvi_wx"
export LLM_ENV="indus_eve"

if ! [ls -la | grep -q "hls-foundation-sagemaker"]
    then
        git -C /home/sagemaker-user clone $REPOSITORY_URL
fi


for env_name in $PRITHVI_EO_ENV $PRITHVI_WX_ENV $LLM_ENV
do
  # commands to execute for each item
  if conda info --envs | grep -q $env_name
    then
        echo "$env_name already exists"
    else
        source /opt/conda/bin/activate
        conda create -n $env_name python=3.12 -y -q
        # Check if the environment was created successfully
        if [ $? -eq 0 ]; then
          echo "Conda environment '$env_name' created successfully."
        else
          echo "Failed to create conda environment '$env_name'."
          exit 1
        fi
        conda activate $env_name
        pip install ipykernel
        python -m ipykernel install --user --name $env_name --display-name "$env_name"
        pip install -r "hls-foundation-sagemaker/requirements.txt"
  fi
  echo "Conda env: $env_name created"
done
