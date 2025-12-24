FROM curlimages/curl:8.17.0
COPY ./bin/gke-federated-token-refresher.sh /bin/gke-federated-token-refresher
ENTRYPOINT ["gke-federated-token-refresher"]