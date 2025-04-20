# Prepare workshop environment
#!/bin/bash

set -u


# download multi-temporal crop dataset from huggingface
# download burnscars dataset from huggingface
# download proper 300m weight files for both models
# store files in
track 1> Prithvi-eo > data > burnscars
track 1> Prithvi-eo > data > multi-temporal-crop-classification
track 1> Prithvi-eo > data > weights > burnscars_model
track 1> Prithvi-eo > data > weights > crop_model

