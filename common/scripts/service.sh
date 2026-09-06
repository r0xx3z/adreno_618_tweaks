#!/system/bin/sh
until [ "$(getprop sys.boot_completed)" -eq 1 ]; do
  sleep 20
done

su -lp 2000 -c "cmd notification post -S bigtext -t 'Adreno 618 Tweaks' 'Tag' 'Installing...'" > /dev/null 2>&1

# Apply chmod
apply_perm() {
    find "$1" -type f -exec chmod 644 {} + 2>/dev/null
}

for path in \
/data/adb/modules/adrenogputweaks \
/sys/devices/system/cpu \
/sys/module \
/sys/class/kgsl \
/sys/class/thermal \
/proc/sys \
/data/vendor/thermal 
do
    apply_perm "$path"
done

######################################
## SURFACEFLINGER SETTINGS ##
mode=120hz
binary=/data/adb/modules/adrenogputweaks/SurfaceFlinger
if [ ! -x "$binary" ]; then
	chmod +x "$binary"
fi
"$binary" "--${mode}"
######################################

## CPU SETTINGS ##

# Online all cores (0-7)
for i in 0 1 2 3 4 5 6 7; do
    echo "1" > /sys/devices/system/cpu/cpu$i/online
done

get_max() { cat "/sys/devices/system/cpu/cpu$1/cpufreq/cpuinfo_max_freq" 2>/dev/null; }
get_min() { cat "/sys/devices/system/cpu/cpu$1/cpufreq/cpuinfo_min_freq" 2>/dev/null; }

# Detects real limits per cluster
SILVER_MAX=$(get_max 0); SILVER_MIN=$(get_min 0)
GOLD_MAX=$(get_max 4);   GOLD_MIN=$(get_min 4)

# Kryo 470 silver cluster (cpu0-3)
for i in 0 1 2 3; do
    p=/sys/devices/system/cpu/cpu$i/cpufreq
    echo "$SILVER_MAX" > $p/scaling_max_freq
    echo "$SILVER_MIN" > $p/scaling_min_freq
    echo "$SILVER_MAX" > $p/scaling_boost_frequencies
    echo "performance"  > $p/scaling_governor
done

# Kryo 470 gold cluster (cpu4-7)
for i in 4 5 6 7; do
    p=/sys/devices/system/cpu/cpu$i/cpufreq
    echo "$GOLD_MAX" > $p/scaling_max_freq
    echo "$GOLD_MIN" > $p/scaling_min_freq
    echo "$GOLD_MAX" > $p/scaling_boost_frequencies
    echo "performance" > $p/scaling_governor
done

# policy0 (Little cluster, Kryo 470 Silver / Cortex-A55)
p=/sys/devices/system/cpu/cpufreq/policy0
echo "$SILVER_MAX" > $p/scaling_max_freq
echo "$SILVER_MIN" > $p/scaling_min_freq
echo "$SILVER_MAX" > $p/scaling_boost_frequencies
echo "performance"  > $p/scaling_governor
echo "$SILVER_MAX" > $p/schedutil/hispeed_freq
echo "$SILVER_MAX" > $p/schedutil/rtg_boost_freq
echo "75"             > $p/schedutil/hispeed_load

# policy4 (Big cluster, Kryo 470 Gold / Cortex-A76)
p=/sys/devices/system/cpu/cpufreq/policy4
echo "$GOLD_MAX" > $p/scaling_max_freq
echo "$GOLD_MIN" > $p/scaling_min_freq
echo "$GOLD_MAX" > $p/scaling_boost_frequencies
echo "performance" > $p/scaling_governor
echo "$GOLD_MAX" > $p/schedutil/hispeed_freq
echo "$GOLD_MAX" > $p/schedutil/rtg_boost_freq
echo "75"           > $p/schedutil/hispeed_load

# Per-core schedutil, Little cluster (cpu0-3)
for i in 0 1 2 3; do
    p=/sys/devices/system/cpu/cpu$i/cpufreq/schedutil
    echo "$SILVER_MAX" > $p/hispeed_freq
    echo "$SILVER_MAX" > $p/rtg_boost_freq
    echo "75"             > $p/hispeed_load
done

# Per-core schedutil, Big cluster (cpu4-7)
for i in 4 5 6 7; do
    p=/sys/devices/system/cpu/cpu$i/cpufreq/schedutil
    echo "$GOLD_MAX" > $p/hispeed_freq
    echo "$GOLD_MAX" > $p/rtg_boost_freq
    echo "75"           > $p/hispeed_load
done

# CPU set dev
set_cpuset() {
  for f in cpus effective_cpus; do
    chmod 644 /dev/cpuset/$1/$f
    echo "$2" > /dev/cpuset/$1/$f
  done
}

set_cpuset audio-app         "0-2"
set_cpuset background        "0-7"
set_cpuset camera-daemon     "0-7"
set_cpuset foreground        "0-3,4-7"
set_cpuset foreground/boost  "0-3,4-7"
set_cpuset game              "0-7"
set_cpuset gamelite          "0-7"
set_cpuset restricted        "0-7"
set_cpuset system-background "0-7"
set_cpuset top-app           "0-7"
set_cpuset kernel            "0-3,4-7"

# CPU: OC / Schedulers
for entry in \
    "/proc/sys/kernel/perf_cpu_time_max_percent:3" \
    "/proc/sys/kernel/sched_autogroup_enabled:1" \
    "/proc/sys/kernel/sched_child_runs_first:1" \
    "/proc/sys/kernel/sched_tunable_scaling:0" \
    "/proc/sys/kernel/sched_latency_ns:4000000" \
    "/proc/sys/kernel/sched_min_granularity_ns:100000" \
    "/proc/sys/kernel/sched_wakeup_granularity_ns:2000000" \
    "/proc/sys/kernel/sched_migration_cost_ns:5000000" \
    "/proc/sys/kernel/sched_nr_migrate:128" \
    "/proc/sys/kernel/sched_schedstats:0" \
    "/proc/sys/kernel/random/read_wakeup_threshold:64" \
    "/proc/sys/kernel/random/write_wakeup_threshold:128" \
    "/dev/stune/top-app/schedtune.prefer_idle:0" \
    "/dev/stune/top-app/schedtune.boost:1" \
    "/sys/module/msm_performance/parameters/cpu_oc:Y" \
    "/sys/module/msm_performance/parameters/cpu_ov:Y" \
    "/sys/module/msm_performance/parameters/cpu_uc:N" \
    "/sys/module/msm_performance/parameters/cpu_uv:N" 
do
    path="${entry%%:*}"
    val="${entry##*:}"
    [ -w "$path" ] && echo "$val" > "$path" 2>/dev/null
done
      
## GPU SETTINGS ##

# GPU: Max clock / Force bus online / OC / Qualcomm Settings
GPU=/sys/class/kgsl/kgsl-3d0
MAXFREQ=$(cat "$GPU/gpu_available_frequencies" 2>/dev/null | tr ' ' '\n' | sort -n | tail -1)
[ -z "$MAXFREQ" ] && MAXFREQ=$(cat "$GPU/max_gpuclk" 2>/dev/null)
MAXMHZ=$((MAXFREQ / 1000000))

for entry in \
    "$GPU/gpuclk:$MAXFREQ" \
    "$GPU/max_gpuclk:$MAXFREQ" \
    "$GPU/gpuclk_mhz:$MAXMHZ" \
    "$GPU/max_clock_mhz:$MAXMHZ" \
    "$GPU/max_pwrlevel:0" \
    "$GPU/default_pwrlevel:0" \
    "$GPU/min_pwrlevel:0" \
    "$GPU/force_clk_on:1" \
    "$GPU/force_bus_on:1" \
    "$GPU/force_rail_on:1" \
    "$GPU/force_no_nap:1" \
    "$GPU/fsync_enable:0" \
    "$GPU/vsync_enable:0" \
    "$GPU/throttling:0" \
    "/sys/module/adreno_idler/parameters/adreno_idler_active:0" \
    "/sys/module/msm_performance/parameters/gpu_oc:Y" \
    "/sys/module/msm_performance/parameters/gpu_ov:Y" \
    "/sys/module/msm_performance/parameters/gpu_uc:N" \
    "/sys/module/msm_performance/parameters/gpu_uv:N" \
    "/sys/module/workqueue/parameters/power_efficient:N" \
    "/sys/module/msm_performance/parameters/touchboost:1" \
    "/sys/module/sync/parameters/fsync_enabled:N" \
    "/sys/module/sync/parameters/vsync_enabled:N" \
    "/sys/class/kgsl/kgsl-3d0/thermal_pwrlevel:0" \
    "/proc/sys/kernel/sched_boost:1"
do
    path="${entry%%:*}"
    val="${entry##*:}"
    [ -w "$path" ] && echo "$val" > "$path" 2>/dev/null
done

## Sweet 33w Charger by ExoticGank ##########################
sh /system/etc/.nth_fc/.fc_main.sh
ext() 
{
    if [ -f ${2} ]; then
        chmod 0666 ${2}
        echo ${1} > ${2}
        chmod 0444 ${2}
    fi
}

ext 5500000 /sys/class/power_supply/battery/constant_charge_current_max
###################################################


## THERMAL SETTINGS ##

SET_TRIP_POINT_TEMP_MAX=105000

echo 0 > /sys/class/thermal/thermal_zone*/mode

cmd thermalservice override-status 0

for sensor in cpu0 gpu0 npu0 apu0 dsp0 tpu0 vpu0 isp0 spu0 dpu0 pim0 skin pmic0 ddr0 ufs0 modem0 battery; do
    cmd thermalservice inject-temperature CPU light "$sensor" 120.000
done

write() {
    local file="$1" value="$2"
    [ -z "$file" ] || [ -z "$value" ] || [ ! -f "$file" ] && return 1
    chmod +w "$file" 2>/dev/null
    echo "$value" > "$file" 2>/dev/null
}

# GPU / DDR trip points
for THERMAL_ZONE in /sys/class/thermal/thermal_zone*/type; do
    if grep -qE "gpu|ddr" "$THERMAL_ZONE" 2>/dev/null; then
        for TRIP in "${THERMAL_ZONE%/*}"/trip_point_*_temp; do
            cur=$(cat "$TRIP" 2>/dev/null)
            [ -n "$cur" ] && [ "$cur" -lt "$SET_TRIP_POINT_TEMP_MAX" ] && echo "$SET_TRIP_POINT_TEMP_MAX" > "$TRIP"
        done
    fi
done

# Config dexopt / power / thermal props
(
cmd package bg-dexopt-job thermal cutoff
setprop pm.dexopt.disable_bg_dexopt true
cmd device_config put dalvik dexopt disable_bg_dexopt true
pm bg-dexopt-job-disable
cmd device_config put dalvik vm.dexopt thermal_cutoff 0
cmd power set-fixed-performance-mode-enabled true
cmd power set-adaptive-power-saver-enabled false
cmd power set-mode 0
cmd device_config put thermal high_temp_limit 150
cmd device_config put thermal low_temp_limit 150
cmd shortcut reset-throttling
cmd shortcut reset-all-throttling
) >/dev/null 2>&1 &

# Stop thermal services
for thermsvc in $(getprop | grep 'init.svc.*thermal' | cut -d: -f1 | sed 's/[][]//g'); do
    resetprop -n "$thermsvc" "stopped"
done

# Deactivate thermal sys props
for thermsys in $(getprop | grep 'sys.*thermal' | cut -d: -f1 | sed 's/[][]//g'); do
    resetprop -n "$thermsys" "0"
done

# Thermal zone mode disabled
for thermmode in /sys/devices/virtual/thermal/thermal_zone*/mode; do
    chmod 644 "$thermmode" 2>/dev/null
    echo "disabled" > "$thermmode" 2>/dev/null
done

# msm_thermal
find /sys -name enabled -path '*msm_thermal*' 2>/dev/null | while IFS= read -r f; do
    chmod 644 "$f"
    val=$(cat "$f")
    { [ "$val" = 'Y' ] || [ "$val" = '1' ]; } && echo '0' > "$f"
done

# Remove cache thermal
rm -f /data/vendor/thermal/config /data/vendor/thermal/*thermal*

## LOGS SETTINGS ##
find /sys/ \( \
    -name "*log_level*"      -o \
    -name "*debug_mask*"      -o \
    -name "*debug_level*"     -o \
    -name "*log_ue*"        -o \
    -name "*compat-log*"        -o \
    -name "*ep_addr_rxdbg_mask*"        -o \
    -name "*ep_addr_txdbg_mask*"        -o \
    -name "*edac_mc_log*"    -o \
    -name "*fnmode*"    -o \
    -name "*backlight_dimmer*"    -o \
    -name "*rpm_log*"    -o \
    -name "*exception-trace*"    -o \
    -name "*log_level_cmd*" -o \
    -name "*log_level_ctxt*" -o \
    -name "*log_level_pwr*" -o \
    -name "*log_level_mem*" -o \
    -name "*log_level_drv*" -o \
    -name "*log_ecn_error*"   -o \
    -name "*sec_log*"        -o \
    \) -exec sh -c 'echo 0 > "$1" 2>/dev/null' _ {} \; 2>/dev/null

find /proc/sys/ \( -name sched_schedstats -o -name printk -o -name printk_devkmsg -o -name tracing_on \) -exec sh -c '
case "$1" in
    *sched_schedstats|*tracing_on) echo 0 > "$1" ;;
    *printk) echo "0 0 0 0" > "$1" ;;
    *printk_devkmsg) echo off > "$1" ;;
esac' _ {} \; 2>/dev/null

sleep 1

su -lp 2000 -c "cmd notification post -S bigtext -t 'Adreno 618 Tweaks' 'Tag' 'A618T Successfully Installed!!'" > /dev/null 2>&1

exit 0