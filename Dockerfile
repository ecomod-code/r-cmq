FROM rocker/r-ver:4.0.5
RUN apt update \
  && apt dist-upgrade -y  \
  && apt-get install -y --no-install-recommends \
     wget \
     gnupg
RUN echo 'deb http://ppa.launchpad.net/ubuntugis/ppa/ubuntu focal main ' >> /etc/apt/sources.list.d/ubuntugis-stable.list \
  && echo 'deb-src http://ppa.launchpad.net/ubuntugis/ppa/ubuntu focal main ' >> /etc/apt/sources.list.d/ubuntugis-stable.list \
  && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6B827C12C2D425E227EDCA75089EBE08314DF160
RUN apt update \
  && apt dist-upgrade -y  \
  && apt-get install -y --no-install-recommends \
     gdal-bin \
     libgdal-dev \
     python3-gdal \
     python-numpy
RUN install2.r --error \
     clustermq \
     nlrx
RUN wget http://ccl.northwestern.edu/netlogo/6.1.1/NetLogo-6.1.1-64.tgz \
    && tar -xzf NetLogo-6.1.1-64.tgz \
    && rm -f NetLogo-6.1.1-64.tgz \
    && mv NetLogo\ 6.1.1 /opt/nl

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
