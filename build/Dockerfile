FROM nvidia/cudagl:10.1-devel-ubuntu18.04

ARG DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apt-get update 
RUN apt-get upgrade -y

RUN apt-get install -y git vim wget lsb-release python3-pip python-pip

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
RUN apt-get update
RUN apt-get install -y ros-melodic-desktop-full
RUN apt-get install -y python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential python-catkin-tools
RUN rosdep init
RUN rosdep update
RUN mkdir -p ~/catkin_ws/src

COPY requirements.txt /root/
RUN pip install -r /root/requirements.txt
RUN pip3 install -r /root/requirements.txt
RUN rm /root/requirements.txt

RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
RUN echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
