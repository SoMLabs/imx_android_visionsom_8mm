# uboot.imx in android combine scfw.bin and uboot.bin
MAKE += SHELL=/bin/bash

ifneq ($(AARCH64_GCC_CROSS_COMPILE),)
ATF_CROSS_COMPILE := $(strip $(AARCH64_GCC_CROSS_COMPILE))
else
ATF_TOOLCHAIN_ABS := $(realpath prebuilts/gcc/$(HOST_PREBUILT_TAG)/aarch64/aarch64-linux-android-4.9/bin)
ATF_CROSS_COMPILE := $(ATF_TOOLCHAIN_ABS)/aarch64-linux-androidkernel-
endif

define build_imx_uboot
	$(hide) echo Building i.MX U-Boot with firmware; \
	cp $(UBOOT_OUT)/u-boot-nodtb.$(strip $(1)) $(IMX_MKIMAGE_PATH)/imx-mkimage/iMX8M/.; \
	cp $(UBOOT_OUT)/spl/u-boot-spl.bin  $(IMX_MKIMAGE_PATH)/imx-mkimage/iMX8M/.; \
	cp $(UBOOT_OUT)/tools/mkimage  $(IMX_MKIMAGE_PATH)/imx-mkimage/iMX8M/mkimage_uboot; \
	cp $(UBOOT_OUT)/arch/arm/dts/imx8mm-visionsom.dtb  $(IMX_MKIMAGE_PATH)/imx-mkimage/iMX8M/.; \
	cp $(FSL_PROPRIETARY_PATH)/linux-firmware-imx/firmware/ddr/synopsys/lpddr4_pmu_train* $(IMX_MKIMAGE_PATH)/imx-mkimage/iMX8M/.; \
	$(MAKE) -C vendor/somlabs/arm-trusted-firmware/ PLAT=`echo $(2) | cut -d '-' -f1` clean; \
	if [ -f $(IMX_MKIMAGE_PATH)/imx-mkimage/iMX8M/tee.bin ] ; then \
		rm -rf $(IMX_MKIMAGE_PATH)/imx-mkimage/iMX8M/tee.bin; \
	fi; \
	$(MAKE) -C vendor/somlabs/arm-trusted-firmware/ CROSS_COMPILE="$(ATF_CROSS_COMPILE)" PLAT=`echo $(2) | cut -d '-' -f1` bl31 -B 1>/dev/null || exit 1; \
	cp vendor/somlabs/arm-trusted-firmware/build/`echo $(2) | cut -d '-' -f1`/release/bl31.bin $(IMX_MKIMAGE_PATH)/imx-mkimage/iMX8M/bl31.bin; \
	$(MAKE) -C $(IMX_MKIMAGE_PATH)/imx-mkimage/ clean; \
	$(MAKE) -C $(IMX_MKIMAGE_PATH)/imx-mkimage/ SOC=iMX8MM flash_spl_uboot || exit 1; \
	$(MAKE) -C $(IMX_MKIMAGE_PATH)/imx-mkimage/ SOC=iMX8MM print_fit_hab || exit 1; \
	cp $(IMX_MKIMAGE_PATH)/imx-mkimage/iMX8M/flash.bin $(UBOOT_COLLECTION)/u-boot-$(strip $(2)).imx; 
endef


