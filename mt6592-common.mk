#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Include all the languages
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# HW
ADDITIONAL_DEFAULT_PROPERTIES += ro.mtk.hardware=mt6592

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Screen
TARGET_SCREEN_WIDTH := 1200
TARGET_SCREEN_HEIGHT := 1920

# Common Path
COMMON_PATH := device/bq/mt6592-common

# Init
PRODUCT_PACKAGES += \
    fstab.mt6592 \
    init.mt6592.rc \
    init.mt6592.usb.rc \
    ueventd.mt6592.rc \
    init.recovery.mt6592.rc

# Override GMS Client ID
PRODUCT_GMS_CLIENTID_BASE := android-bq

# Call the proprietary vendor makefile
$(call inherit-product-if-exists, vendor/bq/mt6592-common/mt6592-common-vendor.mk)

# HWUI
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)
