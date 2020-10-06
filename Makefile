# Setup the Freedom build script environment
include scripts/Freedom.mk

# Include version identifiers to build up the full version string
include Version.mk
PACKAGE_HEADING := riscv-qemu
PACKAGE_VERSION := $(RISCV_QEMU_VERSION)-$(FREEDOM_QEMU_ID)$(EXTRA_SUFFIX)

# Source code directory references
SRCNAME_QEMU := riscv-qemu
SRCPATH_QEMU := $(SRCDIR)/$(SRCNAME_QEMU)

# Some special package configure flags for specific targets
$(WIN64)-rqemu-vars          := PKG_CONFIG_PATH="$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/lib/pkgconfig" CFLAGS="-L$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/lib -I$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/include" CPPFLAGS="-L$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/lib -I$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/include"
$(WIN64)-rqemu-vars-ext      := PKG_CONFIG_PATH="$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/lib/pkgconfig" CFLAGS="-L$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/lib -I$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/include" CPPFLAGS="-L$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/lib -I$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/include"
$(WIN64)-rqemu-host          := --host=$(WIN64)
$(WIN64)-rqemu-cross         := --cross-prefix=x86_64-w64-mingw32-
$(WIN64)-rqemu-bindir        := /bin
$(WIN64)-gettext-configure   := --enable-threads=windows
$(WIN64)-glib-vars           := PKG_CONFIG_PATH="$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/lib/pkgconfig" CFLAGS="-L$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/lib -I$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/include"
$(WIN64)-pixman-vars         := PKG_CONFIG_PATH="$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/lib/pkgconfig" CFLAGS="-L$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/lib -I$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/include" CPPFLAGS="-L$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/lib -I$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/include"
$(UBUNTU64)-rqemu-vars       := PKG_CONFIG_LIBDIR="$(abspath $(OBJ_UBUNTU64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64))/lib/pkgconfig" CFLAGS="-fPIC -I$(abspath $(OBJ_UBUNTU64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64))/include -Wno-unused-result" CPPFLAGS="-fPIC -I$(abspath $(OBJ_UBUNTU64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64))/include" QEMU_LDFLAGS="-L$(abspath $(OBJ_UBUNTU64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64))/lib -L$(abspath $(OBJ_UBUNTU64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64))/lib64" LIBS="-L$(abspath $(OBJ_UBUNTU64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64))/lib -L$(abspath $(OBJ_UBUNTU64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64))/lib64 -liconv" SIFIVE_LIBS_QGA="-L$(abspath $(OBJ_UBUNTU64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64))/lib -L$(abspath $(OBJ_UBUNTU64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64))/lib64 -liconv"
$(UBUNTU64)-rqemu-vars-ext   := PKG_CONFIG_LIBDIR="$(abspath $(OBJ_UBUNTU64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64))/lib/pkgconfig" CFLAGS="-fPIC -I$(abspath $(OBJ_UBUNTU64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64))/include -Wno-unused-result" CPPFLAGS="-fPIC -I$(abspath $(OBJ_UBUNTU64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64))/include" QEMU_LDFLAGS="-L$(abspath $(OBJ_UBUNTU64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64))/lib -L$(abspath $(OBJ_UBUNTU64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64))/lib64" LIBS="-L$(abspath $(OBJ_UBUNTU64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64))/lib -L$(abspath $(OBJ_UBUNTU64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64))/lib64 -lgmodule-2.0 -lffi -liconv -lresolv -ldl" SIFIVE_LIBS_QGA="-L$(abspath $(OBJ_UBUNTU64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64))/lib -L$(abspath $(OBJ_UBUNTU64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64))/lib64 -liconv"
$(UBUNTU64)-rqemu-host       := --host=x86_64-linux-gnu
$(UBUNTU64)-zlib-configure   := -static
$(UBUNTU64)-gettext-configure:= --enable-threads=posix
$(UBUNTU64)-glib-configure   := --enable-static
$(UBUNTU64)-glib-vars        := PKG_CONFIG_PATH="$(abspath $(OBJ_UBUNTU64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64))/lib/pkgconfig" CFLAGS="-fPIC -L$(abspath $(OBJ_UBUNTU64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64))/lib -I$(abspath $(OBJ_UBUNTU64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64))/include"
$(UBUNTU64)-pixman-vars      := CFLAGS="-fPIC" CPPFLAGS="-fPIC"
$(UBUNTU64)-deps-vars        := CFLAGS="-fPIC"
$(DARWIN)-rqemu-vars         := PKG_CONFIG_PATH="$(abspath $(OBJ_DARWIN)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(DARWIN))/lib/pkgconfig" CFLAGS="-I$(abspath $(OBJ_DARWIN)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(DARWIN))/include" CPPFLAGS="-I$(abspath $(OBJ_DARWIN)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(DARWIN))/include" QEMU_LDFLAGS="-L$(abspath $(OBJ_DARWIN)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(DARWIN))/lib" LIBS="-liconv -framework CoreFoundation -framework Carbon" SIFIVE_LIBS_QGA="-L$(abspath $(OBJ_DARWIN)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(DARWIN))/lib -liconv -framework CoreFoundation -framework Carbon" PATH=/usr/local/opt/gettext/bin:$(PATH)
$(DARWIN)-rqemu-vars-ext     := PKG_CONFIG_PATH="$(abspath $(OBJ_DARWIN)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(DARWIN))/lib/pkgconfig" CFLAGS="-I$(abspath $(OBJ_DARWIN)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(DARWIN))/include" CPPFLAGS="-I$(abspath $(OBJ_DARWIN)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(DARWIN))/include" QEMU_LDFLAGS="-L$(abspath $(OBJ_DARWIN)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(DARWIN))/lib" LIBS="-lgmodule-2.0 -lffi -liconv -lresolv -framework CoreFoundation -framework Carbon" SIFIVE_LIBS_QGA="-L$(abspath $(OBJ_DARWIN)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(DARWIN))/lib -liconv -framework CoreFoundation -framework Carbon" PATH=/usr/local/opt/gettext/bin:$(PATH)
$(DARWIN)-gettext-configure  := --enable-threads=posix
$(DARWIN)-glib-configure     := --enable-static
$(DARWIN)-glib-vars          := PKG_CONFIG_PATH="$(abspath $(OBJ_DARWIN)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(DARWIN))/lib/pkgconfig" CFLAGS="-L$(abspath $(OBJ_DARWIN)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(DARWIN))/lib -I$(abspath $(OBJ_DARWIN)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(DARWIN))/include" PATH=/usr/local/opt/gettext/bin:$(PATH)
$(REDHAT)-rqemu-vars         := PKG_CONFIG_LIBDIR="$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/lib/pkgconfig" CFLAGS="-fPIC -I$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/include -Wno-unused-result" CPPFLAGS="-fPIC -I$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/include" QEMU_LDFLAGS="-L$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/lib -L$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/lib64" LIBS="-L$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/lib -L$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/lib64 -liconv" SIFIVE_LIBS_QGA="-L$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/lib -L$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/lib64 -liconv"
$(REDHAT)-rqemu-vars-ext     := PKG_CONFIG_LIBDIR="$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/lib/pkgconfig" CFLAGS="-fPIC -I$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/include -Wno-unused-result" CPPFLAGS="-fPIC -I$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/include" QEMU_LDFLAGS="-L$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/lib -L$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/lib64" LIBS="-L$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/lib -L$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/lib64 -lgmodule-2.0 -lffi -liconv -lresolv -ldl" SIFIVE_LIBS_QGA="-L$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/lib -L$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/lib64 -liconv"
$(REDHAT)-zlib-configure     := -static
$(REDHAT)-gettext-configure  := --enable-threads=posix
$(REDHAT)-glib-configure     := --enable-static
$(REDHAT)-glib-vars          := PKG_CONFIG_PATH="$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/lib/pkgconfig" CFLAGS="-fPIC -L$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/lib -I$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/include"
$(REDHAT)-pixman-vars        := CFLAGS="-fPIC" CPPFLAGS="-fPIC"
$(REDHAT)-deps-vars          := CFLAGS="-fPIC"

