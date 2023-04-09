docker run --gpus all --privileged --name container_name --net=host \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v `pwd`/src:/root/catkin_ws/src \
    -itd nvidia/cudagl-10.1-devel-ubuntu18.04:ros-melodic /bin/bash

