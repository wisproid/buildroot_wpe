################################################################################
#
# wpeframework-rdkservices
#
################################################################################
WPEFRAMEWORK_RDKSERVICES_VERSION = R4.4.0
WPEFRAMEWORK_RDKSERVICES_SITE_METHOD = git
WPEFRAMEWORK_RDKSERVICES_SITE = git@github.com:WebPlatformForEmbedded/ThunderNanoServicesRDK.git
WPEFRAMEWORK_RDKSERVICES_INSTALL_STAGING = YES
WPEFRAMEWORK_RDKSERVICES_DEPENDENCIES = wpeframework-clientlibraries

WPEFRAMEWORK_RDKSERVICES_OPKG_NAME = "wpeframework-rdkservices"
WPEFRAMEWORK_RDKSERVICES_OPKG_VERSION = "1.0.0"
WPEFRAMEWORK_RDKSERVICES_OPKG_ARCHITECTURE = "${BR2_ARCH}"
WPEFRAMEWORK_RDKSERVICES_OPKG_MAINTAINER = "Metrological"
WPEFRAMEWORK_RDKSERVICES_OPKG_DESCRIPTION = "WPEFramework rdkservices"

ifeq ($(BR2_CMAKE_HOST_DEPENDENCY),)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += \
       -DCMAKE_MODULE_PATH=$(HOST_DIR)/share/cmake/Modules
endif

WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DBUILD_REFERENCE=${WPEFRAMEWORK_RDKSERVICES_VERSION}

WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DCOMCAST_CONFIG=OFF

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_DEVICEINFO),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_DEVICEINFO=ON

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_DEVICEINFO_MODELNAME),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_DEVICEINFO_MODELNAME=$(BR2_PACKAGE_WPEFRAMEWORK_DEVICEINFO_MODELNAME)
endif

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_DEVICEINFO_MODELYEAR),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_DEVICEINFO_MODELYEAR=$(BR2_PACKAGE_WPEFRAMEWORK_DEVICEINFO_MODELYEAR)
endif

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_DEVICEINFO_FRIENDLYNAME),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_DEVICEINFO_FRIENDLYNAME=$(BR2_PACKAGE_WPEFRAMEWORK_DEVICEINFO_FRIENDLYNAME)
endif

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_DEVICEINFO_SYSTEMINTEGRATORNAME),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_DEVICEINFO_SYSTEMINTEGRATORNAME=$(BR2_PACKAGE_WPEFRAMEWORK_DEVICEINFO_SYSTEMINTEGRATORNAME)
endif

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_DEVICEINFO_PLATFORMNAME),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_DEVICEINFO_PLATFORMNAME=$(BR2_PACKAGE_WPEFRAMEWORK_DEVICEINFO_PLATFORMNAME)
endif

endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_DISPLAYINFO),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_DISPLAYINFO=ON
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DDISPLAYINFO_IMPLEMENTATION_REPOSITORY=git@github.com:WebPlatformForEmbedded/DisplayInfo-brcm.git
ifeq ($(BR2_PACKAGE_RPI_FIRMWARE),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_DISPLAYINFO_HDCP_LEVEL="Hdcp1X"
endif
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_MONITOR),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_MONITOR=ON
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_MONITOR_WEBKITBROWSER),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_MONITOR_WEBKITBROWSER_WEBKIT=ON
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_MONITOR_WEBKITBROWSER_MEMORYLIMIT=${BR2_PACKAGE_WPEFRAMEWORK_MONITOR_WEBKITBROWSER}
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_MONITOR_WEBKITBROWSER_APPS),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_MONITOR_WEBKITBROWSER_APPS=ON
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_MONITOR_WEBKITBROWSER_APPS_MEMORYLIMIT=${BR2_PACKAGE_WPEFRAMEWORK_MONITOR_WEBKITBROWSER_APPS}
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_MONITOR_WEBKITBROWSER_UX),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_MONITOR_WEBKITBROWSER_UX=ON
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_MONITOR_WEBKITBROWSER_UX_MEMORYLIMIT=${BR2_PACKAGE_WPEFRAMEWORK_MONITOR_WEBKITBROWSER_UX}
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_MONITOR_WEBKITBROWSER_YOUTUBE),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_MONITOR_WEBKITBROWSER_YOUTUBE=ON
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_MONITOR_WEBKITBROWSER_YOUTUBE_MEMORYLIMIT=${BR2_PACKAGE_WPEFRAMEWORK_MONITOR_WEBKITBROWSER_YOUTUBE}
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_MONITOR_AMAZON),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_MONITOR_AMAZON=ON
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_MONITOR_AMAZON_MEMORYLIMIT=${BR2_PACKAGE_WPEFRAMEWORK_MONITOR_AMAZON}
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_MONITOR_COBALT),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_MONITOR_COBALT=ON
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_MONITOR_COBALT_MEMORYLIMIT=${BR2_PACKAGE_WPEFRAMEWORK_MONITOR_COBALT}
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_MONITOR_NETFLIX),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_MONITOR_NETFLIX=ON
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_MONITOR_NETFLIX_MEMORYLIMIT=${BR2_PACKAGE_WPEFRAMEWORK_MONITOR_NETFLIX}
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_MONITOR_OPENCDMI),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_MONITOR_OPENCDMI=ON
endif
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PERFORMANCEMETRICS),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_PERFORMANCEMETRICS=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PLAYERINFO),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_PLAYERINFO=ON
#WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DDOLBY_SUPPORT=ON
#WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DDOLBY_IMPLEMENTATION="AMLogic"
#WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DDOLBY_IMPLEMENTATION_PATH="AMLogic"
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_TRACECONTROL),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_TRACECONTROL=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_MESSAGECONTROL),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_MESSAGECONTROL=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WARNINGREPORTINGCONTROL),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WARNINGREPORTINGCONTROL=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_LOCATIONSYNC),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_LOCATIONSYNC=ON
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_LOCATIONSYNC_URI=${BR2_PACKAGE_WPEFRAMEWORK_LOCATIONSYNC_URI}
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_OPENCDMI=ON
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_OPENCDMI_AUTOSTART=true
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_OPENCDMI_OUTOFPROCESS=true
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_WIDEVINE_KEYBOX),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_OPENCDMI_WIDEVINE_KEYBOX="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_CDMI_WIDEVINE_KEYBOX))"
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_WIDEVINE_DEVICE_CERTIFICATE),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += \
    -DPLUGIN_OPENCDMI_WIDEVINE_DEVICE_CERTIFICATE="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_CDMI_WIDEVINE_DEVICE_CERTIFICATE))"
