#!/system/bin/sh

until [ "$(getprop sys.boot_completed)" -eq 1 ]; do
  sleep 10
done

####################################################

##CPU##
#
#Cortex A53 kryo 260 silver CPU cores to be online
chmod 644 /sys/devices/system/cpu/cpu0/online
chmod 644 /sys/devices/system/cpu/cpu1/online
chmod 644 /sys/devices/system/cpu/cpu2/online
chmod 644 /sys/devices/system/cpu/cpu3/online
echo "1" > /sys/devices/system/cpu/cpu0/online
echo "1" > /sys/devices/system/cpu/cpu1/online
echo "1" > /sys/devices/system/cpu/cpu2/online
echo "1" > /sys/devices/system/cpu/cpu3/online
#Cortex A73 kryo 260 gold CPU cores to be online
chmod 644 /sys/devices/system/cpu/cpu4/online
chmod 644 /sys/devices/system/cpu/cpu5/online
chmod 644 /sys/devices/system/cpu/cpu6/online
chmod 644 /sys/devices/system/cpu/cpu7/online
echo "1" > /sys/devices/system/cpu/cpu4/online
echo "1" > /sys/devices/system/cpu/cpu5/online
echo "1" > /sys/devices/system/cpu/cpu6/online
echo "1" > /sys/devices/system/cpu/cpu7/online
#Kryo 470 silver cluster (cpu0-3) - SM6150-AC Redmi Note 10 Pro - real table: 300000 576000 768000 1017600 1248000 1324800 1497600 1612800 1708800 1804800 MHz
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
echo "1804800" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo "300000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo "1804800" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
echo "300000" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
echo "1804800" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
echo "300000" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
echo "1804800" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
echo "300000" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq
#Kryo 470 gold cluster (cpu4-7) - SM6150-AC Redmi Note 10 Pro - real table: 300000 652800 806400 979200 1094400 1209600 1324800 1555200 1708800 1843200 1939200 2169600 2208000 2304000 MHz
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu5/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu6/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu6/cpufreq/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpu7/cpufreq/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpu7/cpufreq/scaling_min_freq
echo "2304000" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
echo "300000" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
echo "2304000" > /sys/devices/system/cpu/cpu5/cpufreq/scaling_max_freq
echo "300000" > /sys/devices/system/cpu/cpu5/cpufreq/scaling_min_freq
echo "2304000" > /sys/devices/system/cpu/cpu6/cpufreq/scaling_max_freq
echo "300000" > /sys/devices/system/cpu/cpu6/cpufreq/scaling_min_freq
echo "2304000" > /sys/devices/system/cpu/cpu7/cpufreq/scaling_max_freq
echo "300000" > /sys/devices/system/cpu/cpu7/cpufreq/scaling_min_freq
#Cortex A53 kryo 260 boost scaling
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_boost_frequencies
chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/scaling_boost_frequencies
chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/scaling_boost_frequencies
chmod 644 /sys/devices/system/cpu/cpu3/cpufreq/scaling_boost_frequencies
echo "1804800" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_boost_frequencies
echo "1804800" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_boost_frequencies
echo "1804800" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_boost_frequencies
echo "1804800" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_boost_frequencies
#Cortex A73 kryo 260 boost scaling
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_boost_frequencies
chmod 644 /sys/devices/system/cpu/cpu5/cpufreq/scaling_boost_frequencies
chmod 644 /sys/devices/system/cpu/cpu6/cpufreq/scaling_boost_frequencies
chmod 644 /sys/devices/system/cpu/cpu7/cpufreq/scaling_boost_frequencies
echo "2304000" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_boost_frequencies
echo "2304000" > /sys/devices/system/cpu/cpu5/cpufreq/scaling_boost_frequencies
echo "2304000" > /sys/devices/system/cpu/cpu6/cpufreq/scaling_boost_frequencies
echo "2304000" > /sys/devices/system/cpu/cpu7/cpufreq/scaling_boost_frequencies
#Cortex A53 kryo 260 CPU governors conservative ondemand userspace powersave performance schedutil
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
echo "performance" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "performance" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
echo "performance" > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
echo "performance" > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
#Cortex A73 kryo 260 CPU governors conservative ondemand userspace powersave performance schedutil
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu6/cpufreq/scaling_governor
chmod 644 /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor
echo "performance" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo "performance" > /sys/devices/system/cpu/cpu5/cpufreq/scaling_governor
echo "performance" > /sys/devices/system/cpu/cpu6/cpufreq/scaling_governor
echo "performance" > /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor
#Cortex A53 kryo 260 kernel policy0 paths CPU clock speed 300MHz to 1900MHz RTG Load Boost Freq 1900Mhz HighSpeed Freq 940MHz at 95 Load
chmod 644 /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpufreq/policy0/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpufreq/policy0/scaling_boost_frequencies
chmod 644 /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
chmod 644 /sys/devices/system/cpu/cpufreq/policy0/shedutil/highspeed_freq
chmod 644 /sys/devices/system/cpu/cpufreq/policy0/shedutil/rtg_boost_freq
chmod 644 /sys/devices/system/cpu/cpufreq/policy0/shedutil/hispeed_load
echo "1804800" > /sys/devices/system/cpu/cpufreq/policy0/scaling_max_freq
echo "300000" > /sys/devices/system/cpu/cpufreq/policy0/scaling_min_freq
echo "1804800" > /sys/devices/system/cpu/cpufreq/policy0/scaling_boost_frequencies
echo "performance" > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
echo "1497600" > /sys/devices/system/cpu/cpufreq/policy0/shedutil/highspeed_freq
echo "1804800" > /sys/devices/system/cpu/cpufreq/policy0/shedutil/rtg_boost_freq
echo "85" > /sys/devices/system/cpu/cpufreq/policy0/shedutil/hispeed_load
#Cortex A73 kryo 260 kernel policy4 paths CPU clock speed 300MHz to 2400MHz RTG Load Boost Freq 2400Mhz HighSpeed Freq 806MHz at 95 Load
chmod 644 /sys/devices/system/cpu/cpufreq/policy4/scaling_max_freq
chmod 644 /sys/devices/system/cpu/cpufreq/policy4/scaling_min_freq
chmod 644 /sys/devices/system/cpu/cpufreq/policy4/scaling_boost_frequencies
chmod 644 /sys/devices/system/cpu/cpufreq/policy0/scaling_governor
chmod 644 /sys/devices/system/cpu/cpufreq/policy4/schedutil/hispeed_freq
chmod 644 /sys/devices/system/cpu/cpufreq/policy4/schedutil/rtg_boost_freq
chmod 644 /sys/devices/system/cpu/cpufreq/policy4/schedutil/hispeed_load
echo "2304000" > /sys/devices/system/cpu/cpufreq/policy4/scaling_max_freq
echo "300000" > /sys/devices/system/cpu/cpufreq/policy4/scaling_min_freq
echo "2304000" > /sys/devices/system/cpu/cpufreq/policy4/scaling_boost_frequencies
echo "performance" > /sys/devices/system/cpu/cpufreq/policy4/scaling_governor
echo "1324800" > /sys/devices/system/cpu/cpufreq/policy4/schedutil/hispeed_freq
echo "2304000" > /sys/devices/system/cpu/cpufreq/policy4/schedutil/rtg_boost_freq
echo "85" > /sys/devices/system/cpu/cpufreq/policy4/schedutil/hispeed_load
#CPU0 A53 RTG Load Boost Freq 1900MHz HighSpeed Freq 940MHz at 95 Load
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/schedutil/hispeed_freq
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/schedutil/rtg_boost_freq
chmod 644 /sys/devices/system/cpu/cpu0/cpufreq/schedutil/hispeed_load
echo "1497600" > /sys/devices/system/cpu/cpu0/cpufreq/schedutil/hispeed_freq
echo "1804800" > /sys/devices/system/cpu/cpu0/cpufreq/schedutil/rtg_boost_freq
echo "85" > /sys/devices/system/cpu/cpu0/cpufreq/schedutil/hispeed_load
#CPU1 A53 RTG Load Boost Freq 1900MHz HighSpeed Freq 940MHz at 95 Load
chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/schedutil/hispeed_freq
chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/schedutil/rtg_boost_freq
chmod 644 /sys/devices/system/cpu/cpu1/cpufreq/schedutil/hispeed_load
echo "1497600" > /sys/devices/system/cpu/cpu1/cpufreq/schedutil/hispeed_freq
echo "1804800" > /sys/devices/system/cpu/cpu1/cpufreq/schedutil/rtg_boost_freq
echo "85" > /sys/devices/system/cpu/cpu1/cpufreq/schedutil/hispeed_load
#CPU2 A53 RTG Load Boost Freq 1900MHz HighSpeed Freq 940MHz at 95 Load
chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/schedutil/hispeed_freq
chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/schedutil/rtg_boost_freq
chmod 644 /sys/devices/system/cpu/cpu2/cpufreq/schedutil/hispeed_load
echo "1497600" > /sys/devices/system/cpu/cpu2/cpufreq/schedutil/hispeed_freq
echo "1804800" > /sys/devices/system/cpu/cpu2/cpufreq/schedutil/rtg_boost_freq
echo "85" > /sys/devices/system/cpu/cpu2/cpufreq/schedutil/hispeed_load
#CPU3 A53 RTG Load Boost Freq 1900MHz HighSpeed Freq 940MHz at 95 Load
chmod 644 /sys/devices/system/cpu/cpu3/cpufreq/schedutil/hispeed_freq
chmod 644 /sys/devices/system/cpu/cpu3/cpufreq/schedutil/rtg_boost_freq
chmod 644 /sys/devices/system/cpu/cpu3/cpufreq/schedutil/hispeed_load
echo "1497600" > /sys/devices/system/cpu/cpu3/cpufreq/schedutil/hispeed_freq
echo "1804800" > /sys/devices/system/cpu/cpu3/cpufreq/schedutil/rtg_boost_freq
echo "85" > /sys/devices/system/cpu/cpu3/cpufreq/schedutil/hispeed_load
#CPU4 A73 RTG Load Boost Freq 2400MHz HighSpeed Freq 806MHz at 95 Load
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/schedutil/hispeed_freq
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/schedutil/rtg_boost_freq
chmod 644 /sys/devices/system/cpu/cpu4/cpufreq/schedutil/hispeed_load
echo "1324800" > /sys/devices/system/cpu/cpu4/cpufreq/schedutil/hispeed_freq
echo "2304000" > /sys/devices/system/cpu/cpu4/cpufreq/schedutil/rtg_boost_freq
echo "85" > /sys/devices/system/cpu/cpu4/cpufreq/schedutil/hispeed_load
#CPU5 A73 RTG Load Boost Freq 2400MHz HighSpeed Freq 806MHz at 95 Load
chmod 644 /sys/devices/system/cpu/cpu5/cpufreq/schedutil/hispeed_freq
chmod 644 /sys/devices/system/cpu/cpu5/cpufreq/schedutil/rtg_boost_freq
chmod 644 /sys/devices/system/cpu/cpu5/cpufreq/schedutil/hispeed_load
echo "1324800" > /sys/devices/system/cpu/cpu5/cpufreq/schedutil/hispeed_freq
echo "2304000" > /sys/devices/system/cpu/cpu5/cpufreq/schedutil/rtg_boost_freq
echo "85" > /sys/devices/system/cpu/cpu5/cpufreq/schedutil/hispeed_load
#CPU6 A73 RTG Load Boost Freq 2400MHz HighSpeed Freq 806MHz at 95 Load
chmod 644 /sys/devices/system/cpu/cpu6/cpufreq/schedutil/hispeed_freq
chmod 644 /sys/devices/system/cpu/cpu6/cpufreq/schedutil/rtg_boost_freq
chmod 644 /sys/devices/system/cpu/cpu6/cpufreq/schedutil/hispeed_load
echo "1324800" > /sys/devices/system/cpu/cpu6/cpufreq/schedutil/hispeed_freq
echo "2304000" > /sys/devices/system/cpu/cpu6/cpufreq/schedutil/rtg_boost_freq
echo "85" > /sys/devices/system/cpu/cpu6/cpufreq/schedutil/hispeed_load
#CPU7 A73 RTG Load Boost Freq 2400MHz HighSpeed Freq 806MHz at 95 Load
chmod 644 /sys/devices/system/cpu/cpu7/cpufreq/schedutil/hispeed_freq
chmod 644 /sys/devices/system/cpu/cpu7/cpufreq/schedutil/rtg_boost_freq
chmod 644 /sys/devices/system/cpu/cpu7/cpufreq/schedutil/hispeed_load
echo "1324800" > /sys/devices/system/cpu/cpu7/cpufreq/schedutil/hispeed_freq
echo "2304000" > /sys/devices/system/cpu/cpu7/cpufreq/schedutil/rtg_boost_freq
echo "85" > /sys/devices/system/cpu/cpu7/cpufreq/schedutil/hispeed_load
#
#CPU set dev
#
chmod 644 /dev/cpuset/audio-app/cpus
chmod 644 /dev/cpuset/audio-app/effective_cpus
chmod 644 /dev/cpuset/background/cpus
chmod 644 /dev/cpuset/background/effective_cpus
chmod 644 /dev/cpuset/camera-daemon/cpus
chmod 644 /dev/cpuset/camera-daemon/effective_cpus
chmod 644 /dev/cpuset/foreground/cpus
chmod 644 /dev/cpuset/foreground/effective_cpus
chmod 644 /dev/cpuset/foreground/boost/cpus
chmod 644 /dev/cpuset/foreground/boost/effective_cpus
chmod 644 /dev/cpuset/game/cpus
chmod 644 /dev/cpuset/game/effective_cpus
chmod 644 /dev/cpuset/gamelite/cpus
chmod 644 /dev/cpuset/gamelite/effective_cpus
chmod 644 /dev/cpuset/restricted/cpus
chmod 644 /dev/cpuset/restricted/effective_cpus
chmod 644 /dev/cpuset/system-background/cpus
chmod 644 /dev/cpuset/system-background/effective_cpus
chmod 644 /dev/cpuset/top-app/cpus
chmod 644 /dev/cpuset/top-app/effective_cpus
chmod 644 /dev/cpuset/kernel/cpus
chmod 644 /dev/cpuset/kernel/effective_cpus
echo "1-2" > /dev/cpuset/audio-app/cpus
echo "1-2" > /dev/cpuset/audio-app/effective_cpus
echo "0-7" > /dev/cpuset/background/cpus
echo "0-7" > /dev/cpuset/background/effective_cpus
echo "0-7" > /dev/cpuset/camera-daemon/cpus
echo "0-7" > /dev/cpuset/camera-daemon/effective_cpus
echo "0-3,4-7" > /dev/cpuset/foreground/cpus
echo "0-3,4-7" > /dev/cpuset/foreground/effective_cpus
echo "0-3,4-7" > /dev/cpuset/foreground/boost/cpus
echo "0-3,4-7" > /dev/cpuset/foreground/boost/effective_cpus
echo "0-7" > /dev/cpuset/game/cpus
echo "0-7" > /dev/cpuset/game/effective_cpus
echo "0-7" > /dev/cpuset/gamelite/cpus
echo "0-7" > /dev/cpuset/gamelite/effective_cpus
echo "0-7" > /dev/cpuset/restricted/cpus
echo "0-7" > /dev/cpuset/restricted/effective_cpus
echo "0-7" > /dev/cpuset/system-background/cpus
echo "0-7" > /dev/cpuset/system-background/effective_cpus
echo "0-7" > /dev/cpuset/top-app/cpus
echo "0-7" > /dev/cpuset/top-app/effective_cpus
echo "0-3,4-7" > /dev/cpuset/kernel/cpus
echo "0-3,4-7" > /dev/cpuset/kernel/effective_cpus
#
#CPU Overclock Parameters
#
chmod 644 /sys/module/msm_performance/parameters/cpu_oc
chmod 644 /sys/module/msm_performance/parameters/cpu_ov
chmod 644 /sys/module/msm_performance/parameters/cpu_uc
chmod 644 /sys/module/msm_performance/parameters/cpu_uv
echo "Y" > /sys/module/msm_performance/parameters/cpu_oc
echo "Y" > /sys/module/msm_performance/parameters/cpu_ov
echo "N" > /sys/module/msm_performance/parameters/cpu_uc
echo "N" > /sys/module/msm_performance/parameters/cpu_uv
#
#CPU Thermal Throttling
#
chmod 644 /sys/module/msm_thermal/core_control/enabled
chmod 644 /sys/module/msm_thermal/parameters/enabled
chmod 644 /sys/module/msm_thermal/cpufreq_control/enabled
chmod 644 /sys/module/msm_thermal/cpuvoltage_control/enabled
echo "0" > /sys/module/msm_thermal/core_control/enabled
echo "0" > /sys/module/msm_thermal/parameters/enabled
echo "0" > /sys/module/msm_thermal/cpufreq_control/enabled
echo "0" > /sys/module/msm_thermal/cpuvoltage_control/enabled
####################################################

##GPU##
#
#Adreno 618 (Redmi Note 10 Pro / SM7150-AC) GPU max clock speed
chmod 644 /sys/class/kgsl/kgsl-3d0/gpuclk
chmod 644 /sys/class/kgsl/kgsl-3d0/gpuclk_mhz
chmod 644 /sys/class/kgsl/kgsl-3d0/max_clock_mhz
chmod 644 /sys/class/kgsl/kgsl-3d0/max_gpuclk
chmod 644 /sys/class/kgsl/kgsl-3d0/max_pwrlevel
chmod 644 /sys/class/kgsl/kgsl-3d0/default_pwrlevel
chmod 644 /sys/class/kgsl/kgsl-3d0/min_pwrlevel
echo "800000000" > /sys/class/kgsl/kgsl-3d0/gpuclk
echo "800" > /sys/class/kgsl/kgsl-3d0/gpuclk_mhz
echo "800" > /sys/class/kgsl/kgsl-3d0/max_clock_mhz
echo "800000000" > /sys/class/kgsl/kgsl-3d0/max_gpuclk
echo "0" > /sys/class/kgsl/kgsl-3d0/max_pwrlevel
#
#default_pwrlevel/min_pwrlevel: confirm with "cat /sys/class/kgsl/kgsl-3d0/num_pwrlevels"
#
echo "0" > /sys/class/kgsl/kgsl-3d0/default_pwrlevel
echo "0" > /sys/class/kgsl/kgsl-3d0/min_pwrlevel
#
#Adreno 618 GPU Forced Bus Online
#
chmod 644 /sys/class/kgsl/kgsl-3d0/force_clk_on
chmod 644 /sys/class/kgsl/kgsl-3d0/force_bus_on
chmod 644 /sys/class/kgsl/kgsl-3d0/force_rail_on
chmod 644 /sys/class/kgsl/kgsl-3d0/force_no_nap
chmod 644 /sys/class/kgsl/kgsl-3d0/fsync_enable
chmod 644 /sys/class/kgsl/kgsl-3d0/vsync_enable
chmod 644 /sys/module/adreno_idler/parameters/adreno_idler_active
echo "1" > /sys/class/kgsl/kgsl-3d0/force_clk_on
echo "1" > /sys/class/kgsl/kgsl-3d0/force_bus_on
echo "1" > /sys/class/kgsl/kgsl-3d0/force_rail_on
echo "1" > /sys/module/adreno_idler/parameters/adreno_idler_active
echo "1" > /sys/class/kgsl/kgsl-3d0/force_no_nap
echo "0" > /sys/class/kgsl/kgsl-3d0/fsync_enable
echo "0" > /sys/class/kgsl/kgsl-3d0/vsync_enable
#
#Adreno 618 GPU Overclock Parameters
#
chmod 644 /sys/module/msm_performance/parameters/gpu_oc
chmod 644 /sys/module/msm_performance/parameters/gpu_ov
chmod 644 /sys/module/msm_performance/parameters/gpu_uc
chmod 644 /sys/module/msm_performance/parameters/gpu_uv
echo "Y" > /sys/module/msm_performance/parameters/gpu_oc
echo "Y" > /sys/module/msm_performance/parameters/gpu_ov
echo "N" > /sys/module/msm_performance/parameters/gpu_uc
echo "N" > /sys/module/msm_performance/parameters/gpu_uv
#
#Adreno 618 GPU Thermal Throttling
#
chmod 644 /sys/class/kgsl/kgsl-3d0/throttling
echo "0" > /sys/class/kgsl/kgsl-3d0/throttling
#
# Adreno snapshot crashdumper
#
echo "0" > /sys/class/kgsl/kgsl-3d0/snapshot/snapshot_crashdumper
echo "0" > /sys/class/kgsl/kgsl-3d0/snapshot/dump
echo "0" > /sys/class/kgsl/kgsl-3d0/snapshot/force_panic

####################################################

##POWER SETTINGS##
#
#Qualcom Sync Parameters
chmod 644 /sys/module/sync/parameters/fsync_enabled
chmod 644 /sys/module/sync/parameters/vsync_enabled
chmod 644 /proc/sys/kernel/sched_boost
chmod 644 /sys/kernel/debug/msm_fb/0/fsync_enable
chmod 644 /sys/kernel/debug/msm_fb/0/vsync_enable
echo "N" > /sys/module/sync/parameters/fsync_enabled
echo "N" > /sys/module/sync/parameters/vsync_enabled
echo "1" > /proc/sys/kernel/sched_boost
echo "0" > /sys/kernel/debug/msm_fb/0/fsync_enable
echo "0" > /sys/kernel/debug/msm_fb/0/vsync_enable
#
#Qualcom MC Power Savings
#
chmod 644 /sys/module/workqueue/parameters/power_efficient
chmod 644 /sys/devices/system/cpu/sched_mc_power_savings
echo "0" > /sys/module/workqueue/parameters/power_efficient
echo "0" > /sys/devices/system/cpu/sched_mc_power_savings
#
#Qualcom High AMP Fast Charge
#
chmod 644 /sys/kernel/fast_charge/force_fast_charge
chmod 644 /sys/class/power_supply/battery/system_temp_level
chmod 644 /sys/kernel/fast_charge/failsafe
chmod 644 /sys/class/power_supply/battery/allow_hvdcp3
chmod 644 /sys/class/power_supply/usb/pd_allowed
chmod 644 /sys/class/power_supply/battery/subsystem/usb/pd_allowed
chmod 644 /sys/class/power_supply/battery/input_current_limited
chmod 644 /sys/class/power_supply/battery/input_current_settled
chmod 644 /sys/class/qcom-battery/restricted_charging
chmod 644 /sys/class/power_supply/bms/temp_cool
chmod 644 /sys/class/power_supply/bms/temp_hot
chmod 644 /sys/class/power_supply/bms/temp_warm
chmod 644 /sys/class/power_supply/bms/fastcharge_mode
chmod 644 /sys/class/power_supply/battery/fastcharge_mode
chmod 644 /sys/class/power_supply/battery/step_charging_enabled
chmod 644 /sys/class/power_supply/bms/step_charging_enabled
echo "1" > /sys/kernel/fast_charge/force_fast_charge
echo "1" > /sys/class/power_supply/battery/system_temp_level
echo "1" > /sys/kernel/fast_charge/failsafe
echo "1" > /sys/class/power_supply/battery/allow_hvdcp3
echo "1" > /sys/class/power_supply/usb/pd_allowed
echo "1" > /sys/class/power_supply/battery/subsystem/usb/pd_allowed
echo "0" > /sys/class/power_supply/battery/input_current_limited
echo "1" > /sys/class/power_supply/battery/input_current_settled
echo "0" > /sys/class/qcom-battery/restricted_charging
echo "150" > /sys/class/power_supply/bms/temp_cool
echo "480" > /sys/class/power_supply/bms/temp_hot
echo "480" > /sys/class/power_supply/bms/temp_warm
echo "1" > /sys/class/power_supply/bms/fastcharge_mode
echo "1" > /sys/class/power_supply/battery/fastcharge_mode
echo "1" > /sys/class/power_supply/battery/step_charging_enabled
echo "1" > /sys/class/power_supply/bms/step_charging_enabled

