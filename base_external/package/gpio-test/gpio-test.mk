
##############################################################
#
# GPIO-Test
#
##############################################################

GPIO_TEST_VERSION = 7d4eded76089b7e198fe092ba3bc59d36fc6ffa8
GPIO_TEST_SITE = git@github.com:mcook12/final-project-assignment-turbinemodel.git
GPIO_TEST_SITE_METHOD = git
GPIO_TEST_GIT_SUBMODULES = YES
GPIO_TEST_MODULE_SUBDIRS = gpio-test

define GPIO_TEST_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/gpio-test all
endef

define GPIO_TEST_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/gpio-test/* $(TARGET_DIR)/usr/bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))
