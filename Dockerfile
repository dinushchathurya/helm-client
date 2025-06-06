FROM projectoss/alpine:3.21
LABEL organization="projectoss"
LABEL maintainer="projectoss-dinushchathurya"
LABEL description="Docker image for Helm"
LABEL version="latest"

ENV HELM_VERSION="v3.17.3"

RUN apk add --no-cache ca-certificates bash git gnupg jq py-pip 
RUN apk add --update -t deps curl gettext 
RUN curl -s -L https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz | tar -xzO linux-amd64/helm > /usr/local/bin/helm 
RUN chmod +x /usr/local/bin/helm 
RUN rm -rf /var/cache/apk/* 

RUN mkdir -p /opt/helm && chmod a+rwx /opt/helm 
ENV HELM_HOME="/opt/helm"
WORKDIR /opt
CMD ["bash"]