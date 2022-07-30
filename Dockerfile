FROM ubuntu:20.04
EXPOSE 8080

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt install -y sudo python3-pip software-properties-gtk software-properties-common bash wget dpkg xz-utils git curl
RUN apt install -y ca-certificates python3-pandas zip rar unrar unzip
RUN pip install myqr
RUN pip install jupyterlab
RUN wget -O arjs.sh https://bit.ly/3ytocB8
RUN chmod +x arjs.sh
RUN ./arjs.sh
RUN rm -r /root/.aria2c/aria2.conf
RUN wget -nc https://tinyurl.com/mmfzed6s -O '/root/.aria2c/aria2.conf'
RUN chmod +x /root/.aria2c/aria2.conf
RUN mkdir /0A
RUN wget -nc https://bit.ly/3AIY7AE -O '/0A/Arjs.ipynb'
RUN wget -nc https://bit.ly/3uFYSXx -O '/0A/ocr.py'
RUN wget -nc https://bit.ly/3B7Ft5U -O '/0A/V2R.ipynb'
RUN wget -nc https://bit.ly/3vdGDZU -O '/0A/v2r.py'
COPY jl.py /conf/jupyter.py
COPY j_n_c.json /root/.jupyter/jupyter_notebook_config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
