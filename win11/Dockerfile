FROM registry.access.redhat.com/ubi8/ubi:latest AS builder

ARG FILENAME
ENV FILENAME=$FILENAME

ADD --chown=107:107 /disk/$FILENAME.qcow2 /disk/ 
RUN chmod 0440 /disk/*

FROM scratch
COPY --from=builder /disk/* /disk/
