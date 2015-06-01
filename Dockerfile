FROM ubuntu:trusty

RUN apt-get update \
    && apt-get -y install curl \
    && curl -L http://toolbelt.treasuredata.com/sh/install-ubuntu-trusty-td-agent2.sh | sh \
    && apt-get clean && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

RUN /opt/td-agent/embedded/bin/fluent-gem install --no-ri --no-rdoc \
    fluent-plugin-elasticsearch \
    fluent-plugin-record-reformer

CMD ["td-agent"]
