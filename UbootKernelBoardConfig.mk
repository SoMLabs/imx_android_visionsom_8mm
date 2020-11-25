KERNEL_IMX_PATH := vendor/somlabs
UBOOT_IMX_PATH := vendor/somlabs
IMX_MKIMAGE_PATH := vendor/somlabs

TARGET_BOOTLOADER_POSTFIX := bin
UBOOT_POST_PROCESS := true

TARGET_BOOTLOADER_CONFIG := imx8mm:visionsom_8mm_android_defconfig
TARGET_BOOTLOADER_CONFIG += imx8mm-evk-uuu:visionsom_8mm_android_uuu_defconfig


# imx8mm kernel defconfig
TARGET_KERNEL_DEFCONFIG := visionsom_8mm_android_defconfig
TARGET_KERNEL_ADDITION_DEFCONF := android_addition_defconfig

# absolute path is used, not the same as relative path used in AOSP make
TARGET_DEVICE_DIR := $(patsubst %/, %, $(dir $(realpath $(lastword $(MAKEFILE_LIST)))))

# define bootloader rollback index
BOOTLOADER_RBINDEX ?= 0
