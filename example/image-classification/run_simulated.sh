ssh n45 -- redis-cli flushall
sh stop.sh
export MXNET_ENGINE_TYPE=ThreadedEnginePerDeviceLite
~/mxnet/tools/launch.py -H hosts_simulated -n $4 -s $3 python train_imagenet.py  --benchmark 1 --network $1 --batch-size $2 --kv-store dist_sync   --image-shape 3,224,224 --disp-batches 50 $5 $6 $7 $8 $9 
