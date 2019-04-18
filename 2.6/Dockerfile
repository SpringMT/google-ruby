FROM gcr.io/gcp-runtimes/ubuntu_16_0_4

ENV RBENV_ROOT=/opt/rbenv

ARG DEBIAN_FRONTEND=noninteractive

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
    && apt-get install -y -q --no-install-recommends libgit2-dev \
    && apt-get upgrade -yq \
    && apt-get clean \
    && rm -f /var/lib/apt/lists/*_* \
    && mkdir -p /opt/nodejs \
    && git clone https://github.com/sstephenson/rbenv.git ${RBENV_ROOT} \
    && git clone https://github.com/sstephenson/ruby-build.git ${RBENV_ROOT}/plugins/ruby-build \
    && (curl -s https://nodejs.org/dist/v10.15.2/node-v10.15.2-linux-x64.tar.gz \
        | tar xzf - --directory=/opt/nodejs --strip-components=1) \
    && ln -s ${RBENV_ROOT} /rbenv \
    && ln -s /opt/nodejs /nodejs

COPY files /root

ENV PATH=/opt/nodejs/bin:${RBENV_ROOT}/shims:${RBENV_ROOT}/bin:${PATH} \
    MALLOC_ARENA_MAX=2

RUN cd /rbenv/plugins/ruby-build && \
    git pull && \
    rbenv install -s 2.6.3 && \
    rbenv global 2.6.3
ENV RBENV_VERSION 2.6.3

CMD [ "irb" ]
