ifneq ($(IMX8_BUILD_32BIT_ROOTFS),true)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
endif
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic.mk)
ifeq ($(PRODUCT_IMX_CAR),true)
$(call inherit-product, packages/services/Car/car_product/build/car.mk)
endif
$(call inherit-product, $(TOPDIR)frameworks/base/data/sounds/AllAudio.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
# overrides
PRODUCT_BRAND := Android
PRODUCT_MANUFACTURER := freescale

# Android infrastructures
PRODUCT_PACKAGES += \
    CactusPlayer \
    ExtractorPkg \
    SystemUpdaterSample \
    charger_res_images \
    ethernet \
    libedid \
    libion \
    slideshow \
    verity_warning_images

ifneq ($(PRODUCT_IMX_CAR),true)
PRODUCT_PACKAGES += \
    Camera \
    CubeLiveWallpapers \
    Email \
    Gallery2 \
    LegacyCamera \
    LiveWallpapersPicker \
    SoundRecorder
endif

# HAL
PRODUCT_PACKAGES += \
    copybit.imx \
    gralloc.imx \
    hwcomposer.imx \
    lights.imx \
    overlay.imx \
    power.imx

# A/B OTA
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl.imx \
    android.hardware.boot@1.0-impl.imx.recovery \
    android.hardware.boot@1.0-service.imx \
    bootctrl.avb \
    update_engine \
    update_engine_client \
    update_engine_sideload \
    update_verifier

PRODUCT_HOST_PACKAGES += \
    brillo_update_payload

# audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.imx \
    audio.r_submix.default \
    audio.usb.default \
    tinycap \
    tinymix \
    tinyplay \
    tinypcminfo

# LDAC codec
PRODUCT_PACKAGES += \
    libldacBT_enc \
    libldacBT_abr

# wifi
PRODUCT_PACKAGES += \
    hostapd \
    hostapd_cli \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# sensor
PRODUCT_PACKAGES += \
    fsl_sensor_fusion \
    libbt-vendor \
    libbt-vendor-broadcom

# memtrack
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    memtrack.imx

# camera
ifneq ($(PRODUCT_IMX_CAR),true)
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service \
    camera.device@1.0-impl \
    camera.device@3.2-impl \
    camera.imx
endif

PRODUCT_PACKAGES += \
    android.hardware.health@2.0-service.imx

# display
PRODUCT_PACKAGES += \
    libdrm_android \
    libfsldisplay \
    nxp.hardware.display@1.0

# drm
PRODUCT_PACKAGES += \
    libdrmpassthruplugin \
    libfwdlockengine

# vivante libdrm support
PRODUCT_PACKAGES += \
    libdrm_vivante

# gpu debug tool
PRODUCT_PACKAGES += \
    gmem_info \
    gpu-top

# Omx related libs, please align to device/fsl/proprietary/omx/fsl-omx.mk
PRODUCT_PACKAGES += \
    lib_aac_dec_v2_arm12_elinux \
    lib_aacd_wrap_arm12_elinux_android \
    lib_flac_dec_v2_arm11_elinux \
    lib_mp3_dec_v2_arm12_elinux \
    lib_mp3d_wrap_arm12_elinux_android \
    lib_nb_amr_dec_v2_arm9_elinux \
    lib_nb_amr_enc_v2_arm11_elinux \
    lib_wb_amr_dec_arm9_elinux \
    lib_wb_amr_enc_arm11_elinux \
    media_codecs_c2_ac3.xml \
    media_codecs_c2_ddp.xml \
    media_codecs_c2_ms.xml \
    media_codecs_c2_wmv9.xml \
    media_codecs_c2_ra.xml \
    media_codecs_c2_rv.xml \
    media_codecs_performance.xml \
    media_profiles_V1_0.xml \
    media_codecs_google_c2_video.xml \
    media_codecs_c2.xml \
    media_codecs_performance_c2.xml

ifneq ($(LOW_MEMORY),true)
PRODUCT_PACKAGES += \
    media_codecs.xml
endif

#parser
PRODUCT_PACKAGES += \
    libimxextractor \
    lib_aac_parser_arm11_elinux.3.0 \
    lib_amr_parser_arm11_elinux.3.0 \
    lib_avi_parser_arm11_elinux.3.0 \
    lib_dsf_parser_arm11_elinux.3.0 \
    lib_flac_parser_arm11_elinux.3.0 \
    lib_flv_parser_arm11_elinux.3.0 \
    lib_mkv_parser_arm11_elinux.3.0 \
    lib_mp3_parser_arm11_elinux.3.0 \
    lib_mp4_parser_arm11_elinux.3.0 \
    lib_mpg2_parser_arm11_elinux.3.0 \
    lib_ogg_parser_arm11_elinux.3.0 \


# Omx excluded libs
PRODUCT_PACKAGES += \
    lib_aacplus_dec_v2_arm11_elinux \
    lib_aacplusd_wrap_arm12_elinux_android \
    lib_ac3_dec_v2_arm11_elinux \
    lib_ac3d_wrap_arm11_elinux_android \
    lib_asf_parser_arm11_elinux.3.0 \
    lib_ddpd_wrap_arm12_elinux_android \
    lib_ddplus_dec_v2_arm12_elinux \
    lib_omx_ac3_dec_v2_arm11_elinux \
    lib_omx_ra_dec_v2_arm11_elinux \
    lib_omx_wma_dec_v2_arm11_elinux \
    lib_omx_wmv_dec_v2_arm11_elinux \
    lib_realad_wrap_arm11_elinux_android \
    lib_realaudio_dec_v2_arm11_elinux \
    lib_rm_parser_arm11_elinux.3.0 \
    lib_wma10_dec_v2_arm12_elinux \
    lib_wma10d_wrap_arm12_elinux_android

# imx c2 codec binary
PRODUCT_PACKAGES += \
    android.hardware.media.c2@1.0-service \
    libsfplugin_ccodec \
    lib_imx_c2_componentbase \
    lib_imx_ts_manager \
    lib_c2_imx_store \
    lib_c2_imx_audio_dec_common \
    lib_c2_imx_aac_dec \
    lib_c2_imx_ac3_dec \
    lib_c2_imx_eac3_dec \
    lib_c2_imx_mp3_dec \
    lib_c2_imx_ra_dec \
    lib_c2_imx_wma_dec \

# Support Dynamic partition userspace fastboot
PRODUCT_PACKAGES += \
    fastbootd \

# Copy soc related config and binary to board
PRODUCT_COPY_FILES += \
    $(FSL_PROPRIETARY_PATH)/fsl-proprietary/media-profile/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_audio.xml \
    $(FSL_PROPRIETARY_PATH)/fsl-proprietary/media-profile/media_codecs_google_c2_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_telephony.xml \
    $(FSL_PROPRIETARY_PATH)/fsl-proprietary/media-profile/media_codecs_google_c2_tv.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_c2_tv.xml \
    $(FSL_PROPRIETARY_PATH)/fsl-proprietary/media-profile/media_profiles_720p.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_720p.xml \
    device/fsl/common/input/Dell_Dell_USB_Entry_Keyboard.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/Dell_Dell_USB_Entry_Keyboard.idc \
    device/fsl/common/input/Dell_Dell_USB_Keyboard.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/Dell_Dell_USB_Keyboard.idc \
    device/fsl/common/input/Dell_Dell_USB_Keyboard.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Dell_Dell_USB_Keyboard.kl \
    device/fsl/common/input/eGalax_Touch_Screen.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/HannStar_P1003_Touchscreen.idc \
    device/fsl/common/input/eGalax_Touch_Screen.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/Novatek_NT11003_Touch_Screen.idc \
    device/fsl/common/input/eGalax_Touch_Screen.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/eGalax_Touch_Screen.idc \
    $(VISIONSOM_COMMON_DEVICE_PATH)/com.example.android.systemupdatersample.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/com.example.android.systemupdatersample.xml \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \

PRODUCT_PROPERTY_OVERRIDES += \
    pm.dexopt.boot=quicken

# wifionly device
PRODUCT_PROPERTY_OVERRIDES += \
    ro.radio.noril=yes

PRODUCT_PROPERTY_OVERRIDES += \
    ro.mediacomponents.package=com.nxp.extractorpkg

# Freescale multimedia parser related prop setting
# Define fsl avi/aac/asf/mkv/flv/flac format support
PRODUCT_PROPERTY_OVERRIDES += \
    ro.FSL_AVI_PARSER=1 \
    ro.FSL_AAC_PARSER=1 \
    ro.FSL_FLV_PARSER=1 \
    ro.FSL_MKV_PARSER=1 \
    ro.FSL_FLAC_PARSER=1 \
    ro.FSL_MPG2_PARSER=1

# Set c2 codec in default
PRODUCT_PROPERTY_OVERRIDES += \
    debug.stagefright.ccodec=4  \
    debug.stagefright.omx_default_rank=0x200 \
    debug.stagefright.c2-poolmask=0x70000

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_DEFAULT_DEV_CERTIFICATE := \
    device/fsl/common/security/testkey

# In userdebug, add minidebug info the the boot image and the system server to support
# diagnosing native crashes.
ifneq (,$(filter userdebug, $(TARGET_BUILD_VARIANT)))
    # Boot image.
    PRODUCT_DEX_PREOPT_BOOT_FLAGS += --generate-mini-debug-info
    # System server and some of its services.
    # Note: we cannot use PRODUCT_SYSTEM_SERVER_JARS, as it has not been expanded at this point.
    $(call add-product-dex-preopt-module-config,services,--generate-mini-debug-info)
    $(call add-product-dex-preopt-module-config,wifi-service,--generate-mini-debug-info)
endif

PRODUCT_AAPT_CONFIG := normal mdpi

# Enforce privapp-permissions whitelist
PRODUCT_PROPERTY_OVERRIDES += \
    ro.control_privapp_permissions=enforce

# include a google recommand heap config file.
include frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk

-include $(FSL_RESTRICTED_CODEC_PATH)/fsl-restricted-codec/fsl_real_dec/fsl_real_dec.mk
-include $(FSL_RESTRICTED_CODEC_PATH)/fsl-restricted-codec/fsl_ms_codec/fsl_ms_codec.mk

PREBUILT_FSL_IMX_CODEC := true

PRODUCT_FULL_TREBLE_OVERRIDE := true

#Enable this to choose 32 bit user space build
#IMX8_BUILD_32BIT_ROOTFS := true

#Enable this to use dynamic partitions for the readonly partitions not touched by bootloader
TARGET_USE_DYNAMIC_PARTITIONS ?= true
#If the device is retrofit to have dynamic partition feature, set this variable to true to build
#the images and OTA package. Here is a demo to update 10.0.0_1.0.0 to 10.0.0_2.0.0 or higher
TARGET_USE_RETROFIT_DYNAMIC_PARTITION ?= false

ifeq ($(TARGET_USE_DYNAMIC_PARTITIONS),true)
  PRODUCT_USE_DYNAMIC_PARTITIONS := true
  BOARD_BUILD_SUPER_IMAGE_BY_DEFAULT := true
  BOARD_SUPER_IMAGE_IN_UPDATE_PACKAGE := true
  ifeq ($(TARGET_USE_RETROFIT_DYNAMIC_PARTITION),true)
    PRODUCT_RETROFIT_DYNAMIC_PARTITIONS := true
    BOARD_SUPER_PARTITION_METADATA_DEVICE := system
    ifeq ($(IMX_NO_PRODUCT_PARTITION),true)
      BOARD_SUPER_PARTITION_BLOCK_DEVICES := system vendor
      BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 2952790016
      BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE := 536870912
    else
      BOARD_SUPER_PARTITION_BLOCK_DEVICES := system vendor product
      BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 1610612736
      BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE := 536870912
      BOARD_SUPER_PARTITION_PRODUCT_DEVICE_SIZE := 1879048192
    endif
  endif
endif

#BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
#BOARD_VENDORIMAGE_PARTITION_SIZE := 536870912
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
#BOARD_PRODUCTIMAGE_PARTITION_SIZE := 2147483648 

# Include keystore attestation keys and certificates.
ifeq ($(PRODUCT_IMX_TRUSTY),true)
-include $(IMX_SECURITY_PATH)/attestation/imx_attestation.mk
endif

# Include Android Go config for low memory device.
ifeq ($(LOW_MEMORY),true)
$(call inherit-product, build/target/product/go_defaults.mk)
endif

# Copy device related config and binary to board
PRODUCT_COPY_FILES += \
    $(FSL_PROPRIETARY_PATH)/fsl-proprietary/mcu-sdk/imx8mm/imx8mm_mcu_demo.img:imx8mm_mcu_demo.img \
    $(VISIONSOM_COMMON_DEVICE_PATH)/app_whitelist.xml:system/etc/sysconfig/app_whitelist.xml \
    $(VISIONSOM_COMMON_DEVICE_PATH)/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(VISIONSOM_COMMON_DEVICE_PATH)/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(VISIONSOM_COMMON_DEVICE_PATH)/usb_audio_policy_configuration-direct-output.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration-direct-output.xml \
    $(VISIONSOM_COMMON_DEVICE_PATH)/fstab.freescale:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.freescale \
    $(VISIONSOM_COMMON_DEVICE_PATH)/init.imx8mm.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.freescale.imx8mm.rc \
    $(VISIONSOM_COMMON_DEVICE_PATH)/early.init.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/early.init.cfg \
    $(VISIONSOM_COMMON_DEVICE_PATH)/init.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.freescale.rc \
    $(VISIONSOM_COMMON_DEVICE_PATH)/init.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.freescale.usb.rc \
    $(VISIONSOM_COMMON_DEVICE_PATH)/required_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/required_hardware.xml \
    $(VISIONSOM_COMMON_DEVICE_PATH)/ueventd.freescale.rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc \
    $(LINUX_FIRMWARE_IMX_PATH)/linux-firmware-imx/firmware/sdma/sdma-imx7d.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/imx/sdma/sdma-imx7d.bin \
    device/fsl/common/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    device/fsl/common/init/init.insmod.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.insmod.sh

ifeq ($(TARGET_USE_DYNAMIC_PARTITIONS),true)
PRODUCT_COPY_FILES += \
    $(FSL_PROPRIETARY_PATH)/fsl-proprietary/dynamic_partiton_tools/lpmake:lpmake \
    $(FSL_PROPRIETARY_PATH)/fsl-proprietary/dynamic_partiton_tools/lpmake.exe:lpmake.exe
endif

#LPDDR4 board, NXP wifi supplicant overlay
PRODUCT_COPY_FILES += \
    device/fsl/common/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

ifeq ($(PRODUCT_IMX_TRUSTY),true)
PRODUCT_COPY_FILES += \
    device/fsl/common/security/rpmb_key_test.bin:rpmb_key_test.bin \
    device/fsl/common/security/testkey_public_rsa4096.bin:testkey_public_rsa4096.bin
endif

PRODUCT_COPY_FILES += \
    $(VISIONSOM_COMMON_DEVICE_PATH)/camera_config_imx8mm.json:$(TARGET_COPY_OUT_VENDOR)/etc/configs/camera_config_imx8mm.json

# ONLY devices that meet the CDD's requirements may declare these features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.output.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.output.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.screen.landscape.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.screen.landscape.xml \
    frameworks/native/data/etc/android.hardware.screen.portrait.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.screen.portrait.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.software.app_widgets.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.app_widgets.xml \
    frameworks/native/data/etc/android.software.backup.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.backup.xml \
    frameworks/native/data/etc/android.software.device_admin.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_admin.xml \
    frameworks/native/data/etc/android.software.managed_users.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.managed_users.xml \
    frameworks/native/data/etc/android.software.print.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.print.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml \
    frameworks/native/data/etc/android.software.voice_recognizers.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.voice_recognizers.xml \
    frameworks/native/data/etc/android.software.activities_on_secondary_displays.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.activities_on_secondary_displays.xml \
    frameworks/native/data/etc/android.software.picture_in_picture.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.picture_in_picture.xml

# Vendor seccomp policy files for media components:
PRODUCT_COPY_FILES += \
    $(VISIONSOM_COMMON_DEVICE_PATH)/seccomp/mediacodec-seccomp.policy:vendor/etc/seccomp_policy/mediacodec.policy \
    $(VISIONSOM_COMMON_DEVICE_PATH)/seccomp/mediaextractor-seccomp.policy:vendor/etc/seccomp_policy/mediaextractor.policy

PRODUCT_COPY_FILES += \
    $(VISIONSOM_COMMON_DEVICE_PATH)/powerhint_imx8mm.json:$(TARGET_COPY_OUT_VENDOR)/etc/configs/powerhint_imx8mm.json

# fastboot_imx_flashall scripts, fsl-sdcard-partition script uuu_imx_android_flash scripts
PRODUCT_COPY_FILES += \
    device/fsl/common/tools/fastboot_imx_flashall.bat:fastboot_imx_flashall.bat \
    device/fsl/common/tools/fastboot_imx_flashall.sh:fastboot_imx_flashall.sh \
    device/fsl/common/tools/fsl-sdcard-partition.sh:fsl-sdcard-partition.sh \
    device/fsl/common/tools/uuu_imx_android_flash.bat:uuu_imx_android_flash.bat \
    device/fsl/common/tools/uuu_imx_android_flash.sh:uuu_imx_android_flash.sh

# Copy media_codecs.xml for 1GB visionsom_8mm board
ifeq ($(LOW_MEMORY),true)
PRODUCT_COPY_FILES += \
    $(FSL_PROPRIETARY_PATH)/fsl-proprietary/media-profile/imx8mm/media_codecs_no_vpu.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml
endif

USE_XML_AUDIO_POLICY_CONF := 1

DEVICE_PACKAGE_OVERLAYS := $(VISIONSOM_COMMON_DEVICE_PATH)/overlay

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_AAPT_CONFIG += xlarge large tvdpi hdpi xhdpi xxhdpi

# HWC2 HAL
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.3-service

# Gralloc HAL
PRODUCT_PACKAGES += \
    android.hardware.graphics.mapper@2.0-impl-2.1 \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service

# RenderScript HAL
PRODUCT_PACKAGES += \
    android.hardware.renderscript@1.0-impl

PRODUCT_PACKAGES += \
    libEGL_VIVANTE \
    libGLESv1_CM_VIVANTE \
    libGLESv2_VIVANTE \
    gralloc_viv.imx \
    libGAL \
    libGLSLC \
    libVSC \
    libg2d-viv \
    libgpuhelper \
    gatekeeper.imx

PRODUCT_PACKAGES += \
    android.hardware.audio@5.0-impl:32 \
    android.hardware.audio@2.0-service \
    android.hardware.audio.effect@5.0-impl:32 \
    android.hardware.power@1.3-service.imx \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service \
    android.hardware.configstore@1.1-service \
    configstore@1.1.policy

# Thermal HAL
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.imx
PRODUCT_COPY_FILES += \
    $(VISIONSOM_COMMON_DEVICE_PATH)/thermal_info_config_imx8mm.json:$(TARGET_COPY_OUT_VENDOR)/etc/configs/thermal_info_config_imx8mm.json

# Usb HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.1-service.imx

# Bluetooth HAL
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service

# WiFi HAL
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    wifilogd \
    wificond

# Copy wifi firmware to board
PRODUCT_COPY_FILES += \
    vendor/nxp/imx-firmware/cyw-wifi-bt/1DX_CYW43430/brcmfmac43430-sdio.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/brcm/brcmfmac43430-sdio.bin \
    vendor/nxp/imx-firmware/cyw-wifi-bt/1DX_CYW43430/brcmfmac43430-sdio.txt:$(TARGET_COPY_OUT_VENDOR)/firmware/brcm/brcmfmac43430-sdio.txt \
    vendor/nxp/imx-firmware/cyw-wifi-bt/1DX_CYW43430/brcmfmac43430-sdio.clm_blob:$(TARGET_COPY_OUT_VENDOR)/firmware/brcm/brcmfmac43430-sdio.clm_blob

# BCM 1CX Bluetooth Firmware
PRODUCT_COPY_FILES += \
    vendor/nxp/imx-firmware/cyw-wifi-bt/1DX_CYW43430/BCM43430A1.1DX.hcd:$(TARGET_COPY_OUT_VENDOR)/firmware/brcm/BCM43430A1.hcd \
    hardware/broadcom/libbt/conf/fsl/visionsom_8mm/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Set Bluetooth transport initialization timeout
PRODUCT_PROPERTY_OVERRIDES += \
    bluetooth.enable_timeout_ms=10000

PRODUCT_PACKAGES += \
    bt_vendor.conf

# Wifi regulatory
PRODUCT_COPY_FILES += \
    external/wireless-regdb/regulatory.db:vendor/firmware/regulatory.db \
    external/wireless-regdb/regulatory.db.p7s:vendor/firmware/regulatory.db.p7s

# Keymaster HAL
ifeq ($(PRODUCT_IMX_TRUSTY),true)
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-service.trusty
endif

PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service

# DRM HAL
TARGET_ENABLE_MEDIADRM_64 := true
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service

# new gatekeeper HAL
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service

ifneq ($(BUILD_TARGET_FS),ubifs)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/by-name/presistdata
endif

# ro.product.first_api_level indicates the first api level the device has commercially launched on.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.first_api_level=28

PRODUCT_PACKAGES += \
    libg1 \
    libhantro \
    libcodec \
    libhantro_h1 \
    libcodec_enc

# imx c2 codec binary
PRODUCT_PACKAGES += \
    lib_vpu_wrapper \
    lib_imx_c2_videodec \
    lib_imx_c2_vpuwrapper_dec \
    lib_imx_c2_videodec_common \
    lib_imx_c2_videoenc_common \
    lib_imx_c2_vpuwrapper_enc \
    lib_imx_c2_videoenc \
    lib_imx_c2_process \
    lib_imx_c2_process_dummy_post \
    lib_imx_c2_process_g2d_pre \
    c2_component_register \
    c2_component_register_ms \
    c2_component_register_ra

# Add oem unlocking option in settings.
PRODUCT_PROPERTY_OVERRIDES += ro.frp.pst=/dev/block/by-name/presistdata
PRODUCT_COMPATIBLE_PROPERTY_OVERRIDE := true

# Add Trusty OS backed gatekeeper and secure storage proxy
ifeq ($(PRODUCT_IMX_TRUSTY),true)
PRODUCT_PACKAGES += \
    gatekeeper.trusty \
    storageproxyd
endif

#DRM Widevine 1.2 L3 support
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service \
    android.hardware.drm@1.2-service.widevine \
    android.hardware.drm@1.2-service.clearkey \
    libwvdrmcryptoplugin \
    libwvhidl \
    libwvdrmengine \

#Dumpstate HAL 1.0 support
PRODUCT_PACKAGES += \
    android.hardware.dumpstate@1.0-service.imx

ifeq ($(PRODUCT_IMX_TRUSTY),true)
#Oemlock HAL 1.0 support
PRODUCT_PACKAGES += \
    android.hardware.oemlock@1.0-service.imx
endif

# Included GMS package
$(call inherit-product-if-exists, vendor/partner_gms/products/gms.mk)

# Specify rollback index for bootloader and for AVB
ifneq ($(AVB_RBINDEX),)
BOARD_AVB_ROLLBACK_INDEX := $(AVB_RBINDEX)
else
BOARD_AVB_ROLLBACK_INDEX := 0
endif

ifneq (,$(filter userdebug eng,$(TARGET_BUILD_VARIANT)))
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)
PRODUCT_PACKAGES += \
    adb_debug.prop
endif

IMX-DEFAULT-G2D-LIB := libg2d-viv

ifeq ($(PREBUILT_FSL_IMX_CODEC),true)
ifneq ($(IMX8_BUILD_32BIT_ROOTFS),true)
INSTALL_64BIT_LIBRARY := true
endif
-include $(FSL_CODEC_PATH)/fsl-codec/fsl-codec.mk
endif

# Demo application
PRODUCT_PACKAGES += \
    somlabsdemo
