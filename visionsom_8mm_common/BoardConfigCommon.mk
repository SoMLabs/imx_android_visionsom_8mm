# -------@block_common_config-------
ENABLE_DMABUF_HEAP := true

SOONG_CONFIG_NAMESPACES += IMXPLUGIN
SOONG_CONFIG_IMXPLUGIN += BOARD_PLATFORM \
NUM_FRAMEBUFFER_SURFACE_BUFFERS \
BOARD_USE_SENSOR_FUSION \
BOARD_SOC_CLASS \
HAVE_FSL_IMX_GPU3D \
TARGET_HWCOMPOSER_VERSION \
TARGET_GRALLOC_VERSION \
PREBUILT_FSL_IMX_GPU \
PREBUILT_FSL_IMX_ISP \
BOARD_SOC_TYPE \
PRODUCT_MANUFACTURER \
BOARD_VPU_ONLY \
BOARD_HAVE_VPU \
PREBUILT_FSL_IMX_CODEC \
POWERSAVE \
ENABLE_DMABUF_HEAP

SOONG_CONFIG_IMXPLUGIN_BOARD_PLATFORM = imx8
SOONG_CONFIG_IMXPLUGIN_BOARD_USE_SENSOR_FUSION = true
SOONG_CONFIG_IMXPLUGIN_BOARD_SOC_CLASS = IMX8
SOONG_CONFIG_IMXPLUGIN_HAVE_FSL_IMX_GPU3D = true
SOONG_CONFIG_IMXPLUGIN_ENABLE_DMABUF_HEAP = true

#
# Product-specific compile-time definitions.
#

ifeq ($(IMX8_BUILD_32BIT_ROOTFS),true)
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a9
TARGET_USES_64_BIT_BINDER := true
else
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a9
endif

BOARD_SOC_CLASS := IMX8
SOONG_CONFIG_IMXPLUGIN_PRODUCT_MANUFACTURER = nxp

# -------@block_kernel_bootimg-------
TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false
TARGET_NO_RECOVERY := true
TARGET_NO_RADIOIMAGE := true


BOARD_KERNEL_OFFSET := 0x00080000
BOARD_RAMDISK_OFFSET := 0x04280000
ifeq ($(TARGET_USE_VENDOR_BOOT),true)
BOARD_BOOT_HEADER_VERSION := 4
BOARD_INCLUDE_DTB_IN_BOOTIMG := false
else
BOARD_BOOT_HEADER_VERSION := 1
endif

BOARD_MKBOOTIMG_ARGS = --kernel_offset $(BOARD_KERNEL_OFFSET) --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --header_version $(BOARD_BOOT_HEADER_VERSION)

ifeq ($(TARGET_USE_VENDOR_BOOT),true)
  BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
else
  BOARD_USES_RECOVERY_AS_BOOT := true
endif

# kernel module's copy to vendor need this folder setting
KERNEL_OUT ?= $(OUT_DIR)/target/product/$(PRODUCT_DEVICE)/obj/KERNEL_OBJ

PRODUCT_COPY_FILES += \
    $(KERNEL_OUT)/arch/$(TARGET_KERNEL_ARCH)/boot/$(KERNEL_NAME):kernel

TARGET_BOARD_KERNEL_HEADERS := $(NXP_COMMON_DEVICE_PATH)/common/kernel-headers

TARGET_IMX_KERNEL ?= false
ifeq ($(TARGET_IMX_KERNEL),false)
# boot-debug.img is built by IMX, with Google released kernel Image
# boot.img is released by Google
ifneq (,$(filter userdebug eng,$(TARGET_BUILD_VARIANT)))
BOARD_PREBUILT_BOOTIMAGE := vendor/nxp/fsl-proprietary/gki/boot-debug.img
else
BOARD_PREBUILT_BOOTIMAGE := vendor/nxp/fsl-proprietary/gki/boot.img
endif
TARGET_NO_KERNEL := true
endif

# -------@block_app-------
# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif

# -------@block_storage-------
AB_OTA_UPDATER := true
ifeq ($(IMX_NO_PRODUCT_PARTITION),true)
AB_OTA_PARTITIONS += dtbo boot system system_ext vendor vbmeta
else
ifeq ($(TARGET_USE_VENDOR_BOOT),true)
AB_OTA_PARTITIONS += dtbo boot vendor_boot system system_ext vendor vbmeta product
else
AB_OTA_PARTITIONS += dtbo boot system system_ext vendor vbmeta product
endif
endif

BOARD_DTBOIMG_PARTITION_SIZE := 4194304
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
ifeq ($(TARGET_USE_VENDOR_BOOT),true)
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
endif

BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE = ext4
TARGET_COPY_OUT_VENDOR := vendor

ifneq ($(IMX_NO_PRODUCT_PARTITION),true)
  BOARD_USES_PRODUCTIMAGE := true
  BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
  TARGET_COPY_OUT_PRODUCT := product
endif

