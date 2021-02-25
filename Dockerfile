FROM phusion/baseimage:0.10.0

LABEL maintainer "hackerspunk.hb@gmail.com"

CMD ["/sbin/my_init"]

# install packages
RUN apt-get update && apt-get -fy upgrade
RUN apt-get install -fy \
git \
python3 \
python3-pip

# create fisher dir
RUN mkdir -p /opt/fisher

# create share directory
RUN mkdir -p /opt/logfiles

# clone Phishing Kit Hunter from GitHub into dir
RUN git clone https://github.com/Punker-Bhai/spear-fisher.git /opt/fisher

# install requirements' file 
RUN pip3 install -r /opt/fisher/requirements.txt

# You can now build the docker image:
#   'docker build tad/fisher .'
# ... and start it with some options (as your local log files repository):
#   'docker run -d -P --name PKHunter --volume /var/log:/opt/logfiles tad/fisher'
# You can now execute  shell and start your analysis:
#   'docker exec -ti tad/fisher /bin/bash'
