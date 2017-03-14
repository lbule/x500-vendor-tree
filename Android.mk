LOCAL_PATH := $(call my-dir)

$(info [Decker] copying DP Framework proprietary blobs)


include $(CLEAR_VARS)
LOCAL_MODULE = libdpframework
LOCAL_MODULE_CLASS = SHARED_LIBRARIES
LOCAL_MODULE_OWNER = $VENDOR
LOCAL_MODULE_SUFFIX = .so
LOCAL_PROPRIETARY_MODULE = true
LOCAL_MULTILIB = 64
LOCAL_SRC_FILES_64 = proprietary/lib64/libdpframework.so
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE = libdpframework
LOCAL_MODULE_CLASS = SHARED_LIBRARIES
LOCAL_MODULE_OWNER = mtk
LOCAL_MODULE_SUFFIX = .so
LOCAL_PROPRIETARY_MODULE = true
LOCAL_MULTILIB = 32
LOCAL_SRC_FILES_32 = proprietary/lib/libdpframework.so
include $(BUILD_PREBUILT)

LOCAL_PATH := $(call my-dir)
ifeq ($(TARGET_DEVICE),X500)
# Making symlinks in libMcGatekeeper
$(shell ln -sf libMcGatekeeper.so $(TARGET_OUT)/lib64/hw/gatekeeper.mt6795.so; \
	ln -sf libMcGatekeeper.so $(TARGET_OUT)/lib64/hw/gatekeeper.x500.so; \
	ln -sf libMcGatekeeper.so $(TARGET_OUT)/lib/hw/gatekeeper.mt6795.so; \
	ln -sf libMcGatekeeper.so $(TARGET_OUT)/lib/hw/gatekeeper.x500.so; )
endif
