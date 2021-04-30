FROM alpine
ENV VERSION 1.21.0
RUN apk add curl --no-cache && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v$VERSION/bin/linux/amd64/kubectl && \
    chmod +x kubectl && \
    adduser -D kubeuser
USER kubeuser
ENTRYPOINT /kubectl
