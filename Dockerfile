## how to use
## docker build -t commpy
## docker run commpy python3 <file_name_to_run>
## i.e. docker run commpy python3 commpy/examples/conv_encode_decode.py

FROM python:3.8-buster
RUN apt update && apt upgrade -y
RUN apt install -y build-essential

WORKDIR /commpy
ADD requirements.txt requirements.txt

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install dependencies:
RUN pip install -r requirements.txt

ADD . .
ENV PYTHONPATH="."
