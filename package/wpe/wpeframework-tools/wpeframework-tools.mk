################################################################################
#
# wpeframework-tools
#
################################################################################
HOST_WPEFRAMEWORK_TOOLS_VERSION = R4.4.1
HOST_WPEFRAMEWORK_TOOLS_SITE = $(call github,rdkcentral,ThunderTools,$(HOST_WPEFRAMEWORK_TOOLS_VERSION))
HOST_WPEFRAMEWORK_TOOLS_INSTALL_STAGING = YES
HOST_WPEFRAMEWORK_TOOLS_INSTALL_TARGET = NO
HOST_WPEFRAMEWORK_TOOLS_DEPENDENCIES = host-cmake host-python3 host-python3-jsonref


ifeq ($(BR2_CMAKE_HOST_DEPENDENCY),)
HOST_WPEFRAMEWORK_TOOLS_CONF_OPTS += \
	-DGENERIC_CMAKE_MODULE_PATH=$(HOST_DIR)/share/cmake/Modules
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_TOOLS_PROXYSTUB_SECURITY),y)
	HOST_WPEFRAMEWORK_TOOLS_CONF_OPTS += -DPROXYSTUB_GENERATOR_ENABLE_SECURITY=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_TOOLS_PROXYSTUB_COHERENCY),y)
	HOST_WPEFRAMEWORK_TOOLS_CONF_OPTS += -DPROXYSTUB_GENERATOR_ENABLE_COHERENCY=ON
endif

$(eval $(host-cmake-package))
