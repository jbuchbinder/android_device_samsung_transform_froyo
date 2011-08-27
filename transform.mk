# Inherit AOSP device configuration for passion.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

# density in DPI of the LCD of this board. This is used to scale the UI
# appropriately. If this property is not defined, the default value is 160 dpi. 
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.enable-http=false \
    ro.sf.lcd_density=120 \
    ro.opengles.version=131072

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml 

# media config xml file
PRODUCT_COPY_FILES += \
    device/samsung/transform/media_profiles.xml:system/etc/media_profiles.xml

#
# Copy transform specific prebuilt files
#

# Sensors
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/akmd/akmd:system/bin/akmd

# Audio
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/audio/asound.conf:system/etc/asound.conf

# Bluetooth
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/bt/BCM4329.hcd:system/bin/BCM4329.hcd

# GPS config
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/gps/gps.conf:system/etc/gps.conf

# Graphics
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/graphics/egl.cfg:system/lib/egl/egl.cfg \
    device/samsung/transform/prebuilt/graphics/libChunkAlloc.so:system/lib/libChunkAlloc.so \
    device/samsung/transform/prebuilt/graphics/libEGL_fimg.so:system/lib/egl/libEGL_fimg.so \
    device/samsung/transform/prebuilt/graphics/libGLESv1_CM_fimg.so:system/lib/egl/libGLESv1_CM_fimg.so \
    device/samsung/transform/prebuilt/graphics/libGLESv2_fimg.so:system/lib/egl/libGLESv2_fimg.so

# Gralloc + Copybit
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/hw/copybit.SPH-M920.so:system/lib/hw/copybit.SPH-M920.so \
    device/samsung/transform/prebuilt/hw/gralloc.SPH-M920.so:system/lib/hw/gralloc.SPH-M920.so

# Keys
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/keys/s3c-keypad-rev0050.kl:system/usr/keylayout/s3c-keypad-rev0050.kl \
    device/samsung/transform/prebuilt/keys/sec_headset.kl:system/usr/keylayout/sec_headset.kl \
    device/samsung/transform/prebuilt/keys/s3c-keypad-rev0050.kcm.bin:system/usr/keylayout/melfas_ts_input.kl \
    device/samsung/transform/prebuilt/keys/s3c-keypad-rev0050.kcm.bin:system/usr/keychars/s3c-keypad-rev0050.kcm.bin \
    device/samsung/transform/prebuilt/keys/s3c-keypad-rev0050.kcm.bin:system/usr/keychars/optjoy_device.kcm.bin \
    device/samsung/transform/prebuilt/keys/s3c-keypad-rev0050.kcm.bin:system/usr/keychars/melfas_ts_input.kcm.bin

# RIL
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/ril/libsec-ril40.so:system/lib/libsec-ril40.so \
    device/samsung/transform/prebuilt/ril/rilclient-test:system/bin/rilclient-test \
    device/samsung/transform/prebuilt/ril/rild:system/bin/rild

# Vold
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/vold/vold.fstab:system/etc/vold.fstab

# Wifi
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/wifi/bcm4329_aps.bin:system/etc/wifi/bcm4329_aps.bin \
    device/samsung/transform/prebuilt/wifi/bcm4329_mfg.bin:system/etc/wifi/bcm4329_mfg.bin \
    device/samsung/transform/prebuilt/wifi/bcm4329_sta.bin:system/etc/wifi/bcm4329_sta.bin \
    device/samsung/transform/prebuilt/wifi/dhd.ko:system/libmodules/dhd.ko \
    device/samsung/transform/prebuilt/wifi/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \
    device/samsung/transform/prebuilt/wifi/nvram_net.txt:system/etc/wifi/nvram_net.txt \
    device/samsung/transform/prebuilt/wifi/wifi.conf:system/etc/wifi/wifi.conf \
    device/samsung/transform/prebuilt/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# serviceModeApp
PRODUCT_COPY_FILES += \
    device/samsung/transform/prebuilt/servicemodeapp/serviceModeApp.apk:system/app/serviceModeApp.apk

# Used by BusyBox
KERNEL_MODULES_DIR:=/lib/modules

# Tiny toolbox
TINY_TOOLBOX:=true

# Enable Windows Media if supported by the board
WITH_WINDOWS_MEDIA:=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=true \
    dalvik.vm.dexopt-data-only=1 \
    dalvik.vm.heapsize=30m

# Default network type.
# 0 => WCDMA preferred.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=0

# mobile interfaces
PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=pdp0,eth0,gprs,ppp0

#scan interval
PRODUCT_PROPERTY_OVERRIDES += \
wifi.supplicant_scan_interval=180

# Repeat ring tone on incoming calls (CM/Blade)
PRODUCT_PROPERTY_OVERRIDES += \
ro.telephony.call_ring.multiple=false

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_transform
PRODUCT_DEVICE := transform
PRODUCT_BRAND := Android
PRODUCT_MODEL := Full Android on Transform
