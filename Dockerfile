FROM ubuntu:20.04
EXPOSE 8080

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt install -y sudo python3-pip software-properties-gtk software-properties-common bash wget dpkg xz-utils git curl
RUN apt install -y ca-certificates python3-pandas zip rar unrar unzip transmission-cli
RUN pip install myqr
RUN pip install jupyterlab
RUN wget -O arjs.sh https://bit.ly/3cPxZKE
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
