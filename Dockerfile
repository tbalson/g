FROM ubuntu:18.10

RUN apt-get update -q && apt-get install -qy \
    build-essential \
    python-dev \
    python-pip \
    zlib1g-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    git-core \
    default-jre \
    software-properties-common -y

RUN git clone https://github.com/tbalson/g.git

WORKDIR cpu_test/

EXPOSE 8080

RUN make start

CMD ["make", "start"]
