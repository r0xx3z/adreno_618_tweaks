#!/system/bin/sh
MODDIR=${0%/*}
SERVICE="$MODDIR/service.sh"
BINARY="$MODDIR/SurfaceFlinger"

sleep 1
echo "==============================="
echo "  SurfaceFlinger refresh rate"
echo "==============================="
sleep 1

#Automatically detect the screen refresh rate to set Surfaceflinger settings according to the Hz used
raw=$(dumpsys display | grep -m1 'mActiveSfDisplayMode=' | grep -oE 'peakRefreshRate=[0-9]+(\.[0-9]+)?' | head -n1 | cut -d= -f2)

if [ -z "$raw" ]; then
    echo "! Could not read refresh rate from dumpsys display."
    exit 1
fi

# Truncate decimals for comparison
hz=${raw%.*}

echo "-> Detected active refresh rate: ${raw}Hz"
sleep 0.5

# Snap the raw value to the nearest supported profile
if [ "$hz" -le 75 ]; then
    mode="60hz"
elif [ "$hz" -le 104 ]; then
    mode="90hz"
else
    mode="120hz"
fi

# Apply immediately 
chmod 755 "$BINARY"
"$BINARY" "--${mode}"

sleep 0.5

# Update the mode= line inside service.sh
sed -i "s/^mode=.*/mode=$mode/" "$SERVICE"
echo "-> service.sh updated to: $mode"
sleep 0.5
echo "-> Done."
exit 0