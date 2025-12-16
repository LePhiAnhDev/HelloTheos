ARCHS = arm64 arm64e
TARGET = iphone:clang:16.5:14.0

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = MyApp

MyApp_FILES = $(wildcard Sources/*.swift)
MyApp_FRAMEWORKS = UIKit
MyApp_SWIFTFLAGS = -swift-version 5
MyApp_CFLAGS = -fobjc-arc
MyApp_INSTALL_PATH = /Applications

include $(THEOS)/makefiles/application.mk

after-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Applications/$(APPLICATION_NAME).app$(ECHO_END)
	$(ECHO_NOTHING)cp -r Resources/* $(THEOS_STAGING_DIR)/Applications/$(APPLICATION_NAME).app/$(ECHO_END)
	$(ECHO_NOTHING)chmod +x $(THEOS_STAGING_DIR)/Applications/$(APPLICATION_NAME).app/$(APPLICATION_NAME)$(ECHO_END)

after-package::
	$(ECHO_NOTHING)rm -f $(THEOS_PROJECT_DIR)/packages/*.deb$(ECHO_END)
	$(ECHO_NOTHING)mkdir -p $(THEOS_PROJECT_DIR)/.tmp/Payload$(ECHO_END)
	$(ECHO_NOTHING)cp -r $(THEOS_STAGING_DIR)/Applications/$(APPLICATION_NAME).app $(THEOS_PROJECT_DIR)/.tmp/Payload/$(ECHO_END)
	$(ECHO_NOTHING)cd $(THEOS_PROJECT_DIR)/.tmp && zip -qr $(THEOS_PROJECT_DIR)/packages/$(APPLICATION_NAME)_$(THEOS_PACKAGE_BASE_VERSION).ipa Payload$(ECHO_END)
	$(ECHO_NOTHING)rm -rf $(THEOS_PROJECT_DIR)/.tmp$(ECHO_END)