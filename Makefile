# Setup the Freedom build script environment
include scripts/Freedom.mk

# Include version identifiers to build up the full version string
include Version.mk
PACKAGE_HEADING := freedom-qemu-system
PACKAGE_VERSION := $(RISCV_QEMU_VERSION)-$(FREEDOM_QEMU_SYSTEM_CODELINE)$(FREEDOM_QEMU_SYSTEM_GENERATION)b$(FREEDOM_QEMU_SYSTEM_BUILD)

# Source code directory references
SRCNAME_QEMU := riscv-qemu
SRCPATH_QEMU := $(SRCDIR)/$(SRCNAME_QEMU)

# Some special package configure flags for specific targets
$(WIN64)-rqemu-vars          := PKG_CONFIG_PATH="$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/lib/pkgconfig" CFLAGS="-L$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/lib -I$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/include" CPPFLAGS="-L$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/lib -I$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/include"
$(WIN64)-rqemu-host          := --host=$(WIN64)
$(WIN64)-rqemu-cross         := --cross-prefix=x86_64-w64-mingw32-
$(WIN64)-rqemu-bindir        := /bin
$(WIN64)-gettext-configure   := --enable-threads=windows
$(WIN64)-glib-vars           := PKG_CONFIG_PATH="$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/lib/pkgconfig" CFLAGS="-L$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/lib -I$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/include"
$(WIN64)-libpng-vars         := PKG_CONFIG_PATH="$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/lib/pkgconfig" CFLAGS="-L$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/lib -I$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/include" CPPFLAGS="-L$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/lib -I$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/include"
$(WIN64)-pixman-vars         := PKG_CONFIG_PATH="$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/lib/pkgconfig" CFLAGS="-L$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/lib -I$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/include" CPPFLAGS="-L$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/lib -I$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/include"
$(UBUNTU64)-rqemu-host       := --host=x86_64-linux-gnu
$(UBUNTU64)-gettext-configure:= --enable-threads=posix
$(UBUNTU64)-glib-vars        := PKG_CONFIG_PATH="$(abspath $(OBJ_UBUNTU64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64))/lib/pkgconfig" CFLAGS="-L$(abspath $(OBJ_UBUNTU64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64))/lib -I$(abspath $(OBJ_UBUNTU64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(UBUNTU64))/include"
$(DARWIN)-rqemu-vars         := PKG_CONFIG_PATH="$(abspath $(OBJ_DARWIN)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(DARWIN))/lib/pkgconfig" CFLAGS="-I$(abspath $(OBJ_DARWIN)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(DARWIN))/include" CPPFLAGS="-I$(abspath $(OBJ_DARWIN)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(DARWIN))/include" LDFLAGS="-L$(abspath $(OBJ_DARWIN)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(DARWIN))/lib -liconv -framework CoreFoundation -framework Carbon" PATH=/usr/local/opt/gettext/bin:$(PATH)
$(DARWIN)-gettext-configure  := --enable-threads=posix
$(DARWIN)-glib-configure     := --enable-static
$(DARWIN)-glib-vars          := PKG_CONFIG_PATH="$(abspath $(OBJ_DARWIN)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(DARWIN))/lib/pkgconfig" CFLAGS="-L$(abspath $(OBJ_DARWIN)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(DARWIN))/lib -I$(abspath $(OBJ_DARWIN)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(DARWIN))/include" PATH=/usr/local/opt/gettext/bin:$(PATH)
$(REDHAT)-rqemu-vars         := PKG_CONFIG_PATH="$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/lib/pkgconfig" CFLAGS="-fPIC -I$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/include -Wno-unused-result" CPPFLAGS="-fPIC -I$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/include" LDFLAGS="-L$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/lib -liconv" LIBS="-L$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/lib -liconv" SIFIVE_LIBS_QGA="-L$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/lib -liconv"
$(REDHAT)-zlib-configure     := -static
$(REDHAT)-gettext-configure  := --enable-threads=posix
$(REDHAT)-glib-configure     := --enable-static
$(REDHAT)-glib-vars          := PKG_CONFIG_PATH="$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/lib/pkgconfig" CFLAGS="-fPIC -L$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/lib -I$(abspath $(OBJ_REDHAT)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(REDHAT))/include"
$(REDHAT)-libpng-vars        := CFLAGS="-fPIC" CPPFLAGS="-fPIC"
$(REDHAT)-pixman-vars        := CFLAGS="-fPIC" CPPFLAGS="-fPIC"
$(REDHAT)-deps-vars          := CFLAGS="-fPIC"

