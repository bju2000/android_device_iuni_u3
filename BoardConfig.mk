#
# Copyright (C) 2014 The CyanogenMod Project
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

<<<<<<< HEAD
# inherit from Oppo common
-include device/oppo/common/BoardConfigCommon.mk

PLATFORM_PATH := device/oneplus/bacon

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(PLATFORM_PATH)/include

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8974
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Platform
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := krait

# Assertions
TARGET_BOARD_INFO_FILE ?= $(PLATFORM_PATH)/board-info.txt

# Kernel
BOARD_CUSTOM_BOOTIMG_MK := $(PLATFORM_PATH)/mkbootimg.mk
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=bacon user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000 --tags_offset 0x01e00000
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_CONFIG := cyanogenmod_bacon_defconfig
TARGET_KERNEL_SOURCE := kernel/oneplus/msm8974

# Enable DIAG on debug builds
ifneq ($(TARGET_BUILD_VARIANT),user)
TARGET_KERNEL_ADDITIONAL_CONFIG:= cyanogenmod_debug_config
endif

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Assert
TARGET_OTA_ASSERT_DEVICE := bacon,A0001

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_HWDEP_CAL := true
AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true

# Bluetooth
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(PLATFORM_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
QCOM_BT_USE_SMD_TTY := true
=======
# Inherit from MSM8974 common
-include device/iuni/msm8974-common/BoardConfigCommon.mk

# Kernel
TARGET_KERNEL_CONFIG := cyanogenmod_u3_defconfig
#BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3 androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3

# to be checked ,force special dt.img
#BOARD_MKBOOTIMG_ARGS  := --ramdisk_offset 0x05000000 --dt device/lge/zee/dt.img --tags_offset 0x04800000
#TARGET_PREBUILT_KERNEL := device/lge/zee/kernel ## For initial recovery builds
#BOARD_KERNEL_SEPARATED_DT := ## For prebuilt kernel use to bypass g2-common
#BOARD_CUSTOM_BOOTIMG_MK := ## For prebuilt kernel use to bypass g2-common


# Use trim command for SSD/EMMC , to be tested in case that cwm gives error at flash
#BOARD_SUPPRESS_EMMC_WIPE := true

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/iuni/u3/bluetooth
>>>>>>> 5f2a89b08e778d0b037e12e33c423900f1980f53

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
COMMON_GLOBAL_CFLAGS += -DIUNI_CAMERA_HARDWARE

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true

# CM Hardware
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS += $(PLATFORM_PATH)/cmhw

# Enable transparent compression in the build
# TARGET_TRANSPARENT_COMPRESSION_METHOD := lz4

# Enable dexpreopt to speed boot time
ifeq ($(HOST_OS),linux)
  ifeq ($(call match-word-in-list,$(TARGET_BUILD_VARIANT),user),true)
    ifeq ($(WITH_DEXPREOPT_BOOT_IMG_ONLY),)
      WITH_DEXPREOPT_BOOT_IMG_ONLY := true
    endif
  endif
endif

# Encryption
TARGET_HW_DISK_ENCRYPTION := true

# Filesystem
<<<<<<< HEAD
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE     := 16777216
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE    := 536870912
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_PARTITION_SIZE  := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 1388314624
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13271448576
BOARD_USERDATAEXTRAIMAGE_PARTITION_SIZE := 59914792960
BOARD_USERDATAEXTRAIMAGE_PARTITION_NAME := 64G
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Workaround for factory issue
BOARD_VOLD_CRYPTFS_MIGRATE := true

# Flags
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD -DUSE_RIL_VERSION_10
COMMON_GLOBAL_CPPFLAGS += -DNO_SECURE_DISCARD -DUSE_RIL_VERSION_10

# Fonts
EXTENDED_FONT_FOOTPRINT := true
=======
BOARD_BOOTIMAGE_PARTITION_SIZE     := 20971520
BOARD_CACHEIMAGE_PARTITION_SIZE    := 402653184
BOARD_PERSISTIMAGE_PARTITION_SIZE  := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 29239515136

# Recovery
TARGET_RECOVERY_FSTAB := device/iuni/u3/rootdir/etc/fstab.u3

TARGET_OTA_ASSERT_DEVICE := u3,U3

TARGET_INIT_VENDOR_LIB := libinit_u3
>>>>>>> 5f2a89b08e778d0b037e12e33c423900f1980f53

# GPS
TARGET_GPS_HAL_PATH := $(PLATFORM_PATH)/gps
TARGET_PROVIDES_GPS_LOC_API := true

# Graphics
HAVE_ADRENO_SOURCE := false
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000
TARGET_CONTINUOUS_SPLASH_ENABLED := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000

<<<<<<< HEAD
# Init
TARGET_INIT_VENDOR_LIB := libinit_bacon

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# NFC
BOARD_NFC_CHIPSET := pn547
=======
#BOARD_NFC_CHIPSET := pn547
>>>>>>> 5f2a89b08e778d0b037e12e33c423900f1980f53

# Protobuf-c
PROTOBUF_SUPPORTED := true

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# Radio
TARGET_RIL_VARIANT := caf

# Recovery
TARGET_RECOVERY_FSTAB := $(PLATFORM_PATH)/rootdir/etc/fstab.bacon

# RPC
TARGET_NO_RPC := true

# SELinux
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
    $(PLATFORM_PATH)/sepolicy

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_HAS_QCOM_WLAN_SDK          := true
BOARD_WLAN_DEVICE                := qcwcn
CONFIG_EAP_PROXY                 := qmi
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_qcwcn
TARGET_USES_WCNSS_CTRL           := true
TARGET_USES_QCOM_WCNSS_QMI       := true
TARGET_USES_WCNSS_MAC_ADDR_REV   := true
TARGET_WCNSS_MAC_PREFIX          := e8bba8
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
WPA_SUPPLICANT_VERSION           := VER_0_8_X

# inherit from the proprietary version
<<<<<<< HEAD
ifneq ($(QCPATH),)
-include $(QCPATH)/common/msm8974/BoardConfigVendor.mk

ifeq ($(BOARD_USES_QCNE),true)
TARGET_LDPRELOAD := libNimsWrap.so
endif
endif

-include vendor/oneplus/bacon/BoardConfigVendor.mk
=======
-include vendor/iuni/u3/BoardConfigVendor.mk
>>>>>>> 5f2a89b08e778d0b037e12e33c423900f1980f53
