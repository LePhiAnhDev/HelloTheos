ARCHS = arm64 arm64e
TARGET = iphone:clang:16.5:14.0

include $(THEOS)/makefiles/common.mk

APPLICATION_NAME = HelloTheos

HelloTheos_FILES = Sources/AppDelegate.swift Sources/SceneDelegate.swift Sources/ViewController.swift
HelloTheos_FRAMEWORKS = UIKit
HelloTheos_SWIFTFLAGS = -swift-version 5
HelloTheos_CFLAGS = -fobjc-arc
HelloTheos_INSTALL_PATH = /Applications

include $(THEOS)/makefiles/application.mk

after-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Applications/HelloTheos.app$(ECHO_END)
	$(ECHO_NOTHING)cp -r Resources/* $(THEOS_STAGING_DIR)/Applications/HelloTheos.app/$(ECHO_END)
	$(ECHO_NOTHING)chmod +x $(THEOS_STAGING_DIR)/Applications/HelloTheos.app/HelloTheos$(ECHO_END)