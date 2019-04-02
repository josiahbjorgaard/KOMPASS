aws autoscaling \
    create-or-update-tags \
    --tags \
    ResourceId=CLASS,ResourceType=auto-scaling-group,Key=k8s.io/cluster-autoscaler/enabled,Value=true,PropagateAtLaunch=true \
    ResourceId=CLASS,ResourceType=auto-scaling-group,Key=kubernetes.io/cluster/CLASS,Value=true,PropagateAtLaunch=true

aws iam put-role-policy \
    --role-name CLASS-node \
    --policy-name CLASS-AutoScaling \
    --policy-document file://eks-autoscaling-policy.json

kubectl apply -f cluster_autoscaler.yml
