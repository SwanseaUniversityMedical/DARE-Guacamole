FROM ubuntu:22.04 as build

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      qemu-kvm qemu-utils qemu-guest-agent \
      libvirt-daemon-system libvirt-clients \
      bridge-utils cloud-init curl && \
    apt-get autoremove -y --purge && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp

COPY customize.sh /tmp/customize.sh
COPY cloud-config /tmp/cloud-config
RUN chmod +x /tmp/customize.sh && \
    /tmp/customize.sh

FROM kubevirt/container-disk-v1alpha:v0.13.7

LABEL org.opencontainers.image.source=https://github.com/SwanseaUniversityMedical/DARE-Guacamole

# Copy the qemu generated disk image into the container
COPY --from=build /disk/img.qcow2 /disk/
