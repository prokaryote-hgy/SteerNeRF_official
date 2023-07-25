#!/bin/bash
### README ###
# The bash is used to setup a complete pipeline
# Use best lr setting: "-lr 3e-3 --lr_SR 1e-4" to train

export CUDA_VISIBLE_DEVICES=2

# **The folder** contains GT and pseudo GT: 1100 ref. image and 3300 input pose
export ROOT_DIR=./data_cfg/Synthetic_NeRF

python train.py \
    --root_dir $ROOT_DIR/Chair \
    --exp_name Chair \
    --super_sampling --super_sampling_factor 4 \
    --feature_training \
    --frame_num 3 \
    --sr_model_type unet_feature_slim_multiframe \
    --num_epochs 300 --batch_size 16384 --lr 3e-3 --lr_SR 1e-4 --eval_lpips \
    --training_stage End2End \
    --complete_pipeline --direct_E2E \


