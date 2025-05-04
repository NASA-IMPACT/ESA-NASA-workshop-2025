#!/bin/bash

export BASE_PATH="/home/sagemaker/ESA-NASA-workshop-2025/Track 3 (Benchmarking)"

export SEN_PATH="${BASE_PATH}/datasets/sen1floods11"
export SEN_LABEL_PATH="${SEN_PATH}/LabelHand.zip"
export SEN_IMAGES_PATH="${SEN_PATH}/Images.zip"

export GEOBENCH_PATH="${BASE_PATH}/datasets/geobench-1.0"
export GEOBENCH_ZIP_PATH="${GEOBENCH_PATH}/geobench-1.0.zip"

mkdir -p "$GEOBENCH_PATH"
mkdir -p "$SEN_PATH"

# function to download files, unzip and remove the zip files after extractions.
function download_files {
    echo "Downloading ${2} into ${1}."
    wget -O "$1" "$2" --no-check-certificate
    unzip "$1" -d "$3"
    rm "$1"
    echo "Downloaded and extracted files to ${3}."
}

# download geobench fiels
download_files "$GEOBENCH_ZIP_PATH" "https://ibm.box.com/shared/static/xuf8ysyda5t3uhqd69gq8mg5o138u0w8.zip" "$GEOBENCH_PATH"

# download sen labels
download_files "$SEN_LABEL_PATH" "https://ibm.box.com/shared/static/edh42df3513vtqkuxbp8g6eb2jd98xon.zip" "$SEN_PATH"

# download sen images
download_files "$SEN_IMAGES_PATH" "https://ibm.box.com/shared/static/zzg28xhjgg7thnxjsucd3efpu0b4caaa.zip" "$SEN_PATH"
