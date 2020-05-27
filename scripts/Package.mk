
# The package build needs the tools in the PATH, and the windows build might use the ubuntu (native)
PATH := $(abspath $(OBJ_NATIVE)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(NATIVE)/bin):$(PATH)
export PATH

# The actual output of this repository is a set of tarballs.
.PHONY: win64 win64-package
win64:
win64-package: $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64).zip
win64-package: $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64).src.zip
win64-package: $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64).tar.gz
win64-package: $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64).src.tar.gz
.PHONY: ubuntu64 ubuntu64-package
ubuntu64:
ubuntu64-package: $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64).tar.gz
ubuntu64-package: $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64).src.tar.gz
.PHONY: redhat redhat-package
redhat:
redhat-package: $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT).tar.gz
redhat-package: $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT).src.tar.gz
.PHONY: darwin darwin-package
darwin:
darwin-package: $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(DARWIN).tar.gz
darwin-package: $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(DARWIN).src.tar.gz

# There's enough % rules that make starts blowing intermediate files away.
.SECONDARY:

$(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-%.zip: \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/install.stamp \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/libs.stamp
	$(eval $@_TARGET := $(patsubst $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-%.zip,%,$@))
	mkdir -p $(dir $@)
	cd $(OBJDIR)/$($@_TARGET)/install; zip -rq $(abspath $@) $(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$($@_TARGET)

$(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-%.src.zip: \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/install.stamp \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/libs.stamp
	$(eval $@_TARGET := $(patsubst $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-%.src.zip,%,$@))
	mkdir -p $(dir $@)
	cd $(OBJDIR)/$($@_TARGET)/build; zip -rq $(abspath $@) $(PACKAGE_HEADING)

$(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-%.tar.gz: \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/install.stamp
	$(eval $@_TARGET := $(patsubst $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-%.tar.gz,%,$@))
	mkdir -p $(dir $@)
	$(TAR) --dereference --hard-dereference -C $(OBJDIR)/$($@_TARGET)/install -c $(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$($@_TARGET) | gzip > $(abspath $@)

$(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-%.src.tar.gz: \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/install.stamp
	$(eval $@_TARGET := $(patsubst $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-%.src.tar.gz,%,$@))
	mkdir -p $(dir $@)
	$(TAR) --dereference --hard-dereference -C $(OBJDIR)/$($@_TARGET)/build -c $(PACKAGE_HEADING) | gzip > $(abspath $@)

.PHONY: cleanup
cleanup:
	rm -rf $(OBJ_NATIVE)/build/$(PACKAGE_HEADING)
	rm -rf $(OBJ_NATIVE)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(NATIVE)
	rm -rf $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(NATIVE).tar.gz
	rm -rf $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(NATIVE).src.tar.gz
	rm -rf $(OBJ_WIN64)/build/$(PACKAGE_HEADING)
	rm -rf $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64)
	rm -rf $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64).zip
	rm -rf $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64).src.zip
	rm -rf $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64).tar.gz
	rm -rf $(BINDIR)/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64).src.tar.gz
