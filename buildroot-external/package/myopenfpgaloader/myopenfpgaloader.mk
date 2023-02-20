################################################################################
#
# openFPGALoader
#
################################################################################

MYOPENFPGALOADER_VERSION = 0.10.0
MYOPENFPGALOADER_SOURCE = v$(MYOPENFPGALOADER_VERSION).tar.gz
MYOPENFPGALOADER_SITE = https://github.com/trabucayre/openFPGALoader/archive/refs/tags/
MYOPENFPGALOADER_SITE_METHOD = wget
MYOPENFPGALOADER_INSTALL_STAGING = YES
MYOPENFPGALOADER_LICENSE = Apache-2.0
MYOPENFPGALOADER_LICENSE_FILES = LICENSE
MYOPENFPGALOADER_CPE_ID_VENDOR = trabucayre
MYOPENFPGALOADER_DEPENDENCIES = libftdi1

# we are built before ccache
HOST_MYOPENFPGALOADER_CONF_ENV = \
	CC="$(HOSTCC_NOCCACHE)" \
	CXX="$(HOSTCXX_NOCCACHE)"

ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
OPENFPGALOADER_DEPENDENCIES += udev
OPENFPGALOADER_CONF_OPTS += -DENABLE_UDEV=ON
else
OPENFPGALOADER_CONF_OPTS += -DENABLE_UDEV=OFF
endif

$(eval $(cmake-package))