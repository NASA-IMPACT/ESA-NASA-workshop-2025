# TerraTorch Iterate and GEO-Bench-demo

During the demo we will:

1. Add new backbone to TerraTorch and run a simple experiment (i.e. using `terratorch fit ../configs/tiny_backbone.yml`);
2. Use that backbone for HPO and repeat experiments, as per GEO-Bench protocol on one dataset via TerraTorch Iterate (i.e. using `terratorch iterate --repeat --hpo ../configs/tiny_backbone_iterate.yml`);
3. Run the same on a couple of the datasets from GEO-Bench v1 using (`terratorch iterate --repeat --hpo ../configs/tiny_backbone_geobench.yml`)

# Setting up the environment.

(Note: Conda environment should already be prepared for this hands on. However, if the environment is not already setup, please follow the following instructions.)

Before running the following please check if the environment is setup using:

```
source /opt/conda/bin/activate
conda activate geo_bench
```

If this results in an error, please follow the following set of commands to setup the environment.

We need to setup a specific environment because we are pointing to the latest terratorch and terratorch iterate versions directly on git.

```
python -m venv tt-it --system-site-packages
source tt-it/bin/activate
pip install -r requirements.txt
```

# Downloading the data

(Note: Data should already be downloaded into the `datasets` folder. However, if data is not already downloaded, please follow the following instructions.)

We will be using the sen1floods11 dataset as an example dataset for points 1 and 2. Data can be downloaded running the `scripts/sen1floods11_download.sh` or following the below code.

```
cd datasets/sen1floods11
wget -O LabelHand.zip https://ibm.box.com/shared/static/edh42df3513vtqkuxbp8g6eb2jd98xon.zip
unzip LabelHand.zip
rm LabelHand.zip
wget -O Images.zip https://ibm.box.com/shared/static/zzg28xhjgg7thnxjsucd3efpu0b4caaa.zip
unzip Images.zip
rm Images.zip
cd ..
```

For point 3 we will download from GEO-Bench one dataset for classification (`Eurosat`) and one for segmentation (`nz-cattle`). Data can be downloaded running the `scripts/geobench_download.sh` or following the below code.

```
mkdir datasets/geobench-1.0
cd datasets/geobench-1.0
wget -O geobench-1.0.zip https://ibm.box.com/shared/static/xuf8ysyda5t3uhqd69gq8mg5o138u0w8.zip
unzip geobench-1.0.zip
rm geobench-1.0.zip
cd ../..
```