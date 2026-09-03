#!/system/bin/sh

# Clear cache of drivers used in the module
find /data/user_de/*/*/*cache/* -iname "*shader*" -exec rm -rf {} +
find /data/data/* -iname "*shader*" -exec rm -rf {} +
find /data/data/* -iname "*graphitecache*" -exec rm -rf {} +
find /data/data/* -iname "*gpucache*" -exec rm -rf {} +
find /data_mirror/data*/*/*/*/* -iname "*shader*" -exec rm -rf {} +
find /data_mirror/data*/*/*/*/* -iname "*graphitecache*" -exec rm -rf {} +
find /data_mirror/data*/*/*/*/* -iname "*gpucache*" -exec rm -rf {} +

# Apply a backup before uninstalling
MODDIR=${0%/*}
BACKUP="$MODDIR/persist_backup.prop"
PROPLIST=$(grep -E '^persist\.' "$MODDIR/system.prop" 2>/dev/null | tr -d '\r' | cut -d= -f1 | sort -u)

for prop in $PROPLIST; do
  orig=$(grep "^$prop=" "$BACKUP" 2>/dev/null | cut -d= -f2-)
  if [ -n "$orig" ]; then
    resetprop -p "$prop" "$orig" 2>/dev/null
  else
    resetprop --delete "$prop" 2>/dev/null
  fi
done

# Remove the module
rm -rf /data/adb/modules/adrenogputweaks