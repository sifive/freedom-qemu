
# The package build needs the tools in the PATH, and the windows build might use the ubuntu (native)
PATH := $(abspath $(OBJ_NATIVE)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(NATIVE)/bin):$(PATH)
export PATH

# The actual output of this repository is a set of tarballs.
.PHONY: win64-package
win64-package: $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64).zip
win64-package: $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64).src.zip
win64-package: $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64).tar.gz
win64-package: $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64).src.tar.gz
.PHONY: ubuntu64-package
ubuntu64-package: $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64).tar.gz
ubuntu64-package: $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64).src.tar.gz
.PHONY: redhat-package
redhat-package: $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT).tar.gz
redhat-package: $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT).src.tar.gz
.PHONY: darwin-package
darwin-package: $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(DARWIN).tar.gz
darwin-package: $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(DARWIN).src.tar.gz

# There's enough % rules that make starts blowing intermediate files away.
.SECONDARY:

$(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64).zip: \
		$(OBJDIR)/$(WIN64)/build/$(PACKAGE_HEADING)/install.stamp \
		$(OBJDIR)/$(WIN64)/build/$(PACKAGE_HEADING)/libs.stamp
	mkdir -p $(dir $@)
	cd $(OBJDIR)/$(WIN64)/install; zip -rq $(abspath $@) $(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64)

$(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64).src.zip: \
		$(OBJDIR)/$(WIN64)/build/$(PACKAGE_HEADING)/install.stamp \
		$(OBJDIR)/$(WIN64)/build/$(PACKAGE_HEADING)/libs.stamp
	mkdir -p $(dir $@)
	rm -rf $(RECDIR)- $(RECDIR)-$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64)
	cp -a $(OBJ_WIN64)/rec/$(PACKAGE_HEADING) $(RECDIR)-$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64)
	cd $(abspath $(PREFIXPATH).); zip -x "/bin/*" "/obj/*" -rq $(abspath $@) .git* *
	rm -rf $(RECDIR)- $(RECDIR)-$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64)

$(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64).tar.gz: \
		$(OBJDIR)/$(WIN64)/build/$(PACKAGE_HEADING)/install.stamp
	mkdir -p $(dir $@)
	$(TAR) --dereference --hard-dereference -C $(OBJDIR)/$(WIN64)/install -c $(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64) | gzip > $(abspath $@)

$(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64).src.tar.gz: \
		$(OBJDIR)/$(WIN64)/build/$(PACKAGE_HEADING)/install.stamp
	mkdir -p $(dir $@)
	rm -rf $(RECDIR)- $(RECDIR)-$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64)
	cp -a $(OBJ_WIN64)/rec/$(PACKAGE_HEADING) $(RECDIR)-$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64)
	$(TAR) --dereference --hard-dereference -C $(abspath $(PREFIXPATH).) --exclude bin --exclude obj -c .git* * | gzip > $(abspath $@)
	rm -rf $(RECDIR)- $(RECDIR)-$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64)

$(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(NATIVE).tar.gz: \
		$(OBJDIR)/$(NATIVE)/build/$(PACKAGE_HEADING)/install.stamp
	mkdir -p $(dir $@)
	$(TAR) --dereference --hard-dereference -C $(OBJDIR)/$(NATIVE)/install -c $(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(NATIVE) | gzip > $(abspath $@)

$(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(NATIVE).src.tar.gz: \
		$(OBJDIR)/$(NATIVE)/build/$(PACKAGE_HEADING)/install.stamp
	mkdir -p $(dir $@)
	rm -rf $(RECDIR)-$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(NATIVE)
	cp -a $(OBJ_NATIVE)/rec/$(PACKAGE_HEADING) $(RECDIR)-$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(NATIVE)
	$(TAR) --dereference --hard-dereference -C $(abspath $(PREFIXPATH).) --exclude bin --exclude obj -c .git* * | gzip > $(abspath $@)
	rm -rf $(RECDIR)-$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(NATIVE)

# Installs native package.
PACKAGE_TARBALL = $(wildcard $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(NATIVE).tar.gz)
ifneq ($(PACKAGE_TARBALL),)
PACKAGE_TARNAME = $(basename $(basename $(notdir $(PACKAGE_TARBALL))))

$(OBJDIR)/$(NATIVE)/test/$(PACKAGE_HEADING)/launch.stamp: \
		$(PACKAGE_TARBALL)
	mkdir -p $(dir $@)
	rm -rf $(OBJDIR)/$(NATIVE)/launch/$(PACKAGE_TARNAME)
	mkdir -p $(OBJDIR)/$(NATIVE)/launch
	$(TAR) -xz -C $(OBJDIR)/$(NATIVE)/launch -f $(PACKAGE_TARBALL)
	date > $@
else
$(OBJDIR)/$(NATIVE)/test/$(PACKAGE_HEADING)/launch.stamp:
	$(error No $(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(NATIVE).tar.gz tarball available for testing!)
endif

.PHONY: native-regress
native-regress: $(OBJDIR)/$(NATIVE)/test/$(PACKAGE_HEADING)/test.stamp

.PHONY: cleanup
cleanup:
	rm -rf $(OBJ_NATIVE)/rec/$(PACKAGE_HEADING)
	rm -rf $(OBJ_NATIVE)/test/$(PACKAGE_HEADING)
	rm -rf $(OBJ_NATIVE)/build/$(PACKAGE_HEADING)
	rm -rf $(OBJ_NATIVE)/launch/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(NATIVE)
	rm -rf $(OBJ_NATIVE)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(NATIVE)
	rm -rf $(RECDIR)-$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(NATIVE)
	rm -rf $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(NATIVE).tar.gz
	rm -rf $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(NATIVE).src.tar.gz
	rm -rf $(OBJ_WIN64)/rec/$(PACKAGE_HEADING)
	rm -rf $(OBJ_WIN64)/test/$(PACKAGE_HEADING)
	rm -rf $(OBJ_WIN64)/build/$(PACKAGE_HEADING)
	rm -rf $(OBJ_WIN64)/launch/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64)
	rm -rf $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64)
	rm -rf $(RECDIR)-$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64)
	rm -rf $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64).zip
	rm -rf $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64).src.zip
	rm -rf $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64).tar.gz
	rm -rf $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64).src.tar.gz
