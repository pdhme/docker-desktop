FROM adelielinux/adelie

RUN apk update
RUN apk add x11vnc xvfb dbus-x11 git
RUN apk add xfce-desktop
RUN git clone https://github.com/novnc/noVNC.git /usr/share/novnc
RUN ln -sf /usr/share/novnc/vnc.html /usr/share/novnc/index.html

RUN curl "https://archive.seamonkey-project.org/releases/2.53.18.2/linux-x86_64/en-GB/seamonkey-2.53.18.2.en-GB.linux-x86_64.tar.bz2" | tar -jxf -

RUN apk add bash vim hyfetch
RUN usermod -s /bin/bash root

EXPOSE 80
WORKDIR /root
COPY xinit .xinitrc

CMD ["startx", "--", "/usr/bin/Xvfb"]
