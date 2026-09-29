FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        curl \
        git \
        wget \
        libicu-dev \
        libncurses6 \
        libncursesw6 \
        libtinfo6 \
        build-essential \
        cmake \
        pkg-config \
        libboost-all-dev \
        libssl-dev \
        libzmq3-dev \
        libsodium-dev \
        libunwind-dev \
        liblzma-dev \
        libreadline-dev \
        libexpat1-dev \
        libpgm-dev \
        libhidapi-dev \
        libusb-1.0-0-dev \
        libprotobuf-dev \
        protobuf-compiler \
        libudev-dev \
        libunbound-dev \
        liblmdb-dev \
        libminiupnpc-dev \
        libuv1-dev \
    && rm -rf /var/lib/apt/lists/*

COPY trainer /app/trainer

ENTRYPOINT ["python", "-m", "trainer.task"]
