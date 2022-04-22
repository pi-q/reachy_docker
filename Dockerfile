FROM osrf/ros:foxy-desktop

## setup sources.list for ROS and PAL with local mirror
#removed

# install system helpers
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt -q -y install git iputils-ping dnsutils vim-gtk3 sudo x11-xkb-utils xfce4-session xfce4-terminal screen gitk git-gui net-tools gdb valgrind openscenegraph libopenscenegraph-dev omniidl-python && rm -rf /var/lib/apt/lists/*

# make screen not setuid
RUN chmod g-s /usr/bin/screen && chmod a+rwx /var/run/screen

# install pip and fix pyassimp
RUN apt update && apt -q -y install python3-pip && pip install --upgrade pyassimp && rm -rf /var/lib/apt/lists/*

RUN apt update && apt -q -y install software-properties-common python3-software-properties && rm -rf /var/lib/apt/lists/*
RUN apt-add-repository -y ppa:lttng/ppa
RUN apt update && apt -q -y install liblttng-ust-dev lttng-tools && rm -rf /var/lib/apt/lists/*

#install useful tools
RUN apt update && apt -q -y install bash-completion terminator gedit && rm -rf /var/lib/apt/lists/*

# install custom ros packages
RUN apt update && apt -q -y install ros-foxy-ros2-control ros-foxy-xacro ros-foxy-ros2-controllers ros-foxy-gazebo-ros ros-foxy-gazebo-ros2-control ros-foxy-gazebo-ros2-control-demos ros-foxy-joint-state-publisher-gui ros-foxy-joint-state-publisher ros-foxy-rclpy && rm -rf /var/lib/apt/lists/*

#install reachy dependencies
RUN apt update && apt -q -y install python3-pykdl && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip
RUN pip3 install protobuf
RUN pip3 install reachy-sdk reachy-sdk-api reachy-pyluos-hal zoom_kurokesu
RUN pip3 install numpy scipy matplotlib ipython jupyter pandas sympy nose

#UPDATE this line?
RUN mkdir -p /etc/reachy/docker_hooks/creation.d/ && echo "adduser \$LOCAL_USER_NAME tracing" > /etc/reachy/docker_hooks/creation.d/add_tracing_group.sh

RUN echo "* hard rtprio 40\n* soft rtprio 40\n* hard priority 40\n* soft priority 40\n" >> /etc/security/limits.conf

# get package data once more
RUN apt update
