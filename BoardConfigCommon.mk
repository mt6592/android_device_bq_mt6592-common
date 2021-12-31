#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Common Path
COMMON_PATH := device/bq/mt6592-common

# Arch
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a7

# Bootloader
TARGET_NO_BOOTLOADER := true

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

# Kernel
BOARD_KERNEL_IMAGE_NAME := zImage
BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_BASE := 0x10000000
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := $(COMMON_PATH)/mkbootimg.mk
BOARD_MKBOOTIMG_ARGS := \
    --base $(BOARD_KERNEL_BASE) \
    --pagesize $(BOARD_KERNEL_PAGESIZE) \
    --kernel_offset 0x00008000 \
    --ramdisk_offset 0x01000000 \
    --second_offset 0x00f00000 \
    --tags_offset 0x00000100 \
    --cmdline "$(BOARD_KERNEL_CMDLINE)"

# Global Flags
BOARD_GLOBAL_CFLAGS += -DMTK_HARDWARE
BOARD_GLOBAL_CPPFLAGS += -DMTK_HARDWARE

# MediaTek Flags
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 4096 # blockdev --getbsz /dev/block/mmcblk0
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1283457024
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1237319680
BOARD_CACHEIMAGE_PARTITION_SIZE := 1073741824

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(COMMON_PATH)/bluetooth

# Malloc
MALLOC_SVELTE := true

# Graphics
BOARD_EGL_CFG := $(COMMON_PATH)/configs/egl/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

# Wi-Fi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_P2P := P2P

# GPS
BOARD_CONNECTIVITY_MODULE := MediaTek
BOARD_CONNECTIVITY_VENDOR := conn_soc

# Recovery
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/rootdir/etc/fstab.mt6592

# System Properties
TARGET_SYSTEM_PROP += $(COMMON_PATH)/system.prop

# Platform
TARGET_BOARD_PLATFORM := mt8392

# OTA
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := $(COMMON_PATH)/releasetools/ota_from_target_files

# Shim Libraries
TARGET_LDPRELOAD += libaudioextras.so

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun%d/file"

# Charger
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/BOOT/BOOT/boot/boot_mode
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_HAL_STATIC_LIBRARIES := libhealthd.mtk

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_MULTITHREAD_DECODE := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_HALF_RES := true

# Headers
TARGET_SPECIFIC_HEADER_PATH := $(COMMON_PATH)/include

# Sepolicy
BOARD_SEPOLICY_DIRS := \
    $(COMMON_PATH)/sepolicy

BOARD_SEPOLICY_UNION := \
    device.te \
    app.te \
    system.te \
    netd.te \
    file_contexts
