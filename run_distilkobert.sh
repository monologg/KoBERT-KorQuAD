#!/bin/bash
python3 run_squad.py \
    --model_type distilkobert \
    --model_name_or_path monologg/distilkobert \
    --output_dir distilkobert_output \
    --do_train \
    --do_eval