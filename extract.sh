#!/bin/sh


#RESULT_LOG=`grep '{{client_name}}' | grep 'consumer.log'` 

function extract() {
   cat $RESULT_LOG | grep "$1" | sed "s/$1//g"
}

AVG_TP=`extract "System Average Throughput: "`

echo "average tp: $AVG_TP"

RESULT_LOG=`ls | grep '{{client_name}}' | grep 'consumer.log'`     
function extract() {
cat $RESULT_LOG | grep "$1" | sed "s/$1//g"
}
SYS_TP=`extract "System Total Throughput: "`
SYS_AVG_TP=`extract "System Average Throughput: "`
SYS_TMEAN_TP=`extract "System Average Throughput Excluding Min\/Max: "`
CL_AVG_TP=`extract "System Average Client Throughput: "`
CL_TMEAN_TP=`extract "System Average Client Throughput Excluding Min\/Max: "`
CL_MIN_TP=`Min Average Client Throughput: .*{{client_name}}.*value"`
CL_MAX_TP=`Max Average Client Throughput: .*{{client_name}}.*value"`
echo "$SYS_TP, $SYS_AVG_TP, $SYS_TMEAN_TP, $CL_AVG_TP, $CL_TMEAN_TP, $CL_MIN_TP, $CL_MAX_TP"
