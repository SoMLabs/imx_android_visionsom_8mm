# -------@block_infrastructure-------

VISIONSOM_COMMON_DEVICE_PATH := device/nxp/visionsom_8mm/visionsom_8mm_common
NXP_COMMON_DEVICE_PATH := device/nxp

CURRENT_FILE_PATH :=  $(lastword $(MAKEFILE_LIST))
IMX_DEVICE_PATH := $(strip $(patsubst %/, %, $(dir $(CURRENT_FILE_PATH))))

PRODUCT_ENFORCE_ARTIFACT_PATH_REQUIREMENTS := true

# configs shared between uboot, kernel and Android rootfs
include $(IMX_DEVICE_PATH)/SharedBoardConfig.mk

-include $(NXP_COMMON_DEVICE_PATH)/common/imx_path/ImxPathConfig.mk
include $(VISIONSOM_COMMON_DEVICE_PATH)/ProductConfigCommon.mk

# -------@block_common_config-------

# Overrides
PRODUCT_NAME := visioncb_8mm_std_hdmi 
PRODUCT_DEVICE := visioncb_8mm_std_hdmi
PRODUCT_MODEL := VISIONCB_8MM_STD_HDMI

PRODUCT_COPY_FILES += \
    $(IMX_DEVICE_PATH)/audio-json/dummy_config.json:$(TARGET_COPY_OUT_VENDOR)/etc/configs/audio/dummy_config.json

