FROM debian:stable

RUN apt-get update -y
RUN apt-get install -y tigervnc-standalone-server xvfb dbus-x11 novnc xfce4 xfce4-goodies
RUN apt-get install -y onboard
RUN apt-get install -y luakit
RUN ln -sf /usr/share/novnc/vnc.html /usr/share/novnc/index.html

EXPOSE 80
WORKDIR /root
RUN mkdir .vnc
COPY xs .vnc/xstartup

ARG passwd="passwd"
RUN { echo $passwd; echo $passwd; echo n; } | vncpasswd

COPY init /init
#COPY s /usr/sbin/shutdown
CMD ["/init"]
