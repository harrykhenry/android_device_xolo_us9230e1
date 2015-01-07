
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)


ifeq ($(TARGET_PREBUILT_KERNEL),)
  LOCAL_KERNEL := device/xolo/us9230e1/kernel
else
  LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

DEVICE_PACKAGE_OVERLAYS += device/xolo/us9230e1/overlay

PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    tf.enable=y \
    drm.service.enabled=true

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp


# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml

# ALSA Config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/center_lfe.conf:system/usr/share/alsa/pcm/center_lfe.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/default.conf:system/usr/share/alsa/pcm/default.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/dmix.conf:system/usr/share/alsa/pcm/dmix.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/dpl.conf:system/usr/share/alsa/pcm/dpl.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/dsnoop.conf:system/usr/share/alsa/pcm/dsnoop.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/front.conf:system/usr/share/alsa/pcm/front.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/iec958.conf:system/usr/share/alsa/pcm/iec958.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/modem.conf:system/usr/share/alsa/pcm/modem.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/rear.conf:system/usr/share/alsa/pcm/rear.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/side.conf:system/usr/share/alsa/pcm/side.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/surround40.conf:system/usr/share/alsa/pcm/surround40.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/surround41.conf:system/usr/share/alsa/pcm/surround41.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/surround50.conf:system/usr/share/alsa/pcm/surround50.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/surround51.conf:system/usr/share/alsa/pcm/surround51.conf \
    $(LOCAL_PATH)/prebuilt/alsa/pcm/surround71.conf:system/usr/share/alsa/pcm/surround71.conf \
    $(LOCAL_PATH)/prebuilt/alsa/cards/aliases.conf:system/usr/share/alsa/cards/aliases.conf \
    $(LOCAL_PATH)/prebuilt/alsa/alsa.conf:system/usr/share/alsa/alsa.conf

# Prebuilt Audio configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/asound.conf:system/etc/asound.conf \
    $(LOCAL_PATH)/configs/audio_effects.conf:system/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_COPY_FILES := \
    device/xolo/us9230e1/recovery/init.recovery.us9230e1.rc:recovery/root/init.recovery.us9230e1.rc \
    device/xolo/us9230e1/fstab.us9230e1:root/fstab.us9230e1 \
    device/xolo/us9230e1/init.us9230e1.rc:root/init.us9230e1.rc \
    device/xolo/us9230e1/init.cal.rc:root/init.cal.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nvcamera.conf:system/etc/nvcamera.conf \
    $(LOCAL_PATH)/configs/enctune.conf:system/etc/enctune.conf \
    system/bluetooth/data/main.conf:system/etc/bluetooth/main.conf \
    system/bluetooth/data/input.conf:system/etc/bluetooth/input.conf \
    system/bluetooth/data/audio.conf:system/etc/bluetooth/audio.conf \
    system/bluetooth/data/network.conf:system/etc/bluetooth/network.conf

# misc
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/model_frontal.xml:system/etc/model_frontal.xml \
    $(LOCAL_PATH)/configs/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/configs/vold_sdcard.fstab:system/etc/vold_sdcard.fstab

PRODUCT_COPY_FILES += \
    device/xolo/us9230e1/ueventd.us9230e1.rc:root/ueventd.us9230e1.rc \
    device/xolo/us9230e1/init.us9230e1.usb.rc:root/init.us9230e1.usb.rc \
    device/xolo/us9230e1/gps.conf:system/etc/gps.conf

ifneq ($(TARGET_PREBUILT_WIFI_MODULE),)
PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_WIFI_MODULE):system/lib/modules/wl12xx_sdio.ko
endif

PRODUCT_COPY_FILES += \
device/xolo/us9230e1/tegra-kbc.kl:system/usr/keylayout/tegra-kbc.kl \
device/xolo/us9230e1/raydium_ts.idc:system/usr/idc/raydium_ts.idc 

# Charger mode
PRODUCT_PACKAGES += \
charger \
charger_res_images


PRODUCT_PACKAGES += \
    hostapd_cli

# BlueZ test tools & Shared Transport user space mgr
PRODUCT_PACKAGES += \
hciconfig \
hcitool

PRODUCT_PACKAGES += \
audio.a2dp.default \
audio.r_submix.default \
bttest \
charger \
charger_res_images \
com.android.future.usb.accessory \
l2ping \
libaudioutils \
libbt-vendor \
libdbus \
librs_jni \
libstagefrighthw \
libtinyalsa \
libaudioutils \
xaplay \
setup_fs 

PRODUCT_PACKAGES := \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf \
    iw

PRODUCT_PACKAGES += \
    lights.us9230e1 \
    audio.primary.us9230e1 \
    power.us9230e1 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    librs_jni \
    l2ping \
    hcitool \
    bttest \
    com.android.future.usb.accessory \
    libhealth.us9230e1 \
    libtinyalsa \
    libstagefrighthw

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck \
    setup_fs

# audio packages
PRODUCT_PACKAGES += \
tinymix \
tinyplay \
tinycap


# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Other apps
PRODUCT_PACKAGES += \
    Torch \
    com.android.future.usb.accessory

PRODUCT_PACKAGES += \
    hostapd_cli \
    calibrator

# rild
PRODUCT_PACKAGES := \
    rild \
    BasicSmsReceiver

# Video
PRODUCT_PACKAGES += \
    libstagefrighthw

# iw
PRODUCT_PACKAGES += \
    iw

# rild
PRODUCT_PACKAGES := \
    rild \
    BasicSmsReceiver

# Configs
PRODUCT_COPY_FILES += \
    device/xolo/us9230e1/configs/egl.cfg:system/lib/egl/egl.cfg


# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise


# don't preload OpenGL in Zygote, the Tegra drivers do not like it
PRODUCT_PROPERTY_OVERRIDES += \
    ro.zygote.disable_gl_preload=true

PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

DEVICE_PACKAGE_OVERLAYS := \
    device/xolo/us9230e1/overlay
    
$(call inherit-product, build/target/product/full.mk)
$(call inherit-product, hardware/ti/wlan/mac80211/wl128x-wlan-products.mk)

