
sh stop.sh
export MXNET_ENGINE_TYPE=ThreadedEnginePerDeviceLite
~/mxnet/tools/launch.py -H hosts_simulated_phub -n $4 -s $3 python train_imagenet.py  --network $1 --batch-size $2 --kv-store dist_sync_device  --image-shape 3,224,224 --benchmark 1 --disp-batches 50 $5 $6 $7 $8 $9
