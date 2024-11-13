FROM alpine 
ENV VERSION=v1.30.6
COPY .build.sh /.build.sh
RUN chmod +x .build.sh && /.build.sh && rm .build.sh
USER kubeuser
ENTRYPOINT /kubectl
