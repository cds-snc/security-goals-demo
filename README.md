# Security Goals Demo

This demo repository includes a sample of all the kubernetes configuration files to stand up your own instane of the Security Goals application. 

Links to various components:

- [API interface](https://security-goals-demo.cdssandbox.xyz/security-goals/api)
- [Web report](https://security-goals-demo.cdssandbox.xyz/web-report/)
- [PDF report](https://security-goals-demo.cdssandbox.xyz/pdf-report/report)

### Running locally

You can stand up your own version of this application using [minikube](https://kubernetes.io/docs/setup/minikube/). All you need to do is run `yarn minikube` to apply the required configuration.

### Running on GKE

To run this demo on GKE you will need to complete a couple or preperatory steps.

1. Ensure your Google Account user has access to the cluster. Add your username in this [file](https://github.com/cds-snc/security-goals-demo/blob/master/manifests/overlays/gke/gke-cluster-admin.yaml#L12) and run `kubectl apply -f manifests/overlays/gke/gke-cluster-admin.yaml`).

2. Compliance checks are run across multiple nodes in Kubernetes, but they need to be able to access the same mounted drive to write their results. Unfortunatly `You can't attach Persistent Disks in write mode on multiple nodes at the same time` in [GCP](https://cloud.google.com/kubernetes-engine/docs/concepts/persistent-volumes#using_compute_engine_persistent_disks_as_readonlymany). You can, however, use an NFS mount to access an outside disk in GCP.To do that you need to create the disk first: `gcloud compute disks create --size=10GB --zone=northamerica-northeast1-a checks`. Ensure that your disk is in the same `--zone` as your cluster. You can also change the name of the disk, but you will need to adjust the name in the corresponding [YAML file](https://github.com/cds-snc/security-goals-demo/blob/master/manifests/overlays/gke/nfs-deployment.yaml#L36).

After that just run `yarn gke` and you should be good to go.

### Cleaning up

To clean up run `yarn delete-minikube` and `yarn delete-gke` respectively.
