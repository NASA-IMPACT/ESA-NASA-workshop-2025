# GEO-Bench-demo

The goal is to have a demo that shows:

1. Add new backbone to TerraTorch and run a simple experiment (i.e. using `terratorch fit tiny_backbone.yml`);
2. Use that backbone for HPO and repeat experiments, as per GEO-Bench protocol on one dataset via TerraTorch Iterate (i.e. using `terratorch iterate --repeat --hpo tiny_backbone_iterate.yml`);
3. Run the same on a couple of the datasets from GEO-Bench v1 using (`terratorch iterate --repeat --hpo tiny_backbone_geobench.yml`)

# Setting up the environment.

```
python -m venv tt-it --system-site-packages
source tt-it/bin/activate
pip install -r requirements.txt
```

# Downloading the data 

We will be using the sen1floods11 dataset as an example dataset for points 1 and 2. Data can be downloaded here.

```
cd datasets/sen1floods11
wget -O LabelHand.zip https://ibm.box.com/shared/static/edh42df3513vtqkuxbp8g6eb2jd98xon.zip
unzip LabelHand.zip
rm LabelHand.zip
wget -O Images.zip https://ibm.box.com/shared/static/zzg28xhjgg7thnxjsucd3efpu0b4caaa.zip
unzip Images.zip
rm Images.zip

```

For point 3 we will download from GEO-Bench one dataset for classification (`Eurosat`) and one for segmentation (`nz-cattle`).

```
python geobench_download.py
```