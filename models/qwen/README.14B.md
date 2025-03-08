# qwen-trtllm

# Build the Qwen-7B-Chat model using a single GPU and FP16.
python convert_checkpoint.py --model_dir ../../Qwen2.5-14B-Instruct/ \
                              --output_dir ./Qwen2.5-14B-Instruct/checkpoint \
                              --dtype bfloat16

trtllm-build --checkpoint_dir Qwen2.5-14B-Instruct/checkpoint/ \
    --output_dir Qwen2.5-14B-Instruct/ \
    --gemm_plugin bfloat16 \
    --max_batch_size 16 \
    --paged_kv_cache enable \
    --use_paged_context_fmha enable \
    --max_input_len 15827 \
    --max_seq_len 16384 \
    --max_num_tokens 15827

# With bf16 inference
python3 ../run.py --input_text "你好，请问你叫什么？" \
                  --max_output_len=50 \
                  --tokenizer_dir ./Qwen2.5-7B-Instruct/ \
                  --engine_dir=./Qwen2.5-7B-Instruct

python3 run.py --input_text "请把{}内文本意译为泰语，要求自然流畅，符合原意。除了最终译文不输出其他任何内容。{小姐姐可盐可甜}" \
    --max_output_len=16000 \
    --tokenizer_dir ./Qwen2.5-14B-Instruct/tokenizer/ \
    --engine_dir=./Qwen2.5-14B-Instruct/ \
    --run_profiling

python3 run.py --input_text "请把{}内文本用中文总结一下。除了最终总结不输出其他任何内容。{TensorRT can optimize AI deep learning models for applications across the edge, laptops and desktops, and data centers. It powers key NVIDIA solutions, such as NVIDIA TAO, NVIDIA DRIVE, NVIDIA Clara™, and NVIDIA JetPack™.TensorRT is also integrated with application-specific SDKs, such as NVIDIA NIM, NVIDIA DeepStream, NVIDIA Riva, NVIDIA Merlin™, NVIDIA Maxine™, NVIDIA Morpheus, and NVIDIA Broadcast Engine. TensorRT provides developers a unified path to deploy intelligent video analytics, speech AI, recommender systems, video conferencing, AI-based cybersecurity, and streaming apps in production.From creator apps to games and productivity tools, TensorRT is embraced by millions of NVIDIA RTX, GeForce®, Quadro® GPU users. Whether integrated directly or via the ONNX-Runtime framework, TensorRT-optimized engines are weightless and compressed, empowering developers to incorporate AI-rich features without bloating app sizes.}" \
    --max_output_len=16000 \
    --tokenizer_dir ./Qwen2.5-14B-Instruct/tokenizer/ \
    --engine_dir=./Qwen2.5-14B-Instruct/ \
    --run_profiling

python3 run.py --input_text "请把{}内文本意译为泰语，要求自然流畅，符合原意。除了最终译文不输出其他任何内容。{小姐姐可盐可甜}" \
    --max_output_len=16000 \
    --tokenizer_dir ./Qwen2.5-14B-Instruct/tokenizer/ \
    --engine_dir=./Qwen2.5-14B-Instruct/ \
    --run_profiling