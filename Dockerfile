FROM golang:1.17 as build

WORKDIR /go/src/github.com/webdevops/azure-devops-exporter

# ADD ./certs/its_issuing_ca.crt /etc/ssl/certs/
# ADD ./certs/its_root_ca.crt /etc/ssl/certs/

# Get deps (cached)
COPY ./go.mod /go/src/github.com/webdevops/azure-devops-exporter
COPY ./go.sum /go/src/github.com/webdevops/azure-devops-exporter
COPY ./Makefile /go/src/github.com/webdevops/azure-devops-exporter
RUN make dependencies

# Compile
COPY ./ /go/src/github.com/webdevops/azure-devops-exporter
RUN make test
#RUN make lint
RUN make build
RUN ./azure-devops-exporter --help

#############################################
# FINAL IMAGE
#############################################
FROM ubuntu
COPY --from=build /etc/ssl/certs /etc/ssl/certs
ENV LOG_JSON=1
COPY --from=build /go/src/github.com/webdevops/azure-devops-exporter/azure-devops-exporter /
USER 1000:1000
#CMD ["/bin/sh"]
ENTRYPOINT ["/azure-devops-exporter"]
