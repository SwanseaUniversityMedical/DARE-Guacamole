FROM balenalib/qemux86-64-ubuntu-node:16-focal-build as build

COPY customize.sh /tmp/customize.sh
COPY cloud-config /tmp/cloud-config
RUN /tmp/customize.sh


FROM kubevirt/container-disk-v1alpha:v0.13.7

LABEL org.opencontainers.image.source=https://github.com/SwanseaUniversityMedical/DARE-Guacamole

# Copy the qemu generated disk image into the container
COPY --from=build /disk/img.qcow2 /disk/