# Setup the package targets and switch into secondary makefile targets
# Targets $(PACKAGE_HEADING)/install.stamp and $(PACKAGE_HEADING)/libs.stamp
include scripts/Package.mk

$(OBJDIR)/%/build/$(SRCNAME_QEMU)/install.stamp: \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/$(SRCNAME_QEMU)/build.stamp
	mkdir -p $(dir $@)
	date > $@

# We might need some extra target libraries for this package
$(OBJ_NATIVE)/build/$(SRCNAME_QEMU)/libs.stamp: \
		$(OBJ_NATIVE)/build/$(SRCNAME_QEMU)/install.stamp
	date > $@

$(OBJ_WIN64)/build/$(SRCNAME_QEMU)/libs.stamp: \
		$(OBJ_WIN64)/build/$(SRCNAME_QEMU)/install.stamp
	$(WIN64)-gcc -print-search-dirs | grep ^libraries | cut -d= -f2- | tr : "\n" | xargs -I {} find {} -iname "libgcc_s_seh*.dll" | xargs cp -t $(OBJDIR)/$(WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64)/bin
	$(WIN64)-gcc -print-search-dirs | grep ^libraries | cut -d= -f2- | tr : "\n" | xargs -I {} find {} -iname "libssp*.dll" | xargs cp -t $(OBJDIR)/$(WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64)/bin
	$(WIN64)-gcc -print-search-dirs | grep ^libraries | cut -d= -f2- | tr : "\n" | xargs -I {} find {} -iname "libwinpthread*.dll" | xargs cp -t $(OBJDIR)/$(WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64)/bin
	date > $@

$(OBJDIR)/%/build/$(PACKAGE_HEADING)/source.stamp:
	$(eval $@_TARGET := $(patsubst $(OBJDIR)/%/build/$(PACKAGE_HEADING)/source.stamp,%,$@))
	$(eval $@_INSTALL := $(patsubst %/build/$(PACKAGE_HEADING)/source.stamp,%/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$($@_TARGET),$@))
	rm -rf $($@_INSTALL)
	mkdir -p $($@_INSTALL)
	rm -rf $(dir $@)
	mkdir -p $(dir $@)
	cd $(dir $@); curl -L -f -s -o zlib-1.2.11.tar.gz http://zlib.net/fossils/zlib-1.2.11.tar.gz
	cd $(dir $@); $(TAR) -xf zlib-1.2.11.tar.gz
	cd $(dir $@); mv zlib-1.2.11 zlib
	cd $(dir $@); curl -L -f -s -o libffi-3.2.1.tar.gz http://mirrors.kernel.org/sourceware/libffi/libffi-3.2.1.tar.gz
	cd $(dir $@); $(TAR) -xf libffi-3.2.1.tar.gz
	cd $(dir $@); mv libffi-3.2.1 libffi
	cd $(dir $@); curl -L -f -s -o libiconv-1.15.tar.gz https://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.15.tar.gz
	cd $(dir $@); $(TAR) -xf libiconv-1.15.tar.gz
	cd $(dir $@); mv libiconv-1.15 libiconv
	cd $(dir $@); curl -L -f -s -o gettext-0.19.8.1.tar.gz https://ftp.gnu.org/pub/gnu/gettext/gettext-0.19.8.1.tar.gz
	cd $(dir $@); $(TAR) -xf gettext-0.19.8.1.tar.gz
	cd $(dir $@); mv gettext-0.19.8.1 gettext
	cd $(dir $@); curl -L -f -s -o glib-2.56.4.tar.xz http://ftp.acc.umu.se/pub/GNOME/sources/glib/2.56/glib-2.56.4.tar.xz
	cd $(dir $@); $(TAR) -xf glib-2.56.4.tar.xz
	cd $(dir $@); mv glib-2.56.4 glib
	cd $(dir $@); curl -L -f -s -o libpng-1.6.36.tar.gz https://sourceforge.net/projects/libpng/files/libpng16/1.6.36/libpng-1.6.36.tar.gz
	cd $(dir $@); $(TAR) -xf libpng-1.6.36.tar.gz
	cd $(dir $@); mv libpng-1.6.36 libpng
	cd $(dir $@); curl -L -f -s -o jpegsrc.v9b.tar.gz http://www.ijg.org/files/jpegsrc.v9b.tar.gz
	cd $(dir $@); $(TAR) -xf jpegsrc.v9b.tar.gz
	cd $(dir $@); mv jpeg-9b jpeg
	cd $(dir $@); curl -L -f -s -o pixman-0.38.0.tar.gz https://cairographics.org/releases/pixman-0.38.0.tar.gz
	cd $(dir $@); $(TAR) -xf pixman-0.38.0.tar.gz
	cd $(dir $@); mv pixman-0.38.0 pixman
	cp -a $(SRCPATH_QEMU) $(dir $@)
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
	$(SED) -i -f $(PATCHESDIR)/qemu-vl.sed $(dir $@)/$(SRCNAME_QEMU)/vl.c
	date > $@

