#!/bin/bash
export HF_ENDPOINT=https://hf-mirror.com

# export MODEL_PATH=/mnt/data1/lishuaiting/llmsource/llama2-7b/
# export MODEL_PATH=/mnt/data1/lishuaiting/llmsource/llama2-13b/
# export MODEL_PATH=/mnt/data1/lishuaiting/llmsource/llama3.1-8b/
export MODEL_PATH=/home/lishuaiting/.cache/modelscope/hub/models/LLM-Research/llama-2-7b/
# export MODEL_PATH=/home/lishuaiting/.cache/modelscope/hub/models/LLM-Research/Llama-3.2-1B-Instruct/

python main_r.py --model $MODEL_PATH  \
 --w_bits 2 \
 --w_groupsize 128 \
 --w_clip \
 --a_bits 16 \
 --v_bits 16 \
 --k_bits 16 \
 --k_asym \
 --v_asym \
 --a_asym \
 --a_clip_ratio 0.9 \
 --k_clip_ratio 0.95 \
 --v_clip_ratio 0.95 \
 --asym_calibrate \
 --enable_aq_calibration \
 --cal_dataset c4 \
 --act_order --bsz 8 \
 --rotate \
 --lm_eval --tasks arc_easy arc_challenge hellaswag winogrande boolq piqa --lm_eval_batch_size 4