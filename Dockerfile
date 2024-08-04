FROM balenalib/intel-nuc-debian-python

# Install XORG
RUN apt-get update && apt-get install -y \
    xserver-xorg\
    xserver-xorg-input-evdev \
    xinit \
    xfce4 \
    xfce4-terminal \
    x11-xserver-utils \
    dbus-x11 \
    matchbox-keyboard \
    xterm \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    libxcb-xinerama0 \
    libxkbcommon0 \
    libegl1-mesa \
    libsm6 \
    libxext6 \
    libxrender1 \
    fontconfig \
    libglib2.0-0 \
    dbus \
    libx11-xcb1 \
    libxcb-cursor0 \
    libxcomposite1 \
    libxdamage1 \
    libxi6 \
    libxtst6 \
    libxrandr2 \
    libfontconfig1 \
    libfreetype6 \
    libxcb-shape0 \
    libxcb-xfixes0 \
    libxcb-render-util0 \
    libxcb-render0 \
    libxkbcommon-x11-0 \
    libxcb-icccm4 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-randr0 \
    libxcb-shm0 \
    libxcb-util1 \
    libxcb-xinerama0 \
    libxcb-xkb1 \
    libglvnd0 \
    xvfb \
    && rm -rf /var/lib/apt/lists/*


# Disable screen from turning it off
RUN echo "#!/bin/bash" > /etc/X11/xinit/xserverrc \
  && echo "" >> /etc/X11/xinit/xserverrc \
  && echo 'exec /usr/bin/X -s 0 dpms' >> /etc/X11/xinit/xserverrc

# Setting working directory
WORKDIR /usr/src/app

RUN pip install PyQt6

COPY . ./

ENV UDEV=1
ENV XFCE_PANEL_MIGRATE_DEFAULT=1
#ENV DISPLAY=:0.0

# Avoid requesting XFCE4 question on X start
ENV XFCE_PANEL_MIGRATE_DEFAULT=1

CMD ["echo"