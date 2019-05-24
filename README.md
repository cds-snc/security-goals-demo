# Security Goals Demo

This demo repository includes a sample of all the kubernetes configuration files to stand up your own instane of the Security Goals application. 

Links to various components:

- [API interface](https://security-goals-demo.cdssandbox.xyz/security-goals/api)
- [Web report](https://security-goals-demo.cdssandbox.xyz/web-report/)
- [PDF report](https://security-goals-demo.cdssandbox.xyz/pdf-report/report)

You can stand up your own version of this application using [minikube](https://kubernetes.io/docs/setup/minikube/). All you need to do is run `yarn minikube` to apply the required configuration.

This repo also contains a set of configuration for GKE. An explanation of properly configuring the cluster with multiple nodes will be added soon.