#!/bin/bash

mkdir "/home/sagemaker-user/ESA-NASA-workshop-2025/Track 3 (Benchmarking)/GEO-Bench-demo/datasets/geobench-1.0/"
cd "/home/sagemaker-user/ESA-NASA-workshop-2025/Track 3 (Benchmarking)/GEO-Bench-demo/datasets/geobench-1.0/"
wget -O geobench-1.0.zip https://ibm.box.com/shared/static/xuf8ysyda5t3uhqd69gq8mg5o138u0w8.zip --no-check-certificate
unzip geobench-1.0.zip
rm geobench-1.0.zip
cd ..
