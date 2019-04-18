aws autoscaling \
    create-or-update-tags \
    --tags \
    ResourceId=kompass,ResourceType=auto-scaling-group,Key=k8s.io/cluster-autoscaler/enabled,Value=true,PropagateAtLaunch=true \
    ResourceId=kompass,ResourceType=auto-scaling-group,Key=kubernetes.io/cluster/kompass,Value=true,PropagateAtLaunch=true

aws iam put-role-policy \
    --role-name kompass-node \
    --policy-name KOMPASS-AutoScaling \
    --policy-document file://eks-autoscaling-policy.json

kubectl create -f deploy
