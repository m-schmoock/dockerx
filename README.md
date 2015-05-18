# dockerx
a docker image that can run local GUI applications

## BUILD:
	> docker build -t dockerx .

## RUN:
	> docker run -ti --rm -e DISPLAY=:0.0 -e XCOOKIE=$(xauth list | cut -d " " -f 5) -v /tmp/.X11-unix:/tmp/.X11-unix dockerx