$(OBJ_NATIVE)/build/$(PACKAGE_HEADING)/zlib/build.stamp: \
		$(OBJ_NATIVE)/build/$(PACKAGE_HEADING)/source.stamp
	cd $(dir $@) && $($(NATIVE)-deps-vars) ./configure \
		--prefix=$(abspath $(OBJ_NATIVE)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(NATIVE)) \
		$($(NATIVE)-zlib-configure) &>make-configure.log
	$(MAKE) -C $(dir $@) &>$(dir $@)/make-build.log
	$(MAKE) -C $(dir $@) -j1 install &>$(dir $@)/make-install.log
	date > $@

$(OBJ_WIN64)/build/$(PACKAGE_HEADING)/zlib/build.stamp: \
		$(OBJ_WIN64)/build/$(PACKAGE_HEADING)/source.stamp
	$(MAKE) -C $(dir $@) -f win32/Makefile.gcc PREFIX=$(WIN64)- prefix=$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/ &>$(dir $@)/make-build.log
	$(MAKE) -j1 -C $(dir $@) -f win32/Makefile.gcc SHARED_MODE=1 install DESTDIR=$(abspath $(OBJ_WIN64)/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$(WIN64))/ INCLUDE_PATH=include LIBRARY_PATH=lib BINARY_PATH=bin &>$(dir $@)/make-install.log
	date > $@

$(OBJDIR)/%/build/$(PACKAGE_HEADING)/libffi/build.stamp: \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/zlib/build.stamp \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/source.stamp
	$(eval $@_TARGET := $(patsubst $(OBJDIR)/%/build/$(PACKAGE_HEADING)/libffi/build.stamp,%,$@))
	$(eval $@_INSTALL := $(patsubst %/build/$(PACKAGE_HEADING)/libffi/build.stamp,%/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$($@_TARGET),$@))
	$(eval $@_BUILD := $(patsubst %/build/$(PACKAGE_HEADING)/libffi/build.stamp,%/build/$(PACKAGE_HEADING),$@))
	cd $(dir $@) && $($($@_TARGET)-deps-vars) ./configure \
		$($($@_TARGET)-rqemu-host) \
		--prefix=$(abspath $($@_INSTALL)) \
		--enable-static &>make-configure.log
	$(MAKE) -C $(dir $@) &>$(dir $@)/make-build.log
	$(MAKE) -C $(dir $@) -j1 install &>$(dir $@)/make-install.log
	date > $@

