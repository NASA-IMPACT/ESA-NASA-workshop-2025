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

function weather_setup {
  # download weights for smaller model
  # prepare data downloads
  git clone https://github.com/NASA-IMPACT/Prithvi-WxC.git
  cd Prithvi-WxC; pip install ".[example]"

  # download small model weights from uah server.
  mkdir -p "/home/sagemaker-user/ESA-NASA-workshop-2025/Track 1 (EO)/Prithvi-WX/data/weights/"
  wget -O "/home/sagemaker-user/ESA-NASA-workshop-2025/Track 1 (EO)/Prithvi-WX/data/weights/prithvi.wxc.rollout.600m.v1.pt" https://www.nsstc.uah.edu/data/sujit.roy/demo/consolidated.pth
}

function setup {
  local env_name = "$1"
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
      if [$env_name == "prithvi_wx"]
      then
        weather_setup
      python -m ipykernel install --user --name $env_name --display-name "$env_name"
      conda deactivate
  fi
  echo "Conda env: $env_name created"
}

for env_name in `ls /home/sagemaker-user/ESA-NASA-workshop-2025/environments/`
do
  # commands to execute for each item
  setup $env_name &
done
wait
