# This is a FSL Android Reference Design platform based on i.MX8QP ARD board
# It will inherit from FSL core product which in turn inherit from Google generic

VISIONSOM_DEVICE_PATH := device/fsl/visionsom_8mm/visioncb_8mm_adv_hdmi
VISIONSOM_COMMON_DEVICE_PATH := device/fsl/visionsom_8mm/visionsom_8mm_common

# configs shared between uboot, kernel and Android rootfs
include $(VISIONSOM_DEVICE_PATH)/SharedBoardConfig.mk

-include device/fsl/common/imx_path/ImxPathConfig.mk
include $(VISIONSOM_COMMON_DEVICE_PATH)/ProductConfigCommon.mk

ifneq ($(wildcard $(VISIONSOM_COMMON_DEVICE_PATH)/fstab.freescale),)
$(shell touch $(VISIONSOM_COMMON_DEVICE_PATH)/fstab.freescale)
endif

# Overrides
PRODUCT_NAME := visioncb_8mm_adv_hdmi
PRODUCT_DEVICE := visioncb_8mm_adv_hdmi
PRODUCT_MODEL := VISIONCB_8MM_ADV_HDMI

# Audio card json
PRODUCT_COPY_FILES += \
    $(VISIONSOM_DEVICE_PATH)/audio-json/nau8822_config.json:$(TARGET_COPY_OUT_VENDOR)/etc/configs/audio/nau8822_config.json \
    $(VISIONSOM_DEVICE_PATH)/audio-json/dummy_config.json:$(TARGET_COPY_OUT_VENDOR)/etc/configs/audio/dummy_config.json \
    device/fsl/common/audio-json/readme.txt:$(TARGET_COPY_OUT_VENDOR)/etc/configs/audio/readme.txt
