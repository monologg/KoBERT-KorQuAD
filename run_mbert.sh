#!/bin/bash
python3 run_squad.py \
    --model_type mbert \
    --model_name_or_path bert-base-multilingual-cased \
    --output_dir mbert_output \
    --do_train \
    --do_eval \
    --per_gpu_train_batch_size 32 \
    --per_gpu_eval_batch_size 32 \