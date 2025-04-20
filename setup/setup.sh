# Prepare workshop environment
#!/bin/bash

set -u

# Replace this with the URL of your git repository
export REPOSITORY_URL="https://github.com/nasa-impact/ESA-NASA-workshop-2025.git"
export PRITHVI_EO_ENV="prithvi_eo"
export PRITHVI_WX_ENV="prithvi_wx"
export LLM_ENV="indus_eve"

if ! `ls -la | grep -q "ESA-NASA-workshop-2025"`
    then
        git -C /home/sagemaker-user clone $REPOSITORY_URL
fi

export QDRANT_URL='https://e186510c-4dd9-45c7-99a5-ae38c4c8bc36.us-east-1-0.aws.cloud.qdrant.io:6333'
export API_KEY='rZYblMkzsiqiiuPqxXxmckfyMFIZ9Yg9EpxYxhbeFZj82MEOIbT5Fg'

for env_name in `ls /home/sagemaker-user/ESA-NASA-workshop-2025/environments/`
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
        pip install -r "/home/sagemaker-user/ESA-NASA-workshop-2025/environments/$env_name/requirements.txt"
        source "/home/sagemaker-user/ESA-NASA-workshop-2025/environments/$env_name/setup.sh"
        python -m ipykernel install --user --name $env_name --display-name "$env_name"
        conda deactivate $env_name
  fi
  echo "Conda env: $env_name created"
done
