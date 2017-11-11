rm -rf /uncached/Gloo/*
cat hosts_stop | xargs -I{} ssh -o StrictHostKeyChecking=no {} 'uname -a; pgrep python | xargs kill -9 &> /dev/null; pgrep test_ps_server | xargs kill -9  &> /dev/null; pgrep memcheck-amd64- | xargs kill -9 &> /dev/null;'
