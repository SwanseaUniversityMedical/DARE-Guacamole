FROM ubuntu:22.04

LABEL org.opencontainers.image.source=https://github.com/SwanseaUniversityMedical/DARE-Guacamole

COPY controller /opt/controller
RUN pip install --no-cache-dir -e /opt/controller && \
    rm -rf /tmp

USER 1001
ENTRYPOINT /opt/controller/entrypoint.sh
