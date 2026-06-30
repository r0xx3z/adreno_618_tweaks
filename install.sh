#!/system/bin/sh
SKIPMOUNT=false
PROPFILE=true
POSTFSDATA=false
LATESTARTSERVICE=true

sleep 1

ui_print "***********************************"
ui_print "        Adreno GPU Tweaks."
ui_print "***********************************"
sleep 1
ui_print "*********************************"
ui_print "            Installing..."
ui_print "*********************************"

SKIPUNZIP=1
unzip -qjo "$ZIPFILE" 'common/functions.sh' -d $TMPDIR >&2
. $TMPDIR/functions.sh

sleep 2
ui_print "**********************************************"
ui_print " SUCESSFULLY INSTALLED. ¡REBOOT NOW!"
ui_print "**********************************************"

