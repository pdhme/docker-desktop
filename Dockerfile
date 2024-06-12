FROM debian:stable

RUN apt-get update -y
RUN apt-get install -y tigervnc-standalone-server xvfb dbus-x11 novnc xfce4 xfce4-goodies
RUN apt-get install -y onboard curl
RUN ln -sf /usr/share/novnc/vnc.html /usr/share/novnc/index.html

RUN curl "https://archive.seamonkey-project.org/releases/2.53.18.2/linux-x86_64/en-GB/seamonkey-2.53.18.2.en-GB.linux-x86_64.tar.bz2" | tar -jxf -

EXPOSE 80
WORKDIR /root
RUN mkdir .vnc
COPY xs .vnc/xstartup

ARG passwd="passwd"
RUN { echo $passwd; echo $passwd; echo n; } | vncpasswd

COPY init /init
#COPY s /usr/sbin/shutdown
CMD ["/init"]
