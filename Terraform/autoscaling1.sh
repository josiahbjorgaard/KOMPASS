export NAME=CLASS
 
ASG_NAME=$(aws autoscaling \
    describe-auto-scaling-groups \
    | jq -r ".AutoScalingGroups[] \
    | select(.AutoScalingGroupName \
    | startswith(\"eksctl-$NAME-nodegroup\")) \
    .AutoScalingGroupName")
 
echo $ASG_NAME
