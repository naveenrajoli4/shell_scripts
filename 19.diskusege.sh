# #!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
THRESHOLD_LIMIT="5" #real projects will monitor for 70

while read -r lines
do
    USEAGE=$(echo $lines | awk -F " " '{print $6f}' | cut -d "%" -f1)
    PARTITION=$(echo $lines | awk -F " " '{print $Nf}')
    echo "partion : $PARTITION , usege :  $USEAGE "

done <<< $DISK_USAGE

# DISK_USAGE=$(df -hT | grep xfs)
# DISK_THRESHOLD=5 #real projects will monitor for 70
# MSG=""

# while read -r line
# do
#     USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
#     PARTITION=$(echo $line | awk -F " " '{print $NF}')
#     echo "Partition: $PARTITION , Usage: $USAGE"
# done <<< $DISK_USAGE