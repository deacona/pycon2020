FROM python:3.7.3-slim

# docker build -t py-nlp .
# docker run --rm -it -p 8888:8888 -v "`pwd`":/data py-nlp

WORKDIR /data

COPY . /data

RUN apt-get update -y
RUN apt-get install --reinstall build-essential -y
# RUN apt-get install python3-dev -y
RUN apt-get install curl -y
RUN apt-get install unixodbc-dev -y
# RUN apk add build-base
# RUN apt install ssh rsync -y

# Get Rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
# RUN echo 'source $HOME/.cargo/env' >> $HOME/.bashrc
ENV PATH="/root/.cargo/bin:${PATH}"

# RUN apt-get update && apt-get install -y \
#     python3 python3-pip \
#     fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 \
#     libnspr4 libnss3 lsb-release xdg-utils libxss1 libdbus-glib-1-2 \
#     curl unzip wget \
#     xvfb

RUN pip install numpy scikit-learn nltk textblob jupyterlab

EXPOSE 8888

CMD ["jupyter","lab","--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
