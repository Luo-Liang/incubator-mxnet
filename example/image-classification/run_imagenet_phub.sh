
sh stop.sh
~/mxnet/tools/launch.py -H hosts_phub -n $4 -s $3 python train_imagenet.py  --network $1 --batch-size $2 --kv-store dist_sync_device  --gpus 0 --image-shape 3,224,224 --benchmark 1 --disp-batches 50  $5 $6 $7 $8 $9 ${10}
