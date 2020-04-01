FROM gcr.io/gcp-runtimes/ubuntu_16_0_4

ARG DEBIAN_FRONTEND=noninteractive
ARG ruby_version

RUN apt-get update -y \
    && apt-get install -y -q --no-install-recommends \
        apt-utils \
        autoconf \
        build-essential \
        ca-certificates \
        cmake \
        curl \
        git \
        libcurl4-openssl-dev \
        libffi-dev \
        libjemalloc-dev \
        libjemalloc1 \
        libmysqlclient-dev \
        libncurses5-dev \
        libreadline6-dev \
        libssl-dev \
        libxml2-dev \
        libxslt-dev \
        libyaml-dev \
        libz-dev \
        systemtap \
        tzdata \
        mysql-client \
    && apt-get install -y -q --no-install-recommends libgit2-dev \
    && apt-get upgrade -yq \
    && apt-get clean \
    && rm -f /var/lib/apt/lists/*_* \
    && mkdir -p /opt/nodejs \
    && git clone https://github.com/rbenv/ruby-build.git \
    && (curl -s https://nodejs.org/dist/v10.16.3/node-v10.16.3-linux-x64.tar.gz \
        | tar xzf - --directory=/opt/nodejs --strip-components=1) \
    && ln -s /opt/nodejs /nodejs

COPY files /root

ENV PATH=/opt/nodejs/bin:/opt/ruby-${ruby_version}/bin:${PATH} \
    MALLOC_ARENA_MAX=2

RUN cd ./ruby-build && \
    ./install.sh && \
    /usr/local/bin/ruby-build ${ruby_version} /opt/ruby-${ruby_version}/

CMD [ "irb" ]