# Setup the package targets and switch into secondary makefile targets
# Targets $(PACKAGE_HEADING)/install.stamp and $(PACKAGE_HEADING)/libs.stamp
include scripts/Package.mk

$(OBJDIR)/%/build/$(PACKAGE_HEADING)/install.stamp: \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/$(SRCNAME_QEMU)/build.stamp
	$(eval $@_TARGET := $(patsubst $(OBJDIR)/%/build/$(PACKAGE_HEADING)/install.stamp,%,$@))
	$(eval $@_INSTALL := $(patsubst %/build/$(PACKAGE_HEADING)/install.stamp,%/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$($@_TARGET),$@))
	mkdir -p $(dir $@)
	git log > $(abspath $($@_INSTALL))/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$($@_TARGET).commitlog
	cp README.md $(abspath $($@_INSTALL))/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$($@_TARGET).readme.md
	date > $@

# We might need some extra target libraries for this package
$(OBJ_NATIVE)/build/$(PACKAGE_HEADING)/libs.stamp: \
		$(OBJ_NATIVE)/build/$(PACKAGE_HEADING)/install.stamp
	date > $@

$(OBJ_WIN64)/build/$(PACKAGE_HEADING)/libs.stamp: \
		$(OBJ_WIN64)/build/$(PACKAGE_HEADING)/install.stamp
	$(WIN64)-gcc -print-search-dirs | grep ^libraries | cut -d= -f2- | tr : "\n" | xargs -I {} find {} -iname "libwinpthread*.dll" | xargs cp -t $(OBJDIR)/$(WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64)/bin
	$(WIN64)-gcc -print-search-dirs | grep ^libraries | cut -d= -f2- | tr : "\n" | xargs -I {} find {} -iname "libgcc_s_seh*.dll" | xargs cp -t $(OBJDIR)/$(WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64)/bin
	$(WIN64)-gcc -print-search-dirs | grep ^libraries | cut -d= -f2- | tr : "\n" | xargs -I {} find {} -iname "libstdc*.dll" | xargs cp -t $(OBJDIR)/$(WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64)/bin
	$(WIN64)-gcc -print-search-dirs | grep ^libraries | cut -d= -f2- | tr : "\n" | xargs -I {} find {} -iname "libssp*.dll" | xargs cp -t $(OBJDIR)/$(WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64)/bin
	date > $@

