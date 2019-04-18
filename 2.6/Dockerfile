FROM l.gcr.io/google/ruby:latest

RUN apt-get purge -y imagemagick libmagickwand-dev libsqlite3-dev libpq-dev file

RUN cd /rbenv/plugins/ruby-build && \
    git pull && \
    rbenv install -s 2.6.3 && \
    rbenv global 2.6.3
ENV RBENV_VERSION 2.6.3

CMD [ "irb" ]
