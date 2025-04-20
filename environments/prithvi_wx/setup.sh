# Prepare workshop environment
#!/bin/bash

set -u

# download weights for smaller model
# prepare data downloads
git clone https://github.com/NASA-IMPACT/Prithvi-WxC.git
source /opt/conda/bin/activate

# install PrithviWxC package
conda activate prithvi_wx
cd Prithvi-WxC; pip install ".[example]"

# download small model weights from uah server.
mkdir "/home/sagemaker-user/ESA-NASA-workshop-2025/Track 1 (EO)/Prithvi-WX/notebooks/data/weights/"
wget -O "/home/sagemaker-user/ESA-NASA-workshop-2025/Track 1 (EO)/Prithvi-WX/notebooks/data/weights/prithvi.wxc.rollout.600m.v1.pt" https://www.nsstc.uah.edu/data/sujit.roy/demo/consolidated.pth
