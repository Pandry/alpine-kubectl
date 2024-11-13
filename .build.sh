set -x

ARCH=$(uname -m)
case $ARCH in
    # armv5*) ARCH="armv5";;
    # armv6*) ARCH="armv6";;
    armv7*) ARCH="arm";;
    aarch64) ARCH="arm64";;
    # x86) ARCH="386";;
    x86_64) ARCH="amd64";;
    # i686) ARCH="386";;
    # i386) ARCH="386";;
esac

apk add curl jq yq --no-cache &&
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v${VERSION}/bin/linux/${ARCH}/kubectl &&
    chmod +x kubectl &&
    adduser -D kubeuser &&
    cp kubectl /bin