endif

ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_WIDEVINE_STORAGE_LOCATION),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += \
    -DPLUGIN_OPENCDMI_WIDEVINE_STORAGE_LOCATION="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_CDMI_WIDEVINE_STORAGE_LOCATION))"
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_GROUP),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_OPENCDMI_GROUP=$(BR2_PACKAGE_WPEFRAMEWORK_CDMI_GROUP)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_OPENCDMI_CONNECTOR="/tmp/ocdm|0770,$(subst ",,$(BR2_PACKAGE_WPEFRAMEWORK_CDMI_GROUP)")"
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_USER),"")
WPEFRAMEWORK_CDMI_USER=ocdm
else
WPEFRAMEWORK_CDMI_USER=$(subst ",,$(BR2_PACKAGE_WPEFRAMEWORK_CDMI_GROUP)")
endif
WPEFRAMEWORK_CDMI_USER_GROUP=$(WPEFRAMEWORK_CDMI_USER) -1 $(subst ",,$(BR2_PACKAGE_WPEFRAMEWORK_CDMI_GROUP)") -1 * - - root,$(subst ",,$(BR2_PACKAGE_WPEFRAMEWORK_GROUP)") opencdm
WPEFRAMEWORK_CDMI_PERMISSION=$(subst ",,$(BR2_PACKAGE_WPEFRAMEWORK_INSTALL_PATH)")/OCDM d 0550 root $(subst ",,$(BR2_PACKAGE_WPEFRAMEWORK_CDMI_GROUP)") - - - - -
endif
ifneq ($(WPEFRAMEWORK_CDMI_USER),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_OPENCDMI_USER=$(BR2_PACKAGE_WPEFRAMEWORK_CDMI_USER)
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_CLEARKEY),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_OPENCDMI_CLEARKEY=ON
WPEFRAMEWORK_RDKSERVICES_DEPENDENCIES += wpeframework-cdmi-clearkey
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_PLAYREADY),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_OPENCDMI_PLAYREADY=ON
WPEFRAMEWORK_RDKSERVICES_DEPENDENCIES += wpeframework-cdmi-playready
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_PLAYREADY_CERTIFICATE_LABEL),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_OPENCDMI_PLAYREADY_CERTIFICATE_LABEL="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_CDMI_PLAYREADY_CERTIFICATE_LABEL))"
endif
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_PLAYREADY_NEXUS),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_OPENCDMI_PLAYREADY_NEXUS=ON
WPEFRAMEWORK_RDKSERVICES_DEPENDENCIES += wpeframework-cdmi-playready-nexus
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_PLAYREADY_NEXUS_SVP),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_OPENCDMI_PLAYREADY_NEXUS=ON
WPEFRAMEWORK_RDKSERVICES_DEPENDENCIES += wpeframework-cdmi-playready-nexus-svp
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_PLAYREADY_SECURE_STOP_METERING_CERTIFICATE),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_OPENCDMI_PLAYREADY_METERING_CERTIFICATE="$(call qstrip,$(BR2_PACKAGE_WPEFRAMEWORK_CDMI_PLAYREADY_SECURE_STOP_METERING_CERTIFICATE))"
endif
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_PLAYREADY_VGDRM),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_OPENCDMI_PLAYREADY_VGDRM=ON
WPEFRAMEWORK_RDKSERVICES_DEPENDENCIES += wpeframework-cdmi-playready-vgdrm
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_WIDEVINE),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_OPENCDMI_WIDEVINE=ON
WPEFRAMEWORK_RDKSERVICES_DEPENDENCIES += wpeframework-cdmi-widevine
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_WIDEVINE_NEXUS_SVP),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DOPENCDMI_WIDEVINE_NEXUS_SVP=ON
WPEFRAMEWORK_RDKSERVICES_DEPENDENCIES += wpeframework-cdmi-widevine-nexus-svp
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_NAGRA),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_OPENCDMI_NAGRA=ON
WPEFRAMEWORK_RDKSERVICES_DEPENDENCIES += wpeframework-cdmi-nagra
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_NCAS),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_OPENCDMI_NCAS=ON
WPEFRAMEWORK_RDKSERVICES_DEPENDENCIES += wpeframework-cdmi-ncas
endif
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_MESSENGER),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_MESSENGER=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_SECURITYAGENT),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_SECURITYAGENT=ON
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_PACKAGER),y)
WPEFRAMEWORK_RDKSERVICES_DEPENDENCIES += opkg
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_PACKAGER=ON
endif

ifeq  ($(BR2_PACKAGE_WPEFRAMEWORK_DEVICEIDENTIFICATION),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_DEVICEIDENTIFICATION=ON
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DDEVICEIDENTIFICATION_IMPLEMENTATION_REPOSITORY=git@github.com:WebPlatformForEmbedded/DeviceIdentification-brcm.git
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_DEVICEIDENTIFICATION_INTERFACE_NAME=$(BR2_PACKAGE_WPEFRAMEWORK_DEVICEIDENTIFICATION_INTERFACE_NAME)
endif

ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER),y)
WPEFRAMEWORK_RDKSERVICES_DEPENDENCIES += wpewebkit
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER=ON
ifneq ($(BR2_PACKAGE_WPEWEBKIT_ALTERNATIVE_EXEC_PATH),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_ALTERNATIVE_EXEC_PATH="$(call qstrip,$(BR2_PACKAGE_WPEWEBKIT_ALTERNATIVE_EXEC_PATH))"
endif
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_EXTENSION_DIRECTORY=$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROW_EXTENSION_DIRECTORY)
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_TAB),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_AMAZON_HYBRID=ON
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_AUTOSTART),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_AUTOSTART=true
else
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_AUTOSTART=false
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_INJECTEDBUNDLE_INTERFACES),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_INJECTEDBUNDLE_INTERFACES=true
else
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_INJECTEDBUNDLE_INTERFACES=false
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_STARTURL),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_STARTURL=$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_STARTURL)
else
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_STARTURL="file:///www/index.html"
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_USERAGENT),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_USERAGENT=$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_USERAGENT)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_MEMORYPROFILE),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_MEMORYPROFILE=$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_MEMORYPROFILE)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_MEMORYPRESSURE),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_MEMORYPRESSURE=$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_MEMORYPRESSURE)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_MEDIA_CONTENT_TYPES_REQUIRING_HARDWARE_SUPPORT),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_MEDIA_CONTENT_TYPES_REQUIRING_HARDWARE_SUPPORT=$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_MEDIA_CONTENT_TYPES_REQUIRING_HARDWARE_SUPPORT)
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_MEDIADISKCACHE),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_MEDIADISKCACHE=true
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_DISKCACHE),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_DISKCACHE=$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_DISKCACHE)
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_XHRCACHE),)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_XHRCACHE=false
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_CLIENTIDENTIFIER),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_CLIENTIDENTIFIER=$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_CLIENTIDENTIFIER)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_LOCALSTORAGE),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_LOCALSTORAGE=$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_LOCALSTORAGE)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_COOKIESTORAGE),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_COOKIESTORAGE=$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_COOKIESTORAGE)
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_WINDOWCLOSE),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_WINDOWCLOSE=true
else
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_WINDOWCLOSE=false
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_DISABLE_WEBGL),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_WEBGL=false
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_TRANSPARENT),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_TRANSPARENT=true
else
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_TRANSPARENT=false
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_THREADEDPAINTING),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_THREADEDPAINTING=$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_THREADEDPAINTING)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_USER),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_USER=$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_USER)
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_GROUP),"")
WPEFRAMEWORK_WEBKITBROWSER_USER_GROUP=wpewebkit
else
WPEFRAMEWORK_WEBKITBROWSER_USER_GROUP=$(subst ",,$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_GROUP)")
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_CDMI_GROUP),"")
WPEFRAMEWORK_CDMI_GROUP=,$(subst ",,$(BR2_PACKAGE_WPEFRAMEWORK_CDMI_GROUP)")
endif
WPEFRAMEWORK_WEBKITBROWSER_USER=$(subst ",,$(BR2_PACKAGE_WPEFRAMEWORK_WEBKITBROWSER_USER)") -1 $(WPEFRAMEWORK_WEBKITBROWSER_USER_GROUP) -1 * - - $(subst ",,$(BR2_PACKAGE_WPEFRAMEWORK_PLATFORM_VIDEO_DEVICE_GROUP)"),$(subst ",,$(BR2_PACKAGE_WPEFRAMEWORK_GROUP)")$(WPEFRAMEWORK_CDMI_GROUP) webkit browser
WPEFRAMEWORK_WEBKITBROWSER_PERMISSION=$(subst ",,$(BR2_PACKAGE_WPEFRAMEWORK_INSTALL_PATH)")/WebKitBrowser r 0440 root $(subst ",,$(WPEFRAMEWORK_WEBKITBROWSER_USER_GROUP)") - - - - -
endif
ifneq ($(WPEFRAMEWORK_WEBKITBROWSER_USER_GROUP),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_GROUP=$(WPEFRAMEWORK_WEBKITBROWSER_USER_GROUP)
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_BROWSER_RESOLUTION_720P),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_RESOLUTION=720p
else ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_BROWSER_RESOLUTION_1080P),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_RESOLUTION=1080p
else ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_BROWSER_RESOLUTION_2160P),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_RESOLUTION=2160p
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_YOUTUBE),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_YOUTUBE=ON
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_YOUTUBE_USERAGENT),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_YOUTUBE_USERAGENT=$(BR2_PACKAGE_WPEFRAMEWORK_YOUTUBE_USERAGENT)
endif
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_TAB),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_AMAZON=ON
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_STARTURL),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_AMAZON_STARTURL=$(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_STARTURL)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_CA_DIRECTORY_PATH),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_AMAZON_CADIRECTORYPATH=$(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_CA_DIRECTORY_PATH)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_CA_BUNDLE_FILENAME),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_AMAZON_CABUNDLEFILENAME=$(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_CA_BUNDLE_FILENAME)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_MANUFACTURER),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_AMAZON_MANUFACTURER=$(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_MANUFACTURER)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_MODELNAME),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_AMAZON_MODELNAME=$(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_MODELNAME)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_DEVICELANGUAGE),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_AMAZON_DEVICELANGUAGE=$(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_DEVICELANGUAGE)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_DEVICETYPEID),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_AMAZON_DEVICETYPEID=$(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_DEVICETYPEID)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_FIRMWARE_VERSION),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_AMAZON_FIRMWAREVERSION=$(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_FIRMWARE_VERSION)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_CHIPSET_NAME),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_AMAZON_CHIPSETNAME=$(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_CHIPSET_NAME)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_ETHERNET_DEVICE),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_AMAZON_ETHERNETDEVICE=$(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_ETHERNET_DEVICE)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_FRAGMENT_CACHE_SIZE),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_AMAZON_FRAGMENTCACHESIZE=$(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_FRAGMENT_CACHE_SIZE)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_USERAGENT),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_AMAZON_USERAGENT=$(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_USERAGENT)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_USER),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_AMAZON_USER=$(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_USER)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_GROUP),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_AMAZON_GROUP=$(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_GROUP)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_MEMORYPROFILE),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_AMAZON_MEMORYPROFILE=$(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_MEMORYPROFILE)
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_MEMORYPRESSURE),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_AMAZON_MEMORYPRESSURE=$(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_MEMORYPRESSURE)
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_AMAZON_TRANSPARENT),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_AMAZON_TRANSPARENT=true
else
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_AMAZON_TRANSPARENT=false
endif
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_AMAZON_HAWAII=ON
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_APPS),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_APPS=ON
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_APPS_AUTOSTART),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_APPS_AUTOSTART=true
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_APPS_USERAGENT),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_APPS_USERAGENT=$(BR2_PACKAGE_WPEFRAMEWORK_APPS_USERAGENT)
endif
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_RESIDENTAPP),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_RESIDENT_APP=ON
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_RESIDENTAPP_AUTOSTART),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_RESIDENT_APP_AUTOSTART=true
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_RESIDENTAPP_USERAGENT),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_RESIDENT_APP_USERAGENT=$(BR2_PACKAGE_WPEFRAMEWORK_RESIDENTAPP_USERAGENT)
endif
endif
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_UX),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_WEBKITBROWSER_UX=ON
ifeq ($(BR2_PACKAGE_WPEFRAMEWORK_UX_AUTOSTART),y)
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_UX_AUTOSTART=true
endif
ifneq ($(BR2_PACKAGE_WPEFRAMEWORK_UX_USERAGENT),"")
WPEFRAMEWORK_RDKSERVICES_CONF_OPTS += -DPLUGIN_UX_USERAGENT=$(BR2_PACKAGE_WPEFRAMEWORK_UX_USERAGENT)
endif
endif
endif

define WPEFRAMEWORK_RDKSERVICES_USERS
	${WPEFRAMEWORK_CDMI_USER_GROUP}
	${WPEFRAMEWORK_WEBKITBROWSER_USER}
endef

define WPEFRAMEWORK_RDKSERVICES_PERMISSIONS
	${WPEFRAMEWORK_CDMI_PERMISSION}
	${WPEFRAMEWORK_WEBKITBROWSER_PERMISSION}
endef

$(eval $(cmake-package))
