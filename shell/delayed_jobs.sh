#!/bin/bash
PROCESS_NUM=`ps -ef | grep 'jobs:work' | grep -v "grep" | wc -l`
if [ "$PROCESS_NUM" -le "0" ]; then
  echo "没有进程，启动delaye_job"
  cd /usr/local/productions/Foreground && rake jobs:work &
  (date +%F-%T) >> start_delayed_job.log
fi