## Sweet 33w by ExoticGank###############################################
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
#########################################################################

#
#Qualcom High AMP Values
#
chmod 644 /sys/class/power_supply/usb/current_max
chmod 644 /sys/class/power_supply/usb/hw_current_max
chmod 644 /sys/class/power_supply/usb/pd_current_max
chmod 644 /sys/class/power_supply/usb/ctm_current_max
chmod 644 /sys/class/power_supply/usb/sdp_current_max
chmod 644 /sys/class/power_supply/pc_port/current_max
chmod 644 /sys/class/qcom-battery/restricted_current
chmod 644 /sys/class/power_supply/main/current_max
chmod 644 /sys/class/power_supply/main/constant_charge_current_max
chmod 644 /sys/class/power_supply/main/constant_charge_current
chmod 644 /sys/class/power_supply/battery/current_max
chmod 644 /sys/class/power_supply/battery/constant_charge_current_max
chmod 644 /sys/class/power_supply/battery/constant_charge_current
chmod 644 /sys/class/power_supply/bms/current_max
chmod 644 /sys/class/power_supply/bms/constant_charge_current_max
chmod 644 /sys/class/power_supply/bms/constant_charge_current
echo "7400000" > /sys/class/power_supply/usb/current_max
echo "7400000" > /sys/class/power_supply/usb/hw_current_max
echo "7400000" > /sys/class/power_supply/usb/pd_current_max
echo "7400000" > /sys/class/power_supply/usb/ctm_current_max
echo "7400000" > /sys/class/power_supply/usb/sdp_current_max
echo "7400000" > /sys/class/power_supply/pc_port/current_max
echo "7600000" > /sys/class/qcom-battery/restricted_current
echo "7400000" > /sys/class/power_supply/main/current_max
echo "7400000" > /sys/class/power_supply/main/constant_charge_current_max
echo "7400000" > /sys/class/power_supply/main/constant_charge_current
echo "7400000" > /sys/class/power_supply/battery/current_max
echo "7400000" > /sys/class/power_supply/battery/constant_charge_current_max
echo "7400000" > /sys/class/power_supply/battery/constant_charge_current
echo "7400000" > /sys/class/power_supply/bms/current_max
echo "7400000" > /sys/class/power_supply/bms/constant_charge_current_max
echo "7400000" > /sys/class/power_supply/bms/constant_charge_current
####################################################

##Other Settings##
#
#Qualcom Touch Boost
#
chmod 644 /sys/module/msm_performance/parameters/touchboost
chmod 644 /sys/power/pnpmgr/touch_boost
echo "1" > /sys/module/msm_performance/parameters/touchboost
echo "1" > /sys/power/pnpmgr/touch_boost

_set_refresh() {
    cmd display set-user-preferred-refresh-rate 120 2>/dev/null || true
    settings put system peak_refresh_rate 120
    settings put system min_refresh_rate 120
}
_set_refresh

#
#Low Mem Killer
#
chmod 644 /sys/module/lowmemorykiller/parameters/enable_lmk
echo "0" > /sys/module/lowmemorykiller/parameters/enable_lmk
#
#snd
#
chmod 644 /sys/module/snd_soc_aw87xxx/parameters/high_perf_mode
echo "1" > /sys/module/snd_soc_aw87xxx/parameters/high_perf_mode
#
#sd card
#
chmod 644 /sys/devices/virtual/bdi/179:0/read_ahead_kb
echo "8192" > /sys/devices/virtual/bdi/179:0/read_ahead_kb
###################################################

#
# THERMAL SPOOF
#
cmd thermalservice override-status 0

for sensor in cpu0 gpu0 npu0 apu0 dsp0 tpu0 vpu0 isp0 spu0 dpu0 pim0 skin pmic0 ddr0 ufs0 modem0 battery; do
    cmd thermalservice inject-temperature CPU light $sensor 120.000
done

# Disable thermal services
 disable_another_thermal() {
    thermal_prop=$(getprop | grep init.svc.*thermal* | cut -d: -f1 | sed 's/[][]//g')
 
  for thermal in $thermal_prop; do
    if [ "$(resetprop "$thermal")" = 'running' ] || [ "$(resetprop "$thermal")" = 'restarting' ]; then
      stop "$(echo "$thermal" | sed 's/init.svc.//')"
    fi
  done
} 

# Function to write values to a file
write () {
    local file="$1"
    local value="$2"
    if [[ -z "$file" || -z "$value" || ! -f "$file" ]]; then
        return 1
    fi
    chmod +w "$file" 2>/dev/null
    echo "$value" > "$file" 2>/dev/null && echo "$file → $value" || return 1
    return 0
}

# Disable GPU frequency limiting
for gpufreq in /proc/gpufreq; do
    if [ -d "$gpufreq" ]; then
        write $gpufreq/gpufreq_power_limited "0"
        write $gpufreq/gpufreq_limited_thermal_ignore "1"
    fi
done

# Disable GPU throttling
for kgsl in /sys/class/kgsl/kgsl-3d0; do
    if [ -d "$kgsl" ]; then
        write $kgsl/throttling "0"
        write $kgsl/thermal_pwrlevel "0"
    fi
done

# // modifying the GPU / DDR temperature 105°C
  for THERMAL_ZONE in `ls /sys/class/thermal/thermal_zone*/type`; do
	 if cat $THERMAL_ZONE | grep -E "gpu|ddr" >/dev/null; then
		for TRIP_POINT_TEMP in `ls ${THERMAL_ZONE%/*}/trip_point_*_temp`; do
			if [ "$(cat $TRIP_POINT_TEMP)" -lt "$SET_TRIP_POINT_TEMP_MAX" ]; then
				echo "$SET_TRIP_POINT_TEMP_MAX" > $TRIP_POINT_TEMP
			fi
		done
	 fi
  done
  
# Config gpu thermal
(
cmd package bg-dexopt-job thermal cutoff
setprop pm.dexopt.disable_bg_dexopt true
cmd device_config put dalvik dexopt disable_bg_dexopt true
pm bg-dexopt-job-disable
cmd device_config put dalvik vm.dexopt thermal_cutoff 0
dumpsys device_config
cmd power set-fixed-performance-mode-enabled true
cmd power set-adaptive-power-saver-enabled false
cmd power set-mode 0
cmd device_config put thermal high_temp_limit 150
cmd device_config put thermal low_temp_limit 150
cmd shortcut reset-throttling
cmd shortcut reset-all-throttling
dumpsys device_config
) >/dev/null 2>&1 &

# Adjust GPU throttling temperature
setprop vendor.gpu.thermal.temp 150

# Disable throttling
echo 0 > /sys/class/kgsl/kgsl-3d0/throttling

# Disable thermal service 
for thermsvc in $(getprop | grep init.svc.*thermal* | cut -d: -f1 | sed 's/[][]//g'); do
    resetprop -n "$thermsvc" "stopped"
done

# Deactivate thermal properties
for thermsys in $(getprop | grep sys.*thermal* | cut -d: -f1 | sed 's/[][]//g'); do
    resetprop -n "$thermsys" "0"
done

# Deactivate thermal zone 
for thermmode in /sys/devices/virtual/thermal/thermal_zone*/mode; do
    write "$thermmode" "disabled"
done

# Disable msm_thermal
  find /sys -name enabled | grep 'msm_thermal' | while IFS= read -r msm_thermal_status; do
    if [ "$(cat "$msm_thermal_status")" = 'Y' ]; then
      echo 'N' > "$msm_thermal_status"
    fi
    if [ "$(cat "$msm_thermal_status")" = '1' ]; then
      echo '0' > "$msm_thermal_status"
    fi
  done

  for thermdevmode in /sys/devices/virtual/thermal/thermal_zone*/mode; do
    chmod -R 644 $thermdevmode
    echo "disabled" > $thermdevmode
  done

  for all_thermal in /sys/devices/virtual/thermal/thermal_zone*; do
    chmod -R 000 $all_thermal
  done

  for all_thermal in /sys/devices/virtual/hwmon/hwmon*; do
    chmod -R 000 $all_thermal
  done

  for all_thermal in /sys/firmware/devicetree/base/soc/qcom,limit_info*; do
    chmod -R 000 $all_thermal
  done
  
  for all_thermal in $(find /sys/firmware/devicetree/base/soc/qcom,msm-thermal/ -name *temp*); do
    chmod 000 $all_thermal
  done
  
  for all_thermal in /sys/firmware/devicetree/base/soc/qcom,msm-thermal/; do
    chmod 000 $all_thermal/name
  done
  
  for all_thermal in $(find /sys/devices/soc/*/kgsl/kgsl-3d0/ -name *temp*); do
    chmod 000 $all_thermal
  done

# Other thermal disables
  for sched in /proc/sys/kernel/sched_boost; do
    echo "0" > $sched
  done
  
# Disable Via Props  
  if resetprop dalvik.vm.dexopt.thermal-cutoff | grep -q '2'; then
    resetprop -n dalvik.vm.dexopt.thermal-cutoff 0
  fi
  
  if resetprop sys.thermal.enable | grep -q 'true'; then
    resetprop -n sys.thermal.enable false
  fi
  
  if resetprop ro.thermal_warmreset | grep -q 'true'; then
    resetprop -n ro.thermal_warmreset false
  fi

  for sched_schedstats in $(find /proc/sys/ -name sched_schedstats); do
    echo "0" > $sched_schedstats
  done

  for printk in $(find /proc/sys/ -name printk); do
    echo "0 0 0 0" > $printk
  done

  for printk_devkmsg in $(find /proc/sys/ -name printk_devkmsg); do
    echo "off" > $printk_devkmsg
  done

  for compat_log in $(find /proc/sys/ -name compat-log); do
    echo "0" > $compat_log
  done

  for tracing_on in $(find /proc/sys/ -name tracing_on); do
    echo "0" $tracing_on
  done

  for log_level in $(find /sys/ -name log_level*); do
    echo "0" > $log_level
  done

  for debug_mask in $(find /sys/ -name debug_mask); do
    echo "0" > $debug_mask
  done

  for debug_level in $(find /sys/ -name debug_level); do
    echo "0" > $debug_level
  done

  for log_ue in $(find /sys/ -name *log_ue*); do
    echo "0" > $log_ue
  done

  for log_ce in $(find /sys/ -name *log_ce*); do
    echo "0" > $log_ce
  done

  for edac_mc_log in $(find /sys/ -name edac_mc_log*); do
    echo "0" > $edac_mc_log
  done

  for enable_event_log in $(find /sys/ -name enable_event_log); do
    echo "0" > $enable_event_log
  done

  for log_ecn_error in $(find /sys/ -name log_ecn_error); do
    echo "0" > $log_ecn_error
  done

  for sec_log in $(find /sys/ -name sec_log*); do
    echo "0" > $sec_log
  done

  for snapshot_crashdumper in $(find /sys/ -name snapshot_crashdumper); do
    echo "0" > $snapshot_crashdumper
  done
 }

# Adjust battery temperature threshold
setprop persist.sys.battery.temp_high 90

# Universal Thermal Disabler
echo 0 > /sys/class/thermal/thermal_zone*/mode
sleep 1
# Thermal Stop Setprop Methode
setprop init.svc.thermal stopped
setprop init.svc.thermal-managers stopped
setprop init.svc.thermal_manager stopped
setprop init.svc.thermal_mnt_hal_service stopped
setprop init.svc.thermal-stopped running
setprop init.svc.mi-thermald running 
setprop init.svc.thermalloadalgod stopped
setprop init.svc.thermalservice running
setprop init.svc.thermal-hal running 
setprop init.svc.vendor.thermal-symlinks stoped 
setprop init.svc.android.thermal-hal stopped
setprop init.svc.vendor.thermal-hal running
setprop init.svc.thermal-manager stopped
setprop init.svc.vendor-thermal-hal-1-0 stopped
setprop init.svc.vendor.thermal-hal-1-0 stopped
setprop init.svc.vendor.thermal-hal-2-0 stopped
setprop init.svc.android.thermal-hal stopped
setprop init.svc.thermel-enggine stopped
setprop init.svc.vendor.thermal-enggine stopped
sleep 1
# Thermal Stop Semi-auto Methode
sleep 12
stop logd
sleep 1
stop vendor.thermal-engine
sleep 1
stop vendor.thermal_manager
sleep 1
stop vendor.thermal-manager
sleep 1
stop vendor.thermal-hal-2-0
sleep 1
stop vendor.thermal-symlinks
sleep 1
stop thermal_mnt_hal_service
sleep 1
stop thermal
sleep 1
stop mi_thermald
sleep 1
stop thermald
sleep 1
stop thermalloadalgod
sleep 1
stop thermalservice
sleep 1
stop sec-thermal-1-0
sleep 1
stop debug_pid.sec-thermal-1-0
sleep 1
stop thermal-engine
sleep 1
stop vendor.thermal-hal-1-0
sleep 1
stop android.thermal-hal
sleep 1
stop vendor-thermal-1-0
sleep 1
stop thermal-hal
sleep 1
stop android.thermal-hal

# Deactivate other thermal functions
echo 0 > /proc/sys/kernel/sched_boost

# Remove cache thermal
rm -f /data/vendor/thermal/config
rm -f /data/vendor/thermal/thermal.dump
rm -f /data/vendor/thermal/thermal_history.dump

sleep 10

su -lp 2000 -c "cmd notification post -S bigtext -t 'Adreno 618 Tweaks' 'Tag' 'A618T Successfully Installed!!'" > /dev/null 2>&1

exit 0