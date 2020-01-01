#!/bin/bash
python3 run_squad.py \
    --model_type kobert \
    --model_name_or_path monologg/kobert \
    --output_dir kobert_output \
    --do_train \
    --do_eval \
    --per_gpu_train_batch_size 16 \
    --per_gpu_eval_batch_size 16 \
    --evaluate_during_training \
    --logging_steps 2000 \
    --save_steps 2000