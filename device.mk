#
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# call the proprietary setup
$(call inherit-product-if-exists, vendor/xiaomi/helium/helium-vendor.mk)

# Device Properties
#-include $(LOCAL_PATH)/prop.mk

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_platform_info_extcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_extcodec.xml \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_wcd9326.xml

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_SYSTEM)/usr/idc/uinput-fpc.idc

# Display
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/calib.cfg:$(TARGET_COPY_OUT_SYSTEM)/etc/calib.cfg

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/atmel-maxtouch.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/atmel-maxtouch.kl \
    $(LOCAL_PATH)/keylayout/ft5x06_ts.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/ft5x06_ts.kl \
    $(LOCAL_PATH)/keylayout/ft5x46.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/ft5x46.kl \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/uinput-fpc.kl \
    $(LOCAL_PATH)/keylayout/msm8976-tashalite-snd-card_Button_Jack.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/msm8976-tashalite-snd-card_Button_Jack.kl

# Ramdisk
PRODUCT_PACKAGES += \
    init.helium.rc \
    init.qcom.post_boot.sh \
    init.qcom.rc

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.1-service

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv_b3gbl.bin:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv_b3gbl.bin

# Inherit from msm8956-common
$(call inherit-product, device/xiaomi/msm8956-common/msm8956.mk)
