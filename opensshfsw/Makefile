export ARCHS = armv7 arm64
export TARGET = iphone:clang:latest:9.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = opensshfsw
opensshfsw_FILES = Tweak.xm
private_FRAMEWORKS = flipswitch

include $(THEOS_MAKE_PATH)/tweak.mk