$(OBJDIR)/%/build/$(PACKAGE_HEADING)/source.stamp:
	$(eval $@_TARGET := $(patsubst $(OBJDIR)/%/build/$(PACKAGE_HEADING)/source.stamp,%,$@))
	$(eval $@_INSTALL := $(patsubst %/build/$(PACKAGE_HEADING)/source.stamp,%/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$($@_TARGET),$@))
	$(eval $@_REC := $(abspath $(patsubst %/build/$(PACKAGE_HEADING)/source.stamp,%/rec/$(PACKAGE_HEADING),$@)))
	rm -rf $($@_INSTALL)
	mkdir -p $($@_INSTALL)
	rm -rf $($@_REC)
	mkdir -p $($@_REC)
	rm -rf $(dir $@)
	mkdir -p $(dir $@)
	cd $($@_REC); curl -L -f -s -o zlib-1.2.11.tar.gz http://zlib.net/fossils/zlib-1.2.11.tar.gz
	cd $(dir $@); $(TAR) -xf $($@_REC)/zlib-1.2.11.tar.gz
	cd $(dir $@); mv zlib-1.2.11 zlib
	cd $($@_REC); curl -L -f -s -o libffi-3.2.1.tar.gz http://mirrors.kernel.org/sourceware/libffi/libffi-3.2.1.tar.gz
	cd $(dir $@); $(TAR) -xf $($@_REC)/libffi-3.2.1.tar.gz
	cd $(dir $@); mv libffi-3.2.1 libffi
	cd $($@_REC); curl -L -f -s -o libiconv-1.15.tar.gz https://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.15.tar.gz
	cd $(dir $@); $(TAR) -xf $($@_REC)/libiconv-1.15.tar.gz
	cd $(dir $@); mv libiconv-1.15 libiconv
	cd $($@_REC); curl -L -f -s -o gettext-0.19.8.1.tar.gz https://ftp.gnu.org/pub/gnu/gettext/gettext-0.19.8.1.tar.gz
	cd $(dir $@); $(TAR) -xf $($@_REC)/gettext-0.19.8.1.tar.gz
	cd $(dir $@); mv gettext-0.19.8.1 gettext
	cd $($@_REC); curl -L -f -s -o glib-2.56.4.tar.xz http://ftp.acc.umu.se/pub/GNOME/sources/glib/2.56/glib-2.56.4.tar.xz
	cd $(dir $@); $(TAR) -xf $($@_REC)/glib-2.56.4.tar.xz
	cd $(dir $@); mv glib-2.56.4 glib
	cd $($@_REC); curl -L -f -s -o pixman-0.38.0.tar.gz https://cairographics.org/releases/pixman-0.38.0.tar.gz
	cd $(dir $@); $(TAR) -xf $($@_REC)/pixman-0.38.0.tar.gz
	cd $(dir $@); mv pixman-0.38.0 pixman
	cp -a $(SRCPATH_QEMU) $(dir $@)
	rm -rf $(dir $@)/$(SRCNAME_QEMU)/target/riscv/cpu.c
	cp -a $(PATCHESDIR)/qemu-riscv-cpu.c $(dir $@)/$(SRCNAME_QEMU)/target/riscv/cpu.c
	rm -rf $(dir $@)/$(SRCNAME_QEMU)/target/riscv/cpu.h
	cp -a $(PATCHESDIR)/qemu-riscv-cpu.h $(dir $@)/$(SRCNAME_QEMU)/target/riscv/cpu.h
	rm -rf $(dir $@)/$(SRCNAME_QEMU)/hw/riscv/sifive_e.c
	cp -a $(PATCHESDIR)/qemu-sifive-e.c $(dir $@)/$(SRCNAME_QEMU)/hw/riscv/sifive_e.c
	rm -rf $(dir $@)/$(SRCNAME_QEMU)/hw/riscv/sifive_test.c
	cp -a $(PATCHESDIR)/qemu-sifive-test.c $(dir $@)/$(SRCNAME_QEMU)/hw/riscv/sifive_test.c
	rm -rf $(dir $@)/$(SRCNAME_QEMU)/hw/riscv/sifive_u.c
	cp -a $(PATCHESDIR)/qemu-sifive-u.c $(dir $@)/$(SRCNAME_QEMU)/hw/riscv/sifive_u.c
	rm -rf $(dir $@)/$(SRCNAME_QEMU)/include/hw/riscv/sifive_e.h
	cp -a $(PATCHESDIR)/qemu-sifive-e.h $(dir $@)/$(SRCNAME_QEMU)/include/hw/riscv/sifive_e.h
	rm -rf $(dir $@)/$(SRCNAME_QEMU)/include/hw/riscv/sifive_u.h
	cp -a $(PATCHESDIR)/qemu-sifive-u.h $(dir $@)/$(SRCNAME_QEMU)/include/hw/riscv/sifive_u.h
	$(SED) -i -f $(PATCHESDIR)/qemu-configure.sed $(dir $@)/$(SRCNAME_QEMU)/configure
	$(SED) -i -f $(PATCHESDIR)/qemu-common.sed $(dir $@)/$(SRCNAME_QEMU)/include/qemu-common.h
	$(SED) -i -f $(PATCHESDIR)/qemu-vl.sed $(dir $@)/$(SRCNAME_QEMU)/softmmu/vl.c
	date > $@

$(OBJ_NATIVE)/build/$(PACKAGE_HEADING)/zlib/build.stamp: \
		$(OBJ_NATIVE)/build/$(PACKAGE_HEADING)/source.stamp
	$(eval $@_REC := $(abspath $(patsubst %/build/$(PACKAGE_HEADING)/zlib/build.stamp,%/rec/$(PACKAGE_HEADING),$@)))
	cd $(dir $@) && $($(NATIVE)-deps-vars) ./configure \
		--prefix=$(abspath $(OBJ_NATIVE)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(NATIVE)) \
		$($(NATIVE)-zlib-configure) &>$($@_REC)/zlib-make-configure.log
	$(MAKE) -C $(dir $@) &>$($@_REC)/zlib-make-build.log
	$(MAKE) -C $(dir $@) -j1 install &>$($@_REC)/zlib-make-install.log
	date > $@

$(OBJ_WIN64)/build/$(PACKAGE_HEADING)/zlib/build.stamp: \
		$(OBJ_WIN64)/build/$(PACKAGE_HEADING)/source.stamp
	$(eval $@_REC := $(abspath $(patsubst %/build/$(PACKAGE_HEADING)/zlib/build.stamp,%/rec/$(PACKAGE_HEADING),$@)))
	$(MAKE) -C $(dir $@) -f win32/Makefile.gcc PREFIX=$(WIN64)- prefix=$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/ &>$($@_REC)/zlib-make-build.log
	$(MAKE) -j1 -C $(dir $@) -f win32/Makefile.gcc SHARED_MODE=1 install DESTDIR=$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/ INCLUDE_PATH=include LIBRARY_PATH=lib BINARY_PATH=bin &>$($@_REC)/zlib-make-install.log
	date > $@

$(OBJDIR)/%/build/$(PACKAGE_HEADING)/libffi/build.stamp: \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/zlib/build.stamp \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/source.stamp
	$(eval $@_TARGET := $(patsubst $(OBJDIR)/%/build/$(PACKAGE_HEADING)/libffi/build.stamp,%,$@))
	$(eval $@_INSTALL := $(patsubst %/build/$(PACKAGE_HEADING)/libffi/build.stamp,%/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$($@_TARGET),$@))
	$(eval $@_BUILD := $(patsubst %/build/$(PACKAGE_HEADING)/libffi/build.stamp,%/build/$(PACKAGE_HEADING),$@))
	$(eval $@_REC := $(abspath $(patsubst %/build/$(PACKAGE_HEADING)/libffi/build.stamp,%/rec/$(PACKAGE_HEADING),$@)))
	cd $(dir $@) && $($($@_TARGET)-deps-vars) ./configure \
		$($($@_TARGET)-rqemu-host) \
		--prefix=$(abspath $($@_INSTALL)) \
		--enable-static &>$($@_REC)/libffi-make-configure.log
	$(MAKE) -C $(dir $@) &>$($@_REC)/libffi-make-build.log
	$(MAKE) -C $(dir $@) -j1 install &>$($@_REC)/libffi-make-install.log
	date > $@

$(OBJDIR)/%/build/$(PACKAGE_HEADING)/libiconv/build.stamp: \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/libffi/build.stamp \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/source.stamp
	$(eval $@_TARGET := $(patsubst $(OBJDIR)/%/build/$(PACKAGE_HEADING)/libiconv/build.stamp,%,$@))
	$(eval $@_INSTALL := $(patsubst %/build/$(PACKAGE_HEADING)/libiconv/build.stamp,%/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$($@_TARGET),$@))
	$(eval $@_BUILD := $(patsubst %/build/$(PACKAGE_HEADING)/libiconv/build.stamp,%/build/$(PACKAGE_HEADING),$@))
	$(eval $@_REC := $(abspath $(patsubst %/build/$(PACKAGE_HEADING)/libiconv/build.stamp,%/rec/$(PACKAGE_HEADING),$@)))
	cd $(dir $@) && $($($@_TARGET)-deps-vars) ./configure \
		$($($@_TARGET)-rqemu-host) \
		--prefix=$(abspath $($@_INSTALL)) \
		--enable-static &>$($@_REC)/libiconv-make-configure.log
	$(MAKE) -C $(dir $@) &>$($@_REC)/libiconv-make-build.log
	$(MAKE) -C $(dir $@) -j1 install &>$($@_REC)/libiconv-make-install.log
	date > $@

$(OBJDIR)/%/build/$(PACKAGE_HEADING)/gettext/build.stamp: \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/libiconv/build.stamp \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/source.stamp
	$(eval $@_TARGET := $(patsubst $(OBJDIR)/%/build/$(PACKAGE_HEADING)/gettext/build.stamp,%,$@))
	$(eval $@_INSTALL := $(patsubst %/build/$(PACKAGE_HEADING)/gettext/build.stamp,%/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$($@_TARGET),$@))
	$(eval $@_BUILD := $(patsubst %/build/$(PACKAGE_HEADING)/gettext/build.stamp,%/build/$(PACKAGE_HEADING),$@))
	$(eval $@_REC := $(abspath $(patsubst %/build/$(PACKAGE_HEADING)/gettext/build.stamp,%/rec/$(PACKAGE_HEADING),$@)))
	cd $(dir $@) && $($($@_TARGET)-deps-vars) ./configure \
		$($($@_TARGET)-rqemu-host) \
		--prefix=$(abspath $($@_INSTALL)) \
		--enable-static \
		$($($@_TARGET)-gettext-configure) &>$($@_REC)/gettext-make-configure.log
	$(MAKE) -C $(dir $@) &>$($@_REC)/gettext-make-build.log
	$(MAKE) -C $(dir $@) -j1 install &>$($@_REC)/gettext-make-install.log
	date > $@

$(OBJDIR)/%/build/$(PACKAGE_HEADING)/glib/build.stamp: \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/gettext/build.stamp \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/source.stamp
	$(eval $@_TARGET := $(patsubst $(OBJDIR)/%/build/$(PACKAGE_HEADING)/glib/build.stamp,%,$@))
	$(eval $@_INSTALL := $(patsubst %/build/$(PACKAGE_HEADING)/glib/build.stamp,%/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$($@_TARGET),$@))
	$(eval $@_BUILD := $(patsubst %/build/$(PACKAGE_HEADING)/glib/build.stamp,%/build/$(PACKAGE_HEADING),$@))
	$(eval $@_REC := $(abspath $(patsubst %/build/$(PACKAGE_HEADING)/glib/build.stamp,%/rec/$(PACKAGE_HEADING),$@)))
	mkdir -p $(dir $@)/gio/lib
	cd $(dir $@) && $($($@_TARGET)-glib-vars) ./configure \
		$($($@_TARGET)-rqemu-host) \
		--prefix=$(abspath $($@_INSTALL)) \
		$($($@_TARGET)-glib-configure) \
		--with-libiconv=gnu \
		--without-pcre \
		--disable-selinux \
		--disable-fam \
		--disable-xattr \
		--disable-libelf \
		--disable-libmount \
		--disable-dtrace \
		--disable-systemtap \
		--disable-coverage \
		--disable-Bsymbolic \
		--disable-znodelete \
		--disable-compile-warnings \
		--disable-installed-tests \
		--disable-always-build-tests &>$($@_REC)/glib-make-configure.log
	$(MAKE) -C $(dir $@) &>$($@_REC)/glib-make-build.log
	$(MAKE) -C $(dir $@) -j1 install &>$($@_REC)/glib-make-install.log
	rm -rf $(abspath $($@_INSTALL))/share/gdb
	date > $@

$(OBJDIR)/%/build/$(PACKAGE_HEADING)/pixman/build.stamp: \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/libffi/build.stamp \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/source.stamp
	$(eval $@_TARGET := $(patsubst $(OBJDIR)/%/build/$(PACKAGE_HEADING)/pixman/build.stamp,%,$@))
	$(eval $@_INSTALL := $(patsubst %/build/$(PACKAGE_HEADING)/pixman/build.stamp,%/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$($@_TARGET),$@))
	$(eval $@_BUILD := $(patsubst %/build/$(PACKAGE_HEADING)/pixman/build.stamp,%/build/$(PACKAGE_HEADING),$@))
	$(eval $@_REC := $(abspath $(patsubst %/build/$(PACKAGE_HEADING)/pixman/build.stamp,%/rec/$(PACKAGE_HEADING),$@)))
	mkdir -p $(dir $@)/test/lib
	cd $(dir $@) && $($($@_TARGET)-pixman-vars) ./configure \
		$($($@_TARGET)-rqemu-host) \
		--prefix=$(abspath $($@_INSTALL)) \
		--enable-static \
		--with-gnu-ld \
		--disable-static-testprogs &>$($@_REC)/pixman-make-configure.log
	$(MAKE) -C $(dir $@) &>$($@_REC)/pixman-make-build.log
	$(MAKE) -C $(dir $@) -j1 install &>$($@_REC)/pixman-make-install.log
	date > $@

