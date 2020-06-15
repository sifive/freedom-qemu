# The default target
.PHONY: all
all:
	@echo " Makefile targets: package cleanup clean help all"

.PHONY: help
help:
	@echo ""
	@echo " SiFive Freedom Tools - Makefile targets:"
	@echo ""
	@echo " package"
	@echo "   Build the binary packages for this repo."
	@echo ""
	@echo " regress"
	@echo "   Test the prebuilt packages for this repo."
	@echo ""
	@echo " cleanup"
	@echo "   Clean the build artifacts for this repo."
	@echo ""
	@echo " clean"
	@echo "   Remove the bin and obj directories."
	@echo ""
	@echo " help"
	@echo "   Show this help."
	@echo ""
	@echo " all"
	@echo "   Show Makefile targets."
	@echo ""

.PHONY: package
package:

.PHONY: regress
regress:

# Make uses /bin/sh by default, ignoring the user's value of SHELL.
# Some systems now ship with /bin/sh pointing at dash, and this Makefile
# requires bash
SHELL = /bin/bash

POSTFIXPATH ?=
PREFIXPATH ?=
BINDIR := $(POSTFIXPATH)bin
OBJDIR := $(POSTFIXPATH)obj
SRCDIR := $(PREFIXPATH)src
RECDIR := $(PREFIXPATH)rec
SCRIPTSDIR := $(PREFIXPATH)scripts
PATCHESDIR := $(PREFIXPATH)patches

UBUNTU64 ?= x86_64-linux-ubuntu14
REDHAT ?= x86_64-linux-centos6
WIN64  ?= x86_64-w64-mingw32
DARWIN ?= x86_64-apple-darwin

-include /etc/lsb-release
ifneq ($(wildcard /etc/redhat-release),)
NATIVE ?= $(REDHAT)
NINJA ?= ninja-build
package: redhat-package
regress: native-regress
else ifeq ($(DISTRIB_ID),Ubuntu)
NATIVE ?= $(UBUNTU64)
package: ubuntu64-package
package: win64-package
regress: native-regress
else ifeq ($(shell uname),Darwin)
NATIVE ?= $(DARWIN)
LIBTOOLIZE ?= glibtoolize
TAR ?= gtar
SED ?= gsed
AWK ?= gawk
package: darwin-package
regress: native-regress
else ifneq ($(wildcard /mingw64/etc),)
NATIVE ?= $(WIN64)
regress: native-regress
else
$(error Unknown host)
endif

LIBTOOLIZE ?= libtoolize
TAR ?= tar
SED ?= sed
AWK ?= awk
NINJA ?= ninja

OBJ_NATIVE   := $(OBJDIR)/$(NATIVE)
OBJ_UBUNTU64 := $(OBJDIR)/$(UBUNTU64)
OBJ_WIN64    := $(OBJDIR)/$(WIN64)
OBJ_DARWIN   := $(OBJDIR)/$(DARWIN)
OBJ_REDHAT   := $(OBJDIR)/$(REDHAT)

# Targets that don't build anything
.PHONY: clean
clean::
	rm -rf $(RECDIR)* $(OBJDIR) $(BINDIR)
