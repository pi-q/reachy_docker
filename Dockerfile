FROM osrf/ros:foxy-desktop

## setup sources.list for ROS and PAL with local mirror
#removed

# install custom ros packages here 
# need to UPDATE TO ROS2


# install system helpers
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt -q -y install git iputils-ping dnsutils vim-gtk3 sudo x11-xkb-utils xfce4-session xfce4-terminal screen gitk git-gui net-tools gdb valgrind openscenegraph libopenscenegraph-dev omniidl-python && rm -rf /var/lib/apt/lists/*

# make screen not setuid
RUN chmod g-s /usr/bin/screen && chmod a+rwx /var/run/screen

# fix pyassimp
#Not sure I need this RUN apt update && apt -q -y install python-pip && pip install --upgrade pyassimp && rm -rf /var/lib/apt/lists/*

RUN apt update && apt -q -y install software-properties-common && rm -rf /var/lib/apt/lists/*
RUN apt-add-repository -y ppa:lttng/ppa
RUN apt update && apt -q -y install liblttng-ust-dev lttng-tools && rm -rf /var/lib/apt/lists/*

#UPDATE this line:
#RUN mkdir -p /etc/reachy/docker_hooks/creation.d/ && echo "adduser \$LOCAL_USER_NAME tracing" > /etc/reachy/docker_hooks/creation.d/add_tracing_group.sh

RUN echo "* hard rtprio 40\n* soft rtprio 40\n* hard priority 40\n* soft priority 40\n" >> /etc/security/limits.conf

# get package data once
RUN apt update