$(OBJDIR)/%/build/$(PACKAGE_HEADING)/libiconv/build.stamp: \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/libffi/build.stamp \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/source.stamp
	$(eval $@_TARGET := $(patsubst $(OBJDIR)/%/build/$(PACKAGE_HEADING)/libiconv/build.stamp,%,$@))
	$(eval $@_INSTALL := $(patsubst %/build/$(PACKAGE_HEADING)/libiconv/build.stamp,%/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$($@_TARGET),$@))
	$(eval $@_BUILD := $(patsubst %/build/$(PACKAGE_HEADING)/libiconv/build.stamp,%/build/$(PACKAGE_HEADING),$@))
	cd $(dir $@) && $($($@_TARGET)-deps-vars) ./configure \
		$($($@_TARGET)-rqemu-host) \
		--prefix=$(abspath $($@_INSTALL)) \
		--enable-static &>make-configure.log
	$(MAKE) -C $(dir $@) &>$(dir $@)/make-build.log
	$(MAKE) -C $(dir $@) -j1 install &>$(dir $@)/make-install.log
	date > $@

$(OBJDIR)/%/build/$(PACKAGE_HEADING)/gettext/build.stamp: \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/libiconv/build.stamp \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/source.stamp
	$(eval $@_TARGET := $(patsubst $(OBJDIR)/%/build/$(PACKAGE_HEADING)/gettext/build.stamp,%,$@))
	$(eval $@_INSTALL := $(patsubst %/build/$(PACKAGE_HEADING)/gettext/build.stamp,%/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$($@_TARGET),$@))
	$(eval $@_BUILD := $(patsubst %/build/$(PACKAGE_HEADING)/gettext/build.stamp,%/build/$(PACKAGE_HEADING),$@))
	cd $(dir $@) && $($($@_TARGET)-deps-vars) ./configure \
		$($($@_TARGET)-rqemu-host) \
		--prefix=$(abspath $($@_INSTALL)) \
		--enable-static \
		$($($@_TARGET)-gettext-configure) &>make-configure.log
	$(MAKE) -C $(dir $@) &>$(dir $@)/make-build.log
	$(MAKE) -C $(dir $@) -j1 install &>$(dir $@)/make-install.log
	date > $@

$(OBJDIR)/%/build/$(PACKAGE_HEADING)/glib/build.stamp: \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/gettext/build.stamp \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/source.stamp
	$(eval $@_TARGET := $(patsubst $(OBJDIR)/%/build/$(PACKAGE_HEADING)/glib/build.stamp,%,$@))
	$(eval $@_INSTALL := $(patsubst %/build/$(PACKAGE_HEADING)/glib/build.stamp,%/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$($@_TARGET),$@))
	$(eval $@_BUILD := $(patsubst %/build/$(PACKAGE_HEADING)/glib/build.stamp,%/build/$(PACKAGE_HEADING),$@))
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
		--disable-always-build-tests &>make-configure.log
	$(MAKE) -C $(dir $@) &>$(dir $@)/make-build.log
	$(MAKE) -C $(dir $@) -j1 install &>$(dir $@)/make-install.log
	rm -rf $(abspath $($@_INSTALL))/share/gdb
	date > $@

$(OBJDIR)/%/build/$(PACKAGE_HEADING)/libpng/build.stamp: \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/libffi/build.stamp \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/source.stamp
	$(eval $@_TARGET := $(patsubst $(OBJDIR)/%/build/$(PACKAGE_HEADING)/libpng/build.stamp,%,$@))
	$(eval $@_INSTALL := $(patsubst %/build/$(PACKAGE_HEADING)/libpng/build.stamp,%/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$($@_TARGET),$@))
	$(eval $@_BUILD := $(patsubst %/build/$(PACKAGE_HEADING)/libpng/build.stamp,%/build/$(PACKAGE_HEADING),$@))
	cd $(dir $@) && $($($@_TARGET)-libpng-vars) ./configure \
		$($($@_TARGET)-rqemu-host) \
		--prefix=$(abspath $($@_INSTALL)) \
		--enable-static &>make-configure.log
	$(MAKE) -C $(dir $@) &>$(dir $@)/make-build.log
	$(MAKE) -C $(dir $@) -j1 install &>$(dir $@)/make-install.log
	date > $@

$(OBJDIR)/%/build/$(PACKAGE_HEADING)/jpeg/build.stamp: \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/libpng/build.stamp \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/source.stamp
	$(eval $@_TARGET := $(patsubst $(OBJDIR)/%/build/$(PACKAGE_HEADING)/jpeg/build.stamp,%,$@))
	$(eval $@_INSTALL := $(patsubst %/build/$(PACKAGE_HEADING)/jpeg/build.stamp,%/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$($@_TARGET),$@))
	$(eval $@_BUILD := $(patsubst %/build/$(PACKAGE_HEADING)/jpeg/build.stamp,%/build/$(PACKAGE_HEADING),$@))
	cd $(dir $@) && $($($@_TARGET)-deps-vars) ./configure \
		$($($@_TARGET)-rqemu-host) \
		--prefix=$(abspath $($@_INSTALL)) \
		--enable-static &>make-configure.log
	$(MAKE) -C $(dir $@) &>$(dir $@)/make-build.log
	$(MAKE) -C $(dir $@) -j1 install &>$(dir $@)/make-install.log
	date > $@

$(OBJDIR)/%/build/$(PACKAGE_HEADING)/pixman/build.stamp: \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/jpeg/build.stamp \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/source.stamp
	$(eval $@_TARGET := $(patsubst $(OBJDIR)/%/build/$(PACKAGE_HEADING)/pixman/build.stamp,%,$@))
	$(eval $@_INSTALL := $(patsubst %/build/$(PACKAGE_HEADING)/pixman/build.stamp,%/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$($@_TARGET),$@))
	$(eval $@_BUILD := $(patsubst %/build/$(PACKAGE_HEADING)/pixman/build.stamp,%/build/$(PACKAGE_HEADING),$@))
	mkdir -p $(dir $@)/test/lib
	cd $(dir $@) && $($($@_TARGET)-pixman-vars) ./configure \
		$($($@_TARGET)-rqemu-host) \
		--prefix=$(abspath $($@_INSTALL)) \
		--enable-static \
		--with-gnu-ld \
		--disable-static-testprogs &>make-configure.log
	$(MAKE) -C $(dir $@) &>$(dir $@)/make-build.log
	$(MAKE) -C $(dir $@) -j1 install &>$(dir $@)/make-install.log
	date > $@

$(OBJDIR)/%/build/$(PACKAGE_HEADING)/$(SRCNAME_QEMU)/build.stamp: \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/glib/build.stamp \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/pixman/build.stamp \
		$(OBJDIR)/%/build/$(PACKAGE_HEADING)/source.stamp
	$(eval $@_TARGET := $(patsubst $(OBJDIR)/%/build/$(PACKAGE_HEADING)/$(SRCNAME_QEMU)/build.stamp,%,$@))
	$(eval $@_INSTALL := $(patsubst %/build/$(PACKAGE_HEADING)/$(SRCNAME_QEMU)/build.stamp,%/install/$(PACKAGE_HEADING)-$(PACKAGE_VERSION)-$($@_TARGET),$@))
	$(eval $@_BUILD := $(patsubst %/build/$(PACKAGE_HEADING)/$(SRCNAME_QEMU)/build.stamp,%/build/$(PACKAGE_HEADING),$@))
	rm -f $(abspath $($@_INSTALL))/lib/lib*.dylib*
	rm -f $(abspath $($@_INSTALL))/lib/lib*.so*
	rm -f $(abspath $($@_INSTALL))/lib64/lib*.so*
	cd $(dir $@) && $($($@_TARGET)-rqemu-vars) ./configure \
		$($($@_TARGET)-rqemu-cross) \
		--prefix=$(abspath $($@_INSTALL))$($($@_TARGET)-rqemu-bindir) \
		--with-pkgversion="SiFive QEMU $(PACKAGE_VERSION)" \
		--target-list=riscv32-softmmu,riscv64-softmmu \
		--interp-prefix=$(abspath $($@_INSTALL))/sysroot \
		--disable-libusb \
		--disable-vhost-user \
		--disable-vhost-kernel &>make-configure.log
	$($($@_TARGET)-rqemu-vars) $(MAKE) -C $(dir $@) -j1 install &>$(dir $@)/make-install.log
	date > $@