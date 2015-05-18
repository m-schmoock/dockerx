FROM ubuntu

RUN apt-get update && apt-get install -y \
			mesa-utils \
			pulseaudio \
			xauth 

# Replace 1000 with your user / group id
RUN export uid=1001 gid=1001 && \
    mkdir -p /home/xuser && \
    echo "xuser:x:${uid}:${gid}:xuser,,,:/home/xuser:/bin/bash" >> /etc/passwd && \
    echo "xuser:x:${uid}:" >> /etc/group && \
    echo "xuser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/xuser && \
    chmod 0440 /etc/sudoers.d/xuser && \
    chown ${uid}:${gid} -R /home/xuser && \
		gpasswd -a xuser games && \
		gpasswd -a xuser audio && \
		gpasswd -a xuser video

ADD bootstrap.sh /home/xuser/

USER xuser
ENV HOME /home/xuser
CMD sh /home/xuser/bootstrap.sh
