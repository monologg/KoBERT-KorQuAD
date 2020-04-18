#!/bin/bash
python3 run_squad.py --model_type koelectra-small \
                       --model_name_or_path monologg/koelectra-small-discriminator \
                       --output_dir models \
                       --data_dir data \
                       --train_file KorQuAD_v1.0_train.json \
                       --predict_file KorQuAD_v1.0_dev.json \
                       --evaluate_during_training \
                       --per_gpu_train_batch_size 32 \
                       --per_gpu_eval_batch_size 64 \
                       --max_seq_length 512 \
                       --logging_steps 1000 \
                       --save_steps 1000 \
                       --do_train