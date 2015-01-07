
# Release name
PRODUCT_RELEASE_NAME := us9230e1
# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)
# Bootanimation flags
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720
# Inherit device configuration
$(call inherit-product, device/xolo/us9230e1/device_us9230e1.mk)
## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := us9230e1
PRODUCT_NAME := cm_us9230e1
PRODUCT_BRAND := xolo
PRODUCT_MODEL := t1000
PRODUCT_MANUFACTURER := xolo
