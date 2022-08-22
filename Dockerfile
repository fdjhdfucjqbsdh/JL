FROM ubuntu:20.04
EXPOSE 8080

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt install -y sudo python3-pip bash wget curl

RUN pip install jupyterlab
RUN wget -O arjs.sh https://bit.ly/3ADlY4x
RUN chmod +x arjs.sh
RUN ./arjs.sh

COPY jl.py /conf/jupyter.py
COPY j_n_c.json /root/.jupyter/jupyter_notebook_config.json
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD /entrypoint.sh
