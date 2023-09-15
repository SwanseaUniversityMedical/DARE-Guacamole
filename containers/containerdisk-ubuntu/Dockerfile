FROM balenalib/qemux86-64-ubuntu-node:16-focal-build as build



#RUN virt-sysprep -a /img.qcow --operations machine-id,bash-history,logfiles,tmp-files,net-hostname,net-hwaddr


FROM kubevirt/container-disk-v1alpha:v0.13.7

LABEL org.opencontainers.image.source=https://github.com/SwanseaUniversityMedical/DARE-Guacamole

# Copy the qemu generated disk image into the container
COPY --from=build /disk/img.qcow2 /disk/
