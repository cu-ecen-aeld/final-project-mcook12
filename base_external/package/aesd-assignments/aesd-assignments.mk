##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = d60d5e4897e8f03c40b73f93f88fe844be24faa6
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-mcook12.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES
AESD_ASSIGNMENTS_MODULE_SUBDIRS = aesd-char-driver
AESD_ASSIGNMENTS_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

ifeq ($(BR2_PACKAGE_USE_AESD_CHAR_DEVICE),y)
	MY_CFLAGS += -DUSE_AESD_CHAR_DEVICE=1
else
	MY_CFLAGS += -DUSE_AESD_CHAR_DEVICE=0
endif

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
        $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
	#$(MAKE) $(TARGET_CONFIGURE_OPTS) EXTRA_CFLAGS="$(MY_CFLAGS)" -C $(@D)/server # all CROSS_COMPILE=aarch64-none-linux-gnu-
	# $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/aesd-char-driver CROSS_COMPILE=aarch64-none-linux-gnu-
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/etc/finder-app
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/etc/finder-app
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/etc/finder-app
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/* $(TARGET_DIR)/usr/bin
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment9/* $(TARGET_DIR)/bin

endef
$(eval $(kernel-module))
$(eval $(generic-package))
