#!/bin/bash
python3 run_squad.py \
    --model_type kobert \
    --model_name_or_path monologg/kobert \
    --output_dir kobert_ourput \
    --do_train \
    --do_eval