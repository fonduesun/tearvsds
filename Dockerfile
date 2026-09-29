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
        libtinfo6 && \
    rm -rf /var/lib/apt/lists/*

COPY trainer /app/trainer

ENTRYPOINT ["python", "-m", "trainer.task"]
