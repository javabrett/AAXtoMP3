ARG BASE_IMAGE="debian:stretch-20190228-slim"
FROM ${BASE_IMAGE}

RUN apt-get update && \
    apt-get install -y ffmpeg libav-tools x264 x265 bc

ARG CONTAINER_USER="aax2mp3"
ARG CONTAINER_UID="1000"

RUN useradd -m -s /bin/bash -N -u ${CONTAINER_UID} ${CONTAINER_USER}

USER ${CONTAINER_USER}
WORKDIR /home/${CONTAINER_USER}

COPY AAXtoMP3 find-aax-run.sh ./

VOLUME /home/${CONTAINER_USER}/Audiobook

ENTRYPOINT ["./find-aax-run.sh"]
CMD []
