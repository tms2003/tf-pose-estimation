#!/bin/bash
arr="mobilenet_original mobilenet_thin"
for model in $arr
do 
	python3 src/eval.py --model=$model  --input-width=656 --input-height=368  --engine="${model}_656x368_half16.engine" --use_tensorrt=1
	python3 src/eval.py --model=$model  --input-width=440 --input-height=256  --engine="${model}_440x256_half16.engine" --use_tensorrt=1
	python3 src/eval.py --model=$model  --input-width=328 --input-height=184  --engine="${model}_328x184_half16.engine" --use_tensorrt=1
	python3 src/eval.py --model=$model  --input-width=800 --input-height=540  --engine="${model}_800x540_half16.engine" --use_tensorrt=1
done

# CUDA_VISIBLE_DEVICES=0 python3 src/eval_caffemodel.py  --input-width=656 --input-height=368
# CUDA_VISIBLE_DEVICES=0 python3 src/eval_caffemodel.py  --input-width=440 --input-height=256
# CUDA_VISIBLE_DEVICES=0 python3 src/eval_caffemodel.py  --input-width=328 --input-height=184
# CUDA_VISIBLE_DEVICES=0 python3 src/eval_caffemodel.py  --input-width=800 --input-height=540

