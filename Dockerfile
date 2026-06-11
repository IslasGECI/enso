FROM islasgeci/base:22.04
COPY . /workdir
RUN apt install --yes libuv1
RUN R -e "install.packages(c('comprehenr', 'R6'), repos = 'https://cloud.r-project.org')"

