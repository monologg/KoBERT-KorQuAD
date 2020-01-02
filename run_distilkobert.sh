#!/bin/bash
python3 run_squad.py \
    --model_type distilkobert \
    --model_name_or_path monologg/distilkobert \
    --output_dir distilkobert_output \
    --do_train \
    --do_eval \
    --per_gpu_train_batch_size 32 \
    --per_gpu_eval_batch_size 32 \
    --evaluate_during_training \
    --logging_steps 2000 \
    --save_steps 2000 \
    --num_train_epochs 7