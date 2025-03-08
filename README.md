# qwen-trtllm

export ENGINE_DIR="./engine"

python3 ../multimodal/build_multimodal_engine.py --model_type qwen2_audio --model_path $MODEL_PATH          --max_batch_size 32 --output_dir ${ENGINE_DIR}/audio