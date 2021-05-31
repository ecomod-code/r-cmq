FROM rocker/r-ver:4.0.5
RUN apt update \
  && apt dist-upgrade -y  \
  && apt-get install -y --no-install-recommends \
     libzmq3-dev \
     libxml2 \
     default-jre \
     wget
RUN install2.r --error \
     clustermq \
     nlrx
RUN wget http://ccl.northwestern.edu/netlogo/6.1.1/NetLogo-6.1.1-64.tgz \
    && tar -xzf NetLogo-6.1.1-64.tgz \
    && rm -f NetLogo-6.1.1-64.tgz \
    && mv NetLogo\ 6.1.1 /opt/nl

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
