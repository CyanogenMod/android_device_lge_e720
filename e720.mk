$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lge/e720/e720-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/e720/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/lge/e720/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Board-specific init
PRODUCT_COPY_FILES += \
      $(LOCAL_PATH)/init.alessi.rc:root/init.alessi.rc \
      $(LOCAL_PATH)/ueventd.alessi.rc:root/ueventd.alessi.rc
#      $(LOCAL_PATH)/prebuilt/initlogo.rle:root/initlogo.rle \

# BT startup
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/init.qcom.bt.sh:system/bin/init.qcom.bt.sh

# configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/AudioFilter.csv:system/etc/AudioFilter.csv \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    $(LOCAL_PATH)/configs/touch_mcs6000.kl:system/usr/keylayout/touch_mcs6000.kl

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nvram.txt:system/etc/wl/nvram.txt \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/prebuilt/wireless.ko:system/lib/modules/wireless.ko

# Permission files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml

# chargermode
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/chargermode/images/battery_ani_01.rle:root/chargerimages/battery_ani_01.rle \
    $(LOCAL_PATH)/chargermode/images/battery_ani_02.rle:root/chargerimages/battery_ani_02.rle \
    $(LOCAL_PATH)/chargermode/images/battery_ani_03.rle:root/chargerimages/battery_ani_03.rle \
    $(LOCAL_PATH)/chargermode/images/battery_ani_04.rle:root/chargerimages/battery_ani_04.rle \
    $(LOCAL_PATH)/chargermode/images/battery_bg.rle:root/chargerimages/battery_bg.rle \
    $(LOCAL_PATH)/chargermode/images/battery_charging_01.rle:root/chargerimages/battery_charging_01.rle \
    $(LOCAL_PATH)/chargermode/images/battery_charging_02.rle:root/chargerimages/battery_charging_02.rle \
    $(LOCAL_PATH)/chargermode/images/battery_charging_03.rle:root/chargerimages/battery_charging_03.rle \
    $(LOCAL_PATH)/chargermode/images/battery_charging_04.rle:root/chargerimages/battery_charging_04.rle \
    $(LOCAL_PATH)/chargermode/images/battery_charging_05.rle:root/chargerimages/battery_charging_05.rle \
    $(LOCAL_PATH)/chargermode/images/battery_charging_06.rle:root/chargerimages/battery_charging_06.rle \
    $(LOCAL_PATH)/chargermode/images/battery_wait_ani_01.rle:root/chargerimages/battery_wait_ani_01.rle \
    $(LOCAL_PATH)/chargermode/images/battery_wait_ani_02.rle:root/chargerimages/battery_wait_ani_02.rle \
    $(LOCAL_PATH)/chargermode/images/black_bg.rle:root/chargerimages/black_bg.rle \
    $(LOCAL_PATH)/chargermode/images/dummy_battery.rle:root/chargerimages/dummy_battery.rle \
    $(LOCAL_PATH)/chargermode/chargerlogo:root/sbin/chargerlogo

$(call inherit-product, build/target/product/full.mk)

PRODUCT_PACKAGES += \
    hwaddrs \
    lgapversion \
    gps.e720 \
    copybit.msm7k \
    lights.msm7k \
    libOmxCore \
    libcamera

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := e720
PRODUCT_DEVICE := e720
PRODUCT_MODEL := LG Optimus Chic
PRODUCT_MANUFACTURER := LGE
