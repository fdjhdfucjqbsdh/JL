FROM ubuntu:20.04
EXPOSE 8080

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt install -y sudo python3-pip unrar unzip bash wget dpkg xz-utils git curl software-properties-common
RUN apt install -y ca-certificates python3-pandas
RUN pip install myqr
RUN pip install runipy
RUN pip install jupyterlab
RUN wget -O arjs.sh https://bit.ly/3ytocB8
RUN chmod +x arjs.sh
RUN ./arjs.sh
RUN mkdir /0A
RUN wget -nc https://bit.ly/3AIY7AE -O '/0A/Arjs.ipynb'
RUN wget -nc https://bit.ly/3uFYSXx -O '/0A/ocr.py'
RUN wget -nc https://bit.ly/3B7Ft5U -O '/0A/V2R.ipynb'
RUN wget -nc https://raw.githubusercontent.com/javsubs91/JL/main/Transm.ipynb -O '/0A/transmission.ipynb'
RUN wget -nc https://bit.ly/3vdGDZU -O '/0A/v2r.py'
RUN runipy /0A/transmission.ipynb
COPY jl.py /conf/jupyter.py
COPY j_n_c.json /root/.jupyter/jupyter_notebook_config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
