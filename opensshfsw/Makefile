include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = opensshfsw
opensshfsw_FILES = Switch.m
opensshfsw_FRAMEWORKS = UIKit
opensshfsw_LIBRARIES = flipswitch
opensshfsw_INSTALL_PATH = /Library/Switches

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	#PreferenceLoader plist
	$(ECHO_NOTHING)if [ -f Preferences.plist ]; then mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/opensshfsw; cp Preferences.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/opensshfsw/; fi$(ECHO_END)

after-install::
	install.exec "killall -9 SpringBoard"
