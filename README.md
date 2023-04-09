# docker-ros-melodic-template
## Prerequests
You have to install Docker and nvidia-docker2.

### How to install Docker on ubuntu
You can use official shell script from Docker.
Run command below.
```
$ curl -fsSL https://get.docker.com -o get-docker.sh
$ sudo sh get-docker.sh
$ sudo usermod -aG docker $USER
```
Then, you have to logout and re-login to your user.

### How to install nvidia-docker2
Run command below.
```
$ distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
$ curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
$ curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list
$ sudo tee /etc/apt/sources.list.d/nvidia-docker.list
$ sudo apt-get update
$ sudo apt-get install -y nvidia-docker2
$ sudo systemctl restart docker
```

## Usage
### Bluild docker image
You have to build docker image using `build-docker-image.sh` in `shell_scripts` directory.
In `build` directory, there are two files.
`Dockerfile` is blueprint of docker image. If you want to install another function, you can change its description.
`requirements.txt` is a lsit of python packages to install.
This is also you can add any python packages.
```
$ chmod 777 build-docker-image.sh
$ ./build-docker-image.sh
```

### Set container name using shell script
You can set favorite container name using `set-container-name.sh` in shell_scripts directory.
If you execute this script, the script generate another four shell scripts.
```
$ chmod 777 set-container-name.sh
$ ./set-container-name.sh
```

### Create container from image
You cannot attach to a container just by building the image.
You have to create a container by running the script.

**ATTENTION**  
**YOU ONLY HAVE TO DO THIS ONCE AT THE BEGINNING!**
```
$ ./run.sh
```


### Start the container
```
$ ./start.sh
```

### Attach to the container
```
$ ./exec.sh
```

### Stop the container
```
$ ./stop.sh
```