FROM ubuntu:latest
EXPOSE 8080

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt install -y sudo python3-pip unrar unzip bash wget dpkg xz-utils git curl software-properties-common
RUN apt install -y ca-certificates nautilus keyboard-configuration xvfb xbase-clients python3-psutil
RUN pip install jupyterlab
RUN wget -N git.io/aria2.sh && chmod +x aria2.sh
RUN printf 1 | ./aria2.sh
RUN printf 12 | ./aria2.sh
RUN sudo apt-get install xfce4 xfce4-terminal dbus-x11 -y
RUN wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
RUN sudo dpkg -i /chrome-remote-desktop_current_amd64.deb
RUN sudo apt-get -y install -f
RUN sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A6DCF7707EBC211F
RUN sudo apt-add-repository "deb http://ppa.launchpad.net/ubuntu-mozilla-security/ppa/ubuntu focal main"
RUN sudo apt update
RUN sudo apt install firefox -y
RUN wget https://github.com/subhra74/xdm/releases/download/7.2.11/xdm-setup-7.2.11.tar.xz
RUN tar -xf /xdm-setup-7.2.11.tar.xz
RUN sudo /install.sh
RUN pip install dottorrent-gui
RUN mkdir /JupyterLab
COPY JupyterLab /JupyterLab
COPY jupyter.py /conf/jupyter.py
COPY jupyter_notebook_config.json /root/.jupyter/jupyter_notebook_config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
