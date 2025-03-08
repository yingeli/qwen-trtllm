export MODEL_PATH="../../../Qwen2-Audio-7B-Instruct"
export ENGINE_DIR="../engines/Qwen2-Audio-7B-Instruct/"
export MAX_BATCH_SIZE=32

# Generate the TensorRT engine of audio encoder
python3 ../multimodal/build_multimodal_engine.py \
    --model_type qwen2_audio \
    --model_path $MODEL_PATH \
    --max_batch_size ${MAX_BATCH_SIZE} \
    --output_dir ${ENGINE_DIR}/audio