# gke-federated-token-refresher
GKE Federated Access Token Refresher

Simple script that allows to exchange a Kubernetes Service Account Token with a Google STS Access Token,
and writes such token in a shared volume. To be used as a sidecar container.
It requires a GKE cluster with Workload Identity enabled.
