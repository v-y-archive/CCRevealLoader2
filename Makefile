THEOS_DEVICE_IP = 127.0.0.1
THEOS_DEVICE_PORT = 2922
ARCHS = armv7 arm64
TARGET = iphone:latest:8.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CCRevealLoader
CCRevealLoader_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

before-package::
	@echo "Connecting to the device..."
	iproxy $(THEOS_DEVICE_PORT):22 $(if $(udid),--udid=$(udid)) &>/dev/null &
	@echo "Downlading reveal server framework..."
	@mkdir -p ./layout/Library/Application\ Support/CCRevealLoader/
	@unzip -n /Applications/Reveal.app/Contents/SharedSupport/RevealServer.zip &>/dev/null
	@cp -r  ./RevealServer/RevealServer.xcframework/ios-arm64_armv7/RevealServer.framework ./layout/Library/Application\ Support/CCRevealLoader/
	@echo "Signing tweak..."
	@ldid -S ./layout/Library/Application\ Support/CCRevealLoader/RevealServer.framework
after-install::
	install.exec "killall -9 SpringBoard"
	@echo "Detaching the device..."
	kill $$(ps -ef | grep "[i]proxy $(THEOS_DEVICE_PORT)" | awk '{print $$2}')
	@echo "Done"