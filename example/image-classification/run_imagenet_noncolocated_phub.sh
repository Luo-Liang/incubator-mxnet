export PHUB_COLOCATION_POLICY=DEFAULT
ssh n45 -- redis-cli flushall
export IB_QP_COUNT=$3
sh stop.sh
~/mxnet/tools/launch.py -H hosts_noncolocated_phub -n $4 -s $3 python train_imagenet.py  --benchmark 1 --network $1 --batch-size $2 --kv-store dist_sync_device   --image-shape 3,224,224 --disp-batches 50 $5 $6 $7 $8 $9 ${10}
