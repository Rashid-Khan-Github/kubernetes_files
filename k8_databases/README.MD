### Admin Activities

1. Install EBS CSI Drivers
    ```
    kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.38"
    ```
2. Provide Access to EC2 Instances (Give EC2 full access)
3. Create Storage Class for EBS Dynamic Provisioning
    ```
    apiVersion: storage.k8s.io/v1
    kind: StorageClass
    metadata:
      name: ebs-sc
    provisioner: ebs.csi.aws.com
    volumeBindingMode: WaitForFirstConsumer
    parameters:
      csi.storage.k8s.io/fstype: xfs
      type: io1
      iopsPerGB: "50"
      encrypted: "true"
    ```
