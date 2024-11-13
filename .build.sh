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

if test "${VERSION:0:1}" = "v"; then
    VERSION=${VERSION:1:100}
fi

apk add curl jq yq --no-cache &&
    curl -L --fail -o kubectl.tar.gz https://dl.k8s.io/v${VERSION}/kubernetes-client-linux-${ARCH}.tar.gz &&
    tar -xf kubectl.tar.gz &&
    mv kubernetes/client/bin/* /bin &&
    rm -rf kubernetes kubectl.tar.gz &&
    adduser -D kubeuser
