sudo apt-get update
sudo apt-get install -y --no-install-recommends \
  qemu-kvm qemu-utils qemu-guest-agent \
  libvirt-daemon-system libvirt-daemon-driver-qemu libvirt-clients virt-manager virtinst \
  bridge-utils cloud-init cloud-utils cpu-checker

set -x
set -e

readonly SOURCE_IMAGE_URL="https://cloud-images.ubuntu.com/focal/20230915/focal-server-cloudimg-amd64-disk-kvm.img"
readonly SOURCE_IMAGE_PATH="/tmp/source-disk.img"
readonly CUSTOMIZE_IMAGE_PATH="img.qcow2"

curl ${SOURCE_IMAGE_URL} -o ${SOURCE_IMAGE_PATH}

readonly DOMAIN_NAME="provision-vm"
readonly CLOUD_INIT_ISO="/tmp/cloudinit.iso"
readonly CLOUD_CONFIG_PATH="cloud-config"

cloud-localds "${CLOUD_INIT_ISO}" "${CLOUD_CONFIG_PATH}"

virt-install \
  --connect qemu:///system \
  --memory 2048 \
  --vcpus 2 \
  --name ${DOMAIN_NAME} \
  --disk "${SOURCE_IMAGE_PATH}",device=disk \
  --disk "${CLOUD_INIT_ISO}",device=cdrom \
  --os-variant "ubuntu22.04" \
  --graphics none \
  --network default \
  --import \
  --arch "x86_64" \
  --debug \
  --serial file,path=/tmp/provision-vm-console.log

virsh destroy "${DOMAIN_NAME}" || true

virt-sysprep -d "${DOMAIN_NAME}" --operations machine-id,bash-history,logfiles,tmp-files,net-hostname,net-hwaddr

virsh undefine --nvram "${DOMAIN_NAME}" || true

qemu-img convert -c -O qcow2 "${SOURCE_IMAGE_PATH}" "${CUSTOMIZE_IMAGE_PATH}"
