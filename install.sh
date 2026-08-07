#!/system/bin/sh
SKIPMOUNT=false
PROPFILE=true
POSTFSDATA=true
LATESTARTSERVICE=true
SKIPUNZIP=1

sleep 1
ui_print "***********************************"
ui_print "        Adreno GPU Tweaks"
ui_print "***********************************"
ui_print ""
sleep 1
ui_print "⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷
⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇
⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽"
sleep 0.1
ui_print "⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕
⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕
⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕"
sleep 0.1
ui_print "⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄
⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕
⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿"
sleep 0.1
ui_print "⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟
⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠"
sleep 0.1
ui_print "⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙
⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣"
ui_print ""
sleep 0.1
ui_print "***********************************"
sleep 0.5
ui_print "- Device : $(getprop ro.product.manufacturer), $(getprop ro.product.device)"
sleep 0.5
ui_print "- Architecture : $(getprop ro.product.cpu.abi)"
sleep 0.5
ui_print "- SELinux Status : $(getenforce)"
sleep 0.5
ui_print "- Kernel Version : $(uname -r)"
sleep 1
ui_print "***********************************"
ui_print "           Installing..."
ui_print "************         **************"
sleep 0.2
ui_print "           *         *"

unzip -o "$ZIPFILE" -d "$MODPATH" >&2
  
cp -f $MODPATH/common/scripts/service.sh $MODPATH/service.sh
cp -f $MODPATH/common/scripts/post-fs-data.sh $MODPATH/post-fs-data.sh
cp -f $MODPATH/common/scripts/action.sh $MODPATH/action.sh
cp -f $MODPATH/common/props/system.prop $MODPATH/system.prop
cp -f $MODPATH/common/source/arm64 $MODPATH/SurfaceFlinger
rm -rf $MODPATH/common

set_permissions() {
  set_perm_recursive $MODPATH 0 0 0755 0644
  set_perm $MODPATH/service.sh 0 0 0777
  set_perm $MODPATH/action.sh 0 0 0777
  set_perm $MODPATH/post-fs-data.sh 0 0 0777
  set_perm $MODPATH/SurfaceFlinger 0 0 0777
  set_perm $MODPATH/system/etc/.nth_fc/.fc_main.sh 0 0 0777
  set_perm $MODPATH/system/etc/.nth_fc/.fc_lib 0 0 0777
}

set_permissions

sleep 2
ui_print "************         **************"
ui_print "      SUCESSFULLY INSTALLED." 
ui_print "************         **************"
sleep 0.2
ui_print "           *         *"
sleep 0.2
ui_print "************         **************"
ui_print "           ¡REBOOT NOW!"
ui_print "***********************************"