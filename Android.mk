#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifneq ($(filter kaito kaito_wifi, $(TARGET_DEVICE)),)
include $(call all-subdir-makefiles,$(LOCAL_PATH))
endif