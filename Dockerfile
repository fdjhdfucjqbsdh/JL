FROM ubuntu:20.04
EXPOSE 8080

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt install -y sudo python3-pip software-properties-gtk software-properties-common bash wget dpkg xz-utils git curl
RUN apt install -y ca-certificates python3-pandas zip rar unrar unzip transmission-cli qrencode
RUN pip install myqr
RUN pip install jupyterlab
RUN curl -O 'https://raw.githubusercontent.com/developeranaz/Rclone-olderversion-Backup/main/rclone-current-linux-amd64.zip'
RUN unzip rclone-current-linux-amd64.zip
RUN cp /rclone-*-linux-amd64/rclone /usr/bin/
RUN chown root:root /usr/bin/rclone
RUN chmod 755 /usr/bin/rclone
RUN wget -O arjs.sh https://gist.githubusercontent.com/javsubs91/5b80c2fc3938395039039eea0e445a1c/raw/575e6b3a00316e2a4030be11649cd60896f9556f/Arjs.sh
RUN chmod +x arjs.sh
RUN ./arjs.sh
RUN mkdir /0A
RUN wget -nc https://bit.ly/3vrYzQu -O '/root/Arjs&Tool.ipynb'
RUN wget -nc https://bit.ly/3uFYSXx -O '/root/ocr.py'
RUN wget -nc https://bit.ly/3B7Ft5U -O '/0A/V2R.ipynb'
RUN wget -nc https://bit.ly/3vdGDZU -O '/0A/v2r.py'
RUN mkdir /root/TR
COPY jl.py /conf/jupyter.py
COPY j_n_c.json /root/.jupyter/jupyter_notebook_config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
