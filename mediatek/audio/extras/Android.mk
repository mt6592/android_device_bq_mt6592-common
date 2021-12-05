LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libaudioextras
LOCAL_SRC_FILES := \
    audio_extras.cpp \
    matv_interface.cpp

LOCAL_C_INCLUDES += \
    frameworks/av/media/mtp/ \
    frameworks/rs/server/ \
    frameworks/av/include/ \
    hardware/libhardware/include/

LOCAL_SHARED_LIBRARIES := \
    libcutils \
    liblog \
    libutils \
    libbinder

include $(BUILD_SHARED_LIBRARY)
