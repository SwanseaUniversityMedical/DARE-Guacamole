FROM ubuntu:22.04

LABEL org.opencontainers.image.source=https://github.com/SwanseaUniversityMedical/DARE-Guacamole

RUN apt-get update && \
    apt-get install -y --no-install-recommends python3-pip && \
    apt-get autoremove -y --purge && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp

COPY controller /opt/controller
RUN pip3 install --no-cache-dir -e /opt/controller && \
    rm -rf /tmp

ENTRYPOINT /opt/controller/entrypoint.sh
