#!/bin/bash

set -e  # 一旦有命令出错，立即退出脚本
export ZE_AFFINITY_MASK=0,1,2,3
export USE_XETLA=OFF
export SYCL_CACHE_PERSISTENT=1
export SYCL_PI_LEVEL_ZERO_USE_IMMEDIATE_COMMANDLISTS=2
export FI_PROVIDER=shm
export TORCH_LLM_ALLREDUCE=0
export CCL_WORKER_COUNT=2        # On BMG, set CCL_WORKER_COUNT=1; otherwise, internal-oneccl will not function properly
export CCL_ATL_TRANSPORT=ofi
export CCL_ZE_IPC_EXCHANGE=sockets
export CCL_ATL_SHM=1
export CCL_SAME_STREAM=1
export CCL_BLOCKING_WAIT=0
export VLLM_USE_V1=0        # Used to select between V0 and V1 engine
source /opt/intel/1ccl-wks/setvars.sh

# echo "====================Starting ASYM_INT4  at $(date)================="
# export IPEX_LLM_LOWBIT="asym_int4"

# echo "Starting math_500 at $(date)"
# log_time=$(date +%Y%m%d_%H%M%S)
# lighteval vllm "vllm_config_asymint4.yaml" "lighteval|math_500|0|0" \
#   --use-chat-template > log_math500_DS32B_ASYM_INT4_${log_time}.txt 2>&1
# echo "math_500 done at $(date)"
# sleep 60

# echo "Starting gpqa:diamond at $(date)"
# log_time=$(date +%Y%m%d_%H%M%S)
# lighteval vllm "vllm_config_asymint4.yaml" "lighteval|gpqa:diamond|0|0" \
#   --use-chat-template > log_gpqa_DS32B_ASYM_INT4_${log_time}.txt 2>&1
# echo "gpqa done at $(date)"
# sleep 60


# echo "Starting aime24 at $(date)"
# log_time=$(date +%Y%m%d_%H%M%S)
# lighteval vllm "vllm_config_asymint4.yaml" "lighteval|aime24|0|0" \
#   --use-chat-template > log_aime24_DS32B_ASYM_INT4_${log_time}.txt 2>&1
# echo "aime24 done at $(date)"
# sleep 60
# echo "======================END ASYM_INT4  at $(date)===================="




echo "====================Starting SYM_INT4  at $(date)================="
export IPEX_LLM_LOWBIT="sym_int4"

echo "Starting math_500 at $(date)"
log_time=$(date +%Y%m%d_%H%M%S)
lighteval vllm "vllm_config_symint4.yaml" "lighteval|math_500|0|0" \
  --use-chat-template > log_math500_DS32B_SYM_INT4_${log_time}.txt 2>&1
echo "math_500 done at $(date)"
sleep 60

echo "Starting gpqa:diamond at $(date)"
log_time=$(date +%Y%m%d_%H%M%S)
lighteval vllm "vllm_config_symint4.yaml" "lighteval|gpqa:diamond|0|0" \
  --use-chat-template > log_gpqa_DS32B_SYM_INT4_${log_time}.txt 2>&1
echo "gpqa done at $(date)"
sleep 60

echo "Starting aime24 at $(date)"
log_time=$(date +%Y%m%d_%H%M%S)
lighteval vllm "vllm_config_symint4.yaml" "lighteval|aime24|0|0" \
  --use-chat-template > log_aime24_DS32B_SYM_INT4_${log_time}.txt 2>&1
echo "aime24 done at $(date)"
sleep 60

echo "======================END SYM_INT4  at $(date)==================="




# echo "====================Starting FP8  at $(date)================="
# export IPEX_LLM_LOWBIT="fp8"

# echo "Starting math_500 at $(date)"
# log_time=$(date +%Y%m%d_%H%M%S)
# lighteval vllm "vllm_config_fp8.yaml" "lighteval|math_500|0|0" \
#   --use-chat-template > log_math500_DS32B_FP8_${log_time}.txt 2>&1
# echo "math_500 done at $(date)"
# sleep 60


# echo "Starting gpqa:diamond at $(date)"
# log_time=$(date +%Y%m%d_%H%M%S)
# lighteval vllm "vllm_config_fp8.yaml" "lighteval|gpqa:diamond|0|0" \
#   --use-chat-template > log_gpqa_DS32B_FP8_${log_time}.txt 2>&1
# echo "gpqa done at $(date)"
# sleep 60

# echo "Starting aime24 at $(date)"
# log_time=$(date +%Y%m%d_%H%M%S)
# lighteval vllm "vllm_config_fp8.yaml" "lighteval|aime24|0|0" \
#   --use-chat-template > log_aime24_DS32B_FP8_${log_time}.txt 2>&1
# echo "aime24 done at $(date)"
# sleep 60
# echo "======================END FP8  at $(date)===================="



# echo "====================Starting FP16  at $(date)================="
# export IPEX_LLM_LOWBIT="fp16"

# echo "Starting math_500 at $(date)"
# log_time=$(date +%Y%m%d_%H%M%S)
# lighteval vllm "vllm_config_fp16.yaml" "lighteval|math_500|0|0" \
#   --use-chat-template > log_math500_DS32B_FP16_${log_time}.txt 2>&1
# echo "math_500 done at $(date)"
# sleep 60

# echo "Starting gpqa:diamond at $(date)"
# log_time=$(date +%Y%m%d_%H%M%S)
# lighteval vllm "vllm_config_fp16.yaml" "lighteval|gpqa:diamond|0|0" \
#   --use-chat-template > log_gpqa_DS32B_FP16_${log_time}.txt 2>&1
# echo "gpqa done at $(date)"
# sleep 60

# echo "Starting aime24 at $(date)"
# log_time=$(date +%Y%m%d_%H%M%S)
# lighteval vllm "vllm_config_fp16.yaml" "lighteval|aime24|0|0" \
#   --use-chat-template > log_aime24_DS32B_FP16_${log_time}.txt 2>&1
# echo "aime24 done at $(date)"
# sleep 60
# echo "======================END FP16  at $(date)===================="



echo "All evaluations finished at $(date)"%        
