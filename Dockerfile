FROM islasgeci/base:22.04
COPY . /workdir
RUN apt install --yes libuv1

