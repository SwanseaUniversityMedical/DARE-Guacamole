FROM python:alpine3.18

LABEL org.opencontainers.image.source=https://github.com/SwanseaUniversityMedical/DARE-Guacamole

# Change to non-root user
USER 1001

COPY controller /opt/controller
RUN pip install --no-cache-dir pyclean && \
    pip install --no-cache-dir -e /opt/controller && \
    pyclean -v ~/.local && \
    pip uninstall -y pyclean && \
    rm -rf /tmp

ENTRYPOINT /opt/controller/entrypoint.sh
