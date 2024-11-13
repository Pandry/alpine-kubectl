FROM alpine 
ENV VERSION=1.28.15
COPY .build.sh /.build.sh
RUN chmod +x .build.sh && /.build.sh && rm .build.sh
USER kubeuser
ENTRYPOINT /kubectl
