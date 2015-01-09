#
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
DEVICE_PACKAGE_OVERLAYS += device/xolo/us9230e1/overlay

# Set default USB interface
PRODUCT_PROPERTY_OVERRIDES += \
persist.sys.usb.config=mass_storage,adb

# Don't store dalvik on /cache, it gets annoying when /cache is wiped
# by us to enable booting into recovery after flashing boot.img
PRODUCT_PROPERTY_OVERRIDES += \
dalvik.vm.dexopt-data-only=1

# Increase UMS speed
PRODUCT_PROPERTY_OVERRIDES += \
ro.vold.umsdirtyratio=50

# Override phone-xhdpi-1024-dalvik-heap.mk setting
PRODUCT_PROPERTY_OVERRIDES += \
dalvik.vm.heapgrowthlimit=96m

# Smoother window manager experience.
PRODUCT_PROPERTY_OVERRIDES += \
windowsmgr.max_events_per_sec = 240 #300

# force gpu rendering(2d drawing) [Nvidia setting - libhtc-opt2.so]
PRODUCT_PROPERTY_OVERRIDES += \
persist.sys.ui.hw=true

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise


# Other extra packages
PRODUCT_PACKAGES += \
librs_jni
# Bluetooth tools
$(call inherit-product, hardware/ti/wpan/ti-wpan-products.mk)
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/bin/load-bt.sh:system/bin/load-bt.sh
PRODUCT_PACKAGES += \
l2ping \
hciconfig \
hcitool 

# audio packages
PRODUCT_PACKAGES += \
tinymix \
tinyplay \
tinycap

# Wi-Fi
$(call inherit-product, hardware/ti/wlan/mac80211/wl128x-wlan-products.mk)
PRODUCT_COPY_FILES +=
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
$(LOCAL_PATH)/configs/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf
PRODUCT_PACKAGES += \
dhcpcd.conf \
hostapd.conf \
wifical.sh \
calibrator \
crda \
regulatory.bin \
wlconf
PRODUCT_PROPERTY_OVERRIDES += \
wifi.interface=wlan0 


PRODUCT_COPY_FILES := \
    device/xolo/us9230e1/fstab.us9230e1:root/fstab.us9230e1 \
    device/xolo/us9230e1/init.us9230e1.rc:root/init.us9230e1.rc

# the actual meat of the device-specific product definition
$(call inherit-product, device/xolo/us9230e1/device_us9230e1.mk)

# inherit from the non-open-source side, if present
$(call inherit-product-if-exists, vendor/xolo/us9230e1/device-vendor.mk)
