FROM islasgeci/base:latest
COPY . /workdir
RUN apt install --yes libuv1

