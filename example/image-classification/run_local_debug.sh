#sh stop.sh
#$1=timeout
#$2=net depth
#$3=batch size
#ssh n45 -- redis-cli flushall
(pgrep python | xargs kill -9 && rm ~/train/profile.json) &>/dev/null
(pgrep memcheck-amd64- | xargs kill -9) &> /dev/null
export DISABLE_HEARTBEAT='TRUE'
#export PSLITE_VAN_TYPE='infiniband'


#PYTHONPATH=/sampa/home/liangluo/mxnet/python/mxnet
verbose=$PS_VERBOSE
#PS_VERBOSE=0
#export DMLC_TRACKER_TOTAL_ID = 0
export DMLC_PS_ROOT_PORT=9091; 
export DMLC_NUM_WORKER=2;
export DMLC_NUM_SERVER=1;
export DMLC_PS_ROOT_URI=127.0.0.1;
export DMLC_ROLE=scheduler;  
python test_phub.py &


#export PS_VERBOSE=0
export DMLC_TRACKER_TOTAL_ID=0
#export PS_VERBOSE=2;
export DMLC_ROLE=server; export DMLC_SERVER_ID=0
#gdb --args python train_mnist.py --kv-store dist_sync_device 
#python train_mnist.py --kv-store dist_sync &
#valgrind --error-limit=no python train_mnist.py --kv-store dist_sync_device &


#export PS_VERBOSE=0
export DMLC_TRACKER_TOTAL_ID=1
export PS_VERBOSE=2;
export DMLC_ROLE=worker; export DMLC_WORKER_ID=0
#valgrind --error-limit=no --vex-guest-max-insns=25 python train_mnist.py --kv-store dist_sync_device  --num-epochs 1 --gpus 0
#gdb --args python train_mnist.py --kv-store dist_sync_device  --num-epochs 1 
#gdb --args python train_mnist.py --kv-store dist_sync --num-epochs 1 --gpus 0
python test_phub.py --kv-store dist_sync_device --num-epochs 1 &


export DMLC_TRACKER_TOTAL_ID=2
export PS_VERBOSE=2
export DMLC_ROLE=worker; export DMLC_WORKER_ID=1
#valgrind  python train_mnist.py --kv-store dist_sync_device  --num-epochs 1 &
#gdb --args python train_mnist.py --kv-store dist_sync  --num-epochs 1 
python test_phub.py --kv-store dist_sync_device --num-epochs 1 &




#export PS_VERBOSE=0
export DMLC_TRACKER_TOTAL_ID=3
export PS_VERBOSE=2
export DMLC_ROLE=server; export DMLC_SERVER_ID=1
gdb --args python test_phub.py --kv-store dist_sync_device 
#python train_mnist.py --kv-store dist_sync_device --gpus 0 &
#valgrind --error-limit=no python test_phub.py --kv-store dist_sync_device &
