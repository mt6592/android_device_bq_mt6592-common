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

# Media
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(COMMON_PATH)/configs/media/player.cfg:system/etc/player.cfg

# Audio
PRODUCT_PACKAGES += \
    audio.primary.mt6592

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/audio/audio_effects.conf:system/etc/audio_effects.conf \
    $(COMMON_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf

# Bluetooth
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/bluetooth/auto_pair_blacklist.conf:system/etc/bluetooth/auto_pair_blacklist.conf \
    $(COMMON_PATH)/configs/bluetooth/auto_pair_devlist.conf:system/etc/bluetooth/auto_pair_devlist.conf \
    $(COMMON_PATH)/configs/bluetooth/btconfig.xml:system/etc/bluetooth/btconfig.xml \
    $(COMMON_PATH)/configs/bluetooth/bt_did.conf:system/etc/bluetooth/bt_did.conf \
    $(COMMON_PATH)/configs/bluetooth/bt_stack.conf:system/etc/bluetooth/bt_stack.conf

# RIL
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/ril/apns-conf.xml:system/etc/apns-conf.xml \
    $(COMMON_PATH)/configs/ril/spn-conf.xml:system/etc/spn-conf.xml \
    $(COMMON_PATH)/configs/ril/virtual-spn-conf-by-efgid1.xml:system/etc/virtual-spn-conf-by-efgid1.xml \
    $(COMMON_PATH)/configs/ril/virtual-spn-conf-by-efspn.xml:system/etc/virtual-spn-conf-by-efspn.xml \
    $(COMMON_PATH)/configs/ril/virtual-spn-conf-by-efpnn.xml:system/etc/virtual-spn-conf-by-efpnn.xml \
    $(COMMON_PATH)/configs/ril/virtual-spn-conf-by-imsi.xml:system/etc/virtual-spn-conf-by-imsi.xml    

# Wi-Fi
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(COMMON_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(COMMON_PATH)/configs/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# GPS
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/gps/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml

# Override GMS Client ID
PRODUCT_GMS_CLIENTID_BASE := android-bq

# Call the proprietary vendor makefile
$(call inherit-product-if-exists, vendor/bq/mt6592-common/mt6592-common-vendor.mk)

# HWUI
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)
