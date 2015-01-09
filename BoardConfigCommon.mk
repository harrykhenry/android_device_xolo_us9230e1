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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

#copy stuff
-include vendor/xolo/us9230e1/us9230e1-vendor-blobs.mk


#Board
TARGET_BOARD_PLATFORM := tegra3
TARGET_NO_BOOTLOADER := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a9
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
# Board naming
TARGET_NO_RADIOIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME := us9230e1
TARGET_BOARD_PLATFORM := tegra3

# Optimization build flags
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp

# Some proprietary libs need reservedVectorImpl variants
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# fix this up by examining /proc/mtd on a running device
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2516582400
BOARD_FLASH_BLOCK_SIZE := 4096


# Kernel
#TARGET_KERNEL_SOURCE := kernel/xolo/us9230e1
#TARGET_KERNEL_CONFIG := xolo_defconfig
TARGET_PREBUILT_KERNEL := device/xolo/us9230e1/kernel
TARGET_USERIMAGES_USE_EXT4 := true

# Wifi related defines
USES_TI_MAC80211 := true
# Required for newer wpa_supplicant_8_ti versions to fix tethering
BOARD_WIFI_SKIP_CAPABILITIES := true

#WIFI
ifdef USES_TI_MAC80211
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION := VER_0_8_X_TI
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_WLAN_DEVICE := wl12xx_mac80211
BOARD_SOFTAP_DEVICE := wl12xx_mac80211
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wl12xx_sdio.ko"
WIFI_DRIVER_MODULE_NAME := "wl12xx_sdio"
WIFI_FIRMWARE_LOADER := ""
COMMON_GLOBAL_CFLAGS += -DUSES_TI_MAC80211
endif

#misc
BOARD_USES_GENERIC_INVENSENSE := false
TARGET_PROVIDES_LIBRIL := device/xolo/us9230e1/libril-icera.so

BOARD_HAL_STATIC_LIBRARIES := \
    libhealthd.us9230e1

#audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_TINY_AUDIO := true
BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true

#recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := device/xolo/us9230e1/fstab.us9230e1
TARGET_RECOVERY_INITRC := device/xolo/us9230e1/recovery/init.recovery.us9230e1.rc
RECOVERY_FSTAB_VERSION = 2
TARGET_USERIMAGES_USE_EXT4 := true

#TWRP
DEVICE_RESOLUTION := 720x1280
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_EXTERNAL_STORAGE_PATH := "/sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"

# Charging mode
BOARD_CHARGER_CUSTOM_BACKLIGHT_PATH := /sys/class/backlight/pwm-backlight/brightness

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

# EGL settings
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/xolo/us9230e1/configs/egl.cfg
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
BOARD_HAVE_PIXEL_FORMAT_INFO := true

# BT
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_TI := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/xolo/us9230e1/bluetooth
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := true

# Power HAL
TARGET_USES_CM_POWERHAL := true

# Enable CPU boosting events in the power HAL
TARGET_USES_CPU_BOOST_HINT := true

# NvCamera extensions
TARGET_SPECIFIC_HEADER_PATH := device/xolo/us9230e1/include


# SELINUX Defines
BOARD_SEPOLICY_DIRS := \
device/xolo/us9230e1/sepolicy

BOARD_SEPOLICY_UNION := \
file_contexts \
app.te \
device.te \
drmserver.te \
init_shell.te \
file.te \
rild.te \
shell.te \
surfaceflinger.te \
system.te \
zygote.te

BOARD_CHARGER_ENABLE_SUSPEND := true