# Build a separate system_ext.img partition
BOARD_USES_SYSTEM_EXTIMAGE := true
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_SYSTEM_EXT := system_ext

BOARD_FLASH_BLOCK_SIZE := 4096

BOARD_SUPER_PARTITION_GROUPS := nxp_dynamic_partitions
BOARD_SUPER_PARTITION_SIZE := 4294967296
BOARD_NXP_DYNAMIC_PARTITIONS_SIZE := 4284481536
BOARD_NXP_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext vendor product

# -------@block_bluetooth-------
BOARD_HAVE_BLUETOOTH := true

# -------@block_camera-------
BOARD_HAVE_IMX_CAMERA := true

# -------@block_display-------
TARGET_GRALLOC_VERSION := v4
TARGET_HWCOMPOSER_VERSION := v2.0

SOONG_CONFIG_IMXPLUGIN_NUM_FRAMEBUFFER_SURFACE_BUFFERS = 3
SOONG_CONFIG_IMXPLUGIN_TARGET_HWCOMPOSER_VERSION = v2.0
SOONG_CONFIG_IMXPLUGIN_TARGET_GRALLOC_VERSION = v4

TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"

TARGET_RECOVERY_UI_LIB := librecovery_ui_imx


# -------@block_gpu-------
# Indicate use vivante drm based egl and gralloc
BOARD_GPU_DRIVERS := vivante

# Indicate use NXP libdrm-imx or Android external/libdrm
BOARD_GPU_LIBDRM := libdrm_imx

PREBUILT_FSL_IMX_GPU := true
SOONG_CONFIG_IMXPLUGIN_PREBUILT_FSL_IMX_GPU = true

# override some prebuilt setting if DISABLE_FSL_PREBUILT is define
ifneq (,$(filter GPU ALL,$(DISABLE_FSL_PREBUILT)))
    PREBUILT_FSL_IMX_GPU := false
    SOONG_CONFIG_IMXPLUGIN_PREBUILT_FSL_IMX_GPU = false
endif

# -------@block_isp-------
PREBUILT_FSL_IMX_ISP := true
SOONG_CONFIG_IMXPLUGIN_PREBUILT_FSL_IMX_ISP = true

# override some prebuilt setting if DISABLE_FSL_PREBUILT is define
ifneq (,$(filter ISP ALL,$(DISABLE_FSL_PREBUILT)))
    PREBUILT_FSL_IMX_ISP := false
    SOONG_CONFIG_IMXPLUGIN_PREBUILT_FSL_IMX_ISP = false
endif

# -------@block_sensor-------
PREBUILT_FSL_IMX_SENSOR_FUSION := true

# override some prebuilt setting if DISABLE_FSL_PREBUILT is define
ifneq (,$(filter SENSOR_FUSION ALL,$(DISABLE_FSL_PREBUILT)))
    PREBUILT_FSL_IMX_SENSOR_FUSION := false
endif

# -------@block_treble-------
BOARD_VNDK_VERSION := current

# -------@block_multimedia_codec-------

-include $(FSL_RESTRICTED_CODEC_PATH)/fsl-restricted-codec/fsl_ms_codec/BoardConfig.mk
-include $(FSL_RESTRICTED_CODEC_PATH)/fsl-restricted-codec/fsl_real_dec/BoardConfig.mk

BOARD_MOVE_GSI_AVB_KEYS_TO_VENDOR_BOOT := true

# Set Vendor SPL to match platform
VENDOR_SECURITY_PATCH = $(PLATFORM_SECURITY_PATCH)

# Set boot SPL
BOOT_SECURITY_PATCH = $(PLATFORM_SECURITY_PATCH)

# -------@block_common_config-------
#
# SoC-specific compile-time definitions.
#

# value assigned in this part should be fixed for an SoC, right?

BOARD_SOC_TYPE := IMX8MM
BOARD_HAVE_VPU := true
BOARD_VPU_TYPE := hantro
FSL_VPU_OMX_ONLY := true
HAVE_FSL_IMX_GPU2D := true
HAVE_FSL_IMX_GPU3D := true
HAVE_FSL_IMX_PXP := false
TARGET_USES_HWC2 := true
TARGET_HAVE_VULKAN := true

SOONG_CONFIG_IMXPLUGIN += \
                          BOARD_VPU_TYPE

SOONG_CONFIG_IMXPLUGIN_BOARD_SOC_TYPE = IMX8MM
SOONG_CONFIG_IMXPLUGIN_BOARD_HAVE_VPU = true
SOONG_CONFIG_IMXPLUGIN_BOARD_VPU_TYPE = hantro
SOONG_CONFIG_IMXPLUGIN_BOARD_VPU_ONLY = false
SOONG_CONFIG_IMXPLUGIN_PREBUILT_FSL_IMX_CODEC = true
SOONG_CONFIG_IMXPLUGIN_POWERSAVE = false

# -------@block_memory-------
USE_ION_ALLOCATOR := true
USE_GPU_ALLOCATOR := false