$(OBJDIR)/%/build/$(PACKAGE_HEADING)/$(SRCNAME_QEMU)/build.stamp: \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/glib/build.stamp \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/pixman/build.stamp \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/source.stamp
	$(eval $@_TARGET := $(patsubst $(OBJDIR)/%/build/$(PACKAGE_HEADING)/$(SRCNAME_QEMU)/build.stamp,%,$@))
	$(eval $@_INSTALL := $(patsubst %/build/$(PACKAGE_HEADING)/$(SRCNAME_QEMU)/build.stamp,%/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$($@_TARGET),$@))
	$(eval $@_BUILD := $(patsubst %/build/$(PACKAGE_HEADING)/$(SRCNAME_QEMU)/build.stamp,%/build/$(PACKAGE_HEADING),$@))
	$(eval $@_REC := $(abspath $(patsubst %/build/$(PACKAGE_HEADING)/$(SRCNAME_QEMU)/build.stamp,%/rec/$(PACKAGE_HEADING),$@)))
	rm -f $(abspath $($@_INSTALL))/lib/lib*.dylib*
	rm -f $(abspath $($@_INSTALL))/lib/lib*.so*
	rm -f $(abspath $($@_INSTALL))/lib64/lib*.so*
	cd $(dir $@) && $($($@_TARGET)-rqemu-vars) ./configure \
		$($($@_TARGET)-rqemu-cross) \
		--prefix=$(abspath $($@_INSTALL))$($($@_TARGET)-rqemu-bindir) \
		--with-pkgversion="SiFive QEMU $(PACKAGE_VERSION)" \
		--target-list=riscv32-softmmu,riscv64-softmmu \
		--interp-prefix=$(abspath $($@_INSTALL))/sysroot \
		--disable-docs \
		--disable-modules \
		--disable-module-upgrades \
		--disable-sparse \
		--disable-safe-stack \
		--disable-gnutls \
		--disable-nettle \
		--disable-gcrypt \
		--disable-auth-pam \
		--disable-sdl \
		--disable-sdl-image \
		--disable-gtk \
		--disable-vte \
		--disable-vnc-sasl \
		--disable-vnc-jpeg \
		--disable-vnc-png \
		--disable-virtfs \
		--disable-mpath \
		--disable-xen \
		--disable-xen-pci-passthrough \
		--disable-brlapi \
		--disable-curl \
		--disable-membarrier \
		--disable-rdma \
		--disable-pvrdma \
		--disable-vde \
		--disable-netmap \
		--disable-linux-aio \
		--disable-linux-io-uring \
		--disable-cap-ng \
		--disable-vhost-kernel \
		--disable-vhost-user \
		--disable-vhost-vdpa \
		--disable-spice \
		--disable-rbd \
		--disable-libiscsi \
		--disable-libnfs \
		--disable-smartcard \
		--disable-libusb \
		--disable-usb-redir \
		--disable-lzo \
		--disable-snappy \
		--disable-bzip2 \
		--disable-lzfse \
		--disable-zstd \
		--disable-seccomp \
		--disable-glusterfs \
		--disable-tpm \
		--disable-libssh \
		--disable-numa \
		--disable-libxml2 \
		--disable-tcmalloc \
		--disable-jemalloc \
		--disable-avx2 \
		--disable-avx512f \
		--disable-opengl \
		--disable-virglrenderer \
		--disable-xfsctl \
		--disable-crypto-afalg \
		--disable-debug-mutex \
		--disable-libpmem \
		--disable-libdaxctl \
		--disable-curses \
		--disable-iconv \
		--enable-vnc \
		--enable-bochs \
		--enable-cloop \
		--enable-dmg \
		--enable-qcow1 \
		--enable-vdi \
		--enable-vvfat \
		--enable-qed \
		--enable-parallels \
		--enable-sheepdog \
		--enable-rng-none \
		&>$($@_REC)/$(SRCNAME_QEMU)-make-configure.log
	$($($@_TARGET)-rqemu-vars-ext) $(MAKE) -C $(dir $@) -j1 install &>$($@_REC)/$(SRCNAME_QEMU)-make-install.log
	tclsh scripts/dyn-lib-check-$($@_TARGET).tcl $(abspath $($@_INSTALL))/bin/qemu-edid
	tclsh scripts/dyn-lib-check-$($@_TARGET).tcl $(abspath $($@_INSTALL))/bin/qemu-ga
	tclsh scripts/dyn-lib-check-$($@_TARGET).tcl $(abspath $($@_INSTALL))/bin/qemu-img
	tclsh scripts/dyn-lib-check-$($@_TARGET).tcl $(abspath $($@_INSTALL))/bin/qemu-io
	tclsh scripts/dyn-lib-check-$($@_TARGET).tcl $(abspath $($@_INSTALL))/bin/qemu-nbd
	tclsh scripts/dyn-lib-check-$($@_TARGET).tcl $(abspath $($@_INSTALL))/bin/qemu-storage-daemon
	tclsh scripts/dyn-lib-check-$($@_TARGET).tcl $(abspath $($@_INSTALL))/bin/qemu-system-riscv32
	tclsh scripts/dyn-lib-check-$($@_TARGET).tcl $(abspath $($@_INSTALL))/bin/qemu-system-riscv64
	date > $@

$(OBJDIR)/$(NATIVE)/test/$(PACKAGE_HEADING)/test.stamp: \
		$(OBJDIR)/$(NATIVE)/test/$(PACKAGE_HEADING)/launch.stamp
	mkdir -p $(dir $@)
	PATH=$(abspath $(OBJDIR)/$(NATIVE)/launch/$(PACKAGE_TARNAME)/bin):$(PATH) qemu-system-riscv32 -version
	PATH=$(abspath $(OBJDIR)/$(NATIVE)/launch/$(PACKAGE_TARNAME)/bin):$(PATH) qemu-system-riscv64 -version
	@echo "Finished testing $(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(NATIVE).tar.gz tarball"
	date > $@
