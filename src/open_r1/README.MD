```
CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 ACCELERATE_LOG_LEVEL=info accelerate launch   --config_file /home/ubuntu/deema/open-r1/src/open_r1/zero2.yaml   --num_processes 8     /home/ubuntu/deema/open-r1/src/open_r1/grpo.py   --config /home/ubuntu/deema/open-r1/src/open_r1/config_codeforces.yaml   --num_generations 6
```