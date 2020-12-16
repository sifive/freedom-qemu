#!/usr/bin/tclsh

set PACKAGE_WORDING [lindex $argv 0]
set PACKAGE_HEADING [lindex $argv 1]
set ORIGINAL_VERSION [lindex $argv 2]
set FREEDOM_TOOLS_ID [lindex $argv 3]
set RUNTIME_TARGET [lindex $argv 4]
set SITE_FOLDER [lindex $argv 5]

set RUNTIME_OS ""
set RUNTIME_ARCH ""

if {$RUNTIME_TARGET eq "x86_64-linux-ubuntu14"} {
	set RUNTIME_ARCH "x86_64"
	set RUNTIME_OS "linux"
}
if {$RUNTIME_TARGET eq "x86_64-linux-centos6"} {
	set RUNTIME_ARCH "x86_64"
	set RUNTIME_OS "linux"
}
if {$RUNTIME_TARGET eq "x86_64-w64-mingw32"} {
	set RUNTIME_ARCH "x86_64"
	set RUNTIME_OS "win32"
}
if {$RUNTIME_TARGET eq "x86_64-apple-darwin"} {
	set RUNTIME_ARCH "x86_64"
	set RUNTIME_OS "macosx"
}

file delete -force "$SITE_FOLDER/site.xml"
set f [open "$SITE_FOLDER/site.xml" "w"]

puts $f "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
puts $f "<site>"
puts $f ""
puts $f "  <description"
puts $f "      name=\"Freedom Tools ${FREEDOM_TOOLS_ID} ${PACKAGE_WORDING} ${ORIGINAL_VERSION} for ${RUNTIME_TARGET} bundle\">"
puts $f "    Freedom Tools ${FREEDOM_TOOLS_ID} ${PACKAGE_WORDING} ${ORIGINAL_VERSION} for ${RUNTIME_TARGET} bundle"
puts $f "  </description>"
puts $f ""
puts $f "  <feature"
puts $f "      url=\"features/${PACKAGE_HEADING}_${FREEDOM_TOOLS_ID}_${ORIGINAL_VERSION}.jar\""
puts $f "      id=\"${PACKAGE_HEADING}_${FREEDOM_TOOLS_ID}\""
puts $f "      version=\"${ORIGINAL_VERSION}\""
puts $f "      os=\"${RUNTIME_OS}\""
puts $f "      arch=\"${RUNTIME_ARCH}\">"
puts $f "    <category"
puts $f "        name=\"${PACKAGE_HEADING}-${ORIGINAL_VERSION}-${FREEDOM_TOOLS_ID}-${RUNTIME_TARGET}.bundle\"/>"
puts $f "  </feature>"
puts $f ""
puts $f "  <category-def"
puts $f "      name=\"${PACKAGE_HEADING}-${ORIGINAL_VERSION}-${FREEDOM_TOOLS_ID}-${RUNTIME_TARGET}.bundle\""
puts $f "      label=\"Freedom Tools ${FREEDOM_TOOLS_ID} ${PACKAGE_WORDING} ${ORIGINAL_VERSION} for ${RUNTIME_TARGET} bundle\">"
puts $f "    <description>"
puts $f "      Freedom Tools ${FREEDOM_TOOLS_ID} ${PACKAGE_WORDING} ${ORIGINAL_VERSION} for ${RUNTIME_TARGET} bundle"
puts $f "    </description>"
puts $f "  </category-def>"
puts $f ""
puts $f "</site>"

close $f
