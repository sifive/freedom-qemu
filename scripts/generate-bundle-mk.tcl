#!/usr/bin/tclsh

set BUNDLE_FOLDER [lindex $argv 0]

file delete -force "$BUNDLE_FOLDER/bundle.mk"
set f [open "$BUNDLE_FOLDER/bundle.mk" "w"]

foreach {name value} [lrange $argv 1 end] {
	puts $f "$name = $value"
}

close $f
