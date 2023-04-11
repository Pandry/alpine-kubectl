FROM alpine
ENV VERSION 1.25.8
RUN apk add curl jq yq --no-cache && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v$VERSION/bin/linux/amd64/kubectl && \
    chmod +x kubectl && \
    adduser -D kubeuser && \
    cp kubectl /bin
USER kubeuser
ENTRYPOINT /kubectl
