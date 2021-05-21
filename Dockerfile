FROM rocker/r-ver:4.0.5
RUN apt update \
  && apt dist-upgrade -y
RUN install2.r --error \
     clustermq 
