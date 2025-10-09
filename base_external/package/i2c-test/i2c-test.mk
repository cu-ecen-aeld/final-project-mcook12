
##############################################################
#
# I2C-Test
#
##############################################################

I2C_TEST_VERSION = 5888da81804dec55cc497de21b323dd56c0fb950
I2C_TEST_SITE = git@github.com:mcook12/final-project-assignment-turbinemodel.git
I2C_TEST_SITE_METHOD = git
I2C_TEST_GIT_SUBMODULES = YES
I2C_TEST_MODULE_SUBDIRS = i2c-test

define I2C_TEST_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/i2c-test all
endef

define I2C_TEST_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/i2c-test/* $(TARGET_DIR)/usr/bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))
