# -------@block_kernel_bootimg-------

KERNEL_NAME := Image.lz4
TARGET_KERNEL_ARCH := arm64

BOARD_VENDOR_KERNEL_MODULES += \
    $(KERNEL_OUT)/drivers/mxc/gpu-viv/galcore.ko \
    $(KERNEL_OUT)/drivers/mxc/hantro_845/hantrodec_845s.ko \
    $(KERNEL_OUT)/drivers/mxc/hantro_845_h1/hx280enc.ko \
    $(KERNEL_OUT)/drivers/mxc/hantro_v4l2/vsiv4l2.ko \

TARGET_BOOTLOADER_BOARD_NAME := EVK

TARGET_USE_VENDOR_BOOT := true

BOARD_BUILD_SUPER_IMAGE_BY_DEFAULT := true
BOARD_SUPER_IMAGE_IN_UPDATE_PACKAGE := true


