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


PRODUCT_COPY_FILES := \
    device/xolo/us9230e1/fstab.us9230e1:root/fstab.us9230e1 \
    device/xolo/us9230e1/init.us9230e1.rc:root/init.us9230e1.rc

# the actual meat of the device-specific product definition
$(call inherit-product, device/xolo/us9230e1/device_us9230e1.mk)

# inherit from the non-open-source side, if present
$(call inherit-product-if-exists, vendor/xolo/us9230e1/device-vendor.mk)

DEVICE_PACKAGE_OVERLAYS := \
    device/xolo/us9230e1/overlay
