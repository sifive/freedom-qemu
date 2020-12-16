#!/usr/bin/tclsh

set PACKAGE_WORDING [lindex $argv 0]
set PACKAGE_HEADING [lindex $argv 1]
set ORIGINAL_VERSION [lindex $argv 2]
set FREEDOM_TOOLS_ID [lindex $argv 3]
set RUNTIME_TARGET [lindex $argv 4]
set FEATURE_FOLDER [lindex $argv 5]

file delete -force "$FEATURE_FOLDER/feature.xml"
set f [open "$FEATURE_FOLDER/feature.xml" "w"]

puts $f "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
puts $f "<feature"
puts $f "    id=\"${PACKAGE_HEADING}_${FREEDOM_TOOLS_ID}\""
puts $f "    label=\"Freedom Tools ${FREEDOM_TOOLS_ID} ${PACKAGE_WORDING} ${ORIGINAL_VERSION} for ${RUNTIME_TARGET}\""
puts $f "    version=\"${ORIGINAL_VERSION}\""
puts $f "    provider-name=\"SiFive\">"
puts $f ""
puts $f "  <description>"
puts $f "    Freedom Tools ${FREEDOM_TOOLS_ID} ${PACKAGE_WORDING} ${ORIGINAL_VERSION} for ${RUNTIME_TARGET}"
puts $f "  </description>"
puts $f ""
puts $f "  <copyright>"
puts $f "    Copyright (c) 2015-2020, SiFive Inc."
puts $f "  </copyright>"
puts $f ""
puts $f "  <license>"
puts $f "    Eclipse Public License v1.0"
puts $f "  </license>"
puts $f ""
puts $f "</feature>"

close $f
