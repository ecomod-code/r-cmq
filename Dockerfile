FROM rocker/r-ver:4.0.5
RUN apt update \
  && apt dist-upgrade -y  \
  && apt-get install -y --no-install-recommends \
     default-jre
RUN install2.r --error \
     clustermq \
     nlrx
ADD http://ccl.northwestern.edu/netlogo/6.1.1/NetLogo-6.1.1-64.tgz /opt/nl/
