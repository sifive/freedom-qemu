#!/usr/bin/tclsh

cd [lindex $argv 0]
file delete -force "chmod755.sh"
set chmodsh [open "chmod755.sh" "w"]
set rootlen [string length "[pwd]/"]

proc checkfiles {rd} {
	global chmodsh rootlen
	
	set fs [lsort [glob -nocomplain -types f "$rd/*"]]
	foreach f $fs {
		if {[file executable $f]} {
			puts $chmodsh "chmod 755 [string range $f $rootlen end]"
		}
	}

	set ds [lsort [glob -nocomplain -types d "$rd/*"]]
	foreach d $ds {
		checkfiles $d
	}
}

checkfiles [pwd]
puts $chmodsh "chmod 755 chmod755.sh"
close $chmodsh
