ARCHS = armv7 arm64
TARGET = iphone:clang:latest:latest

include theos/makefiles/common.mk

BUNDLE_NAME = AlurtPrefs
AlurtPrefs_FILES = AlurtPrefs.mm
AlurtPrefs_INSTALL_PATH = /Library/PreferenceBundles
AlurtPrefs_FRAMEWORKS = UIKit
AlurtPrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/AlurtPrefs.plist$(ECHO_END)
