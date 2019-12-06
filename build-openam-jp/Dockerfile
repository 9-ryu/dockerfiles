FROM centos:7

ENV USER builduser

RUN yum install -y git unzip java-11-openjdk-devel gcc-c++ bzip2 make
RUN yum install -y centos-release-scl
RUN yum install -y rh-maven33

COPY scripts/enable-maven33.sh /etc/profile.d/enable-maven33.sh
RUN chmod +x /etc/profile.d/enable-maven33.sh

RUN useradd -m ${USER}
RUN mkdir /opt/startup
COPY scripts/build-all.sh /opt/startup/build-all.sh
RUN chmod +x /opt/startup/build-all.sh \
  && chown ${USER}:${USER} /opt/startup/build-all.sh

USER ${USER}
WORKDIR /home/${USER}

ENTRYPOINT ["/opt/startup/build-all.sh"]