# -------@block_storage-------
TARGET_USERIMAGES_USE_EXT4 := true

# use sparse image
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

# Support gpt
BOARD_BPT_INPUT_FILES += $(NXP_COMMON_DEVICE_PATH)/common/partition/device-partitions-13GB-ab_super.bpt
ADDITION_BPT_PARTITION = partition-table-28GB:$(NXP_COMMON_DEVICE_PATH)/common/partition/device-partitions-28GB-ab_super.bpt \
                         partition-table-14GB:$(NXP_COMMON_DEVICE_PATH)/common/partition/device-partitions-13GB-ab_super.bpt \
                         partition-table-28GB-dual:$(NXP_COMMON_DEVICE_PATH)/common/partition/device-partitions-28GB-ab-dual-bootloader_super.bpt \
                         partition-table-14GB-dual:$(NXP_COMMON_DEVICE_PATH)/common/partition/device-partitions-13GB-ab-dual-bootloader_super.bpt

BOARD_PREBUILT_DTBOIMAGE := $(OUT_DIR)/target/product/$(PRODUCT_DEVICE)/dtbo-imx8mm.img

BOARD_USES_METADATA_PARTITION := true
BOARD_ROOT_EXTRA_FOLDERS += metadata

# -------@block_security-------
ENABLE_CFI=false

BOARD_AVB_ENABLE := true
BOARD_AVB_ALGORITHM := SHA256_RSA4096
# The testkey_rsa4096.pem is copied from external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_KEY_PATH := $(NXP_COMMON_DEVICE_PATH)/common/security/testkey_rsa4096.pem

BOARD_AVB_BOOT_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_BOOT_ALGORITHM := SHA256_RSA2048
BOARD_AVB_BOOT_ROLLBACK_INDEX_LOCATION := 2

# -------@block_treble-------
# Vendor Interface manifest and compatibility
DEVICE_MANIFEST_FILE := $(VISIONSOM_COMMON_DEVICE_PATH)/manifest.xml
DEVICE_MATRIX_FILE := $(VISIONSOM_COMMON_DEVICE_PATH)/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(VISIONSOM_COMMON_DEVICE_PATH)/device_framework_matrix.xml


# -------@block_wifi-------
BOARD_WLAN_DEVICE            := bcmdhd
WPA_SUPPLICANT_VERSION       := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER  := NL80211
BOARD_HOSTAPD_DRIVER         := NL80211
BOARD_HOSTAPD_PRIVATE_LIB               := lib_driver_cmd_bcmdhd
BOARD_WPA_SUPPLICANT_PRIVATE_LIB        := lib_driver_cmd_bcmdhd

WIFI_DRIVER_FW_PATH_PARAM      := "/sys/module/brcmfmac/parameters/alternative_fw_path"

BOARD_VENDOR_KERNEL_MODULES += \
                            $(KERNEL_OUT)/drivers/net/wireless/broadcom/brcm80211/brcmfmac/brcmfmac.ko \
                            $(KERNEL_OUT)/drivers/net/wireless/broadcom/brcm80211/brcmutil/brcmutil.ko

BOARD_USES_ALSA_AUDIO := true

BOARD_VENDOR_KERNEL_MODULES += \
                            $(KERNEL_OUT)/sound/drivers/snd-dummy.ko


# -------@block_bluetooth-------
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(VISIONSOM_COMMON_DEVICE_PATH)/bluetooth
BOARD_CUSTOM_BT_CONFIG := $(VISIONSOM_COMMON_DEVICE_PATH)/somlabs_libbt_config.txt

# -------@block_sensor-------
BOARD_USE_SENSOR_FUSION := true

# -------@block_kernel_bootimg-------
BOARD_KERNEL_BASE := 0x40400000

CMASIZE=800M

# NXP default config
BOARD_KERNEL_CMDLINE := init=/init firmware_class.path=/vendor/firmware loop.max_part=7 bootconfig
BOARD_BOOTCONFIG += androidboot.console=ttymxc3 androidboot.hardware=nxp

# memory config
BOARD_KERNEL_CMDLINE += transparent_hugepage=never
BOARD_KERNEL_CMDLINE += cma=$(CMASIZE)@0x400M-0xb80M

# display config
BOARD_BOOTCONFIG += androidboot.lcd_density=240 androidboot.primary_display=imx-drm

# wifi config
BOARD_BOOTCONFIG += androidboot.wificountrycode=CN

ifneq (,$(filter userdebug eng,$(TARGET_BUILD_VARIANT)))
BOARD_BOOTCONFIG += androidboot.vendor.sysrq=1
endif

ALL_DEFAULT_INSTALLED_MODULES += $(BOARD_VENDOR_KERNEL_MODULES)

# -------@block_sepolicy-------
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    $(VISIONSOM_COMMON_DEVICE_PATH)/system_ext_pri_sepolicy

BOARD_SEPOLICY_DIRS := \
       $(VISIONSOM_COMMON_DEVICE_PATH)/sepolicy


