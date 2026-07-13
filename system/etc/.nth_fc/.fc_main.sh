#!/system/bin/sh
#Fast Charge
Set_value()
{
    if [[ -f "$2" ]];
    then
        chmod 0666 "$2"
        echo "$1" > "$2"
        chmod 0444 "$2"
    fi
}
Fast_charge() {
paths=`ls /sys/class/power_supply/*/$1`
for path in $paths
    do
    Set_value $FC $path
done

}
FAST_CHARGE=<PROFILE>
#FAST_CHARGE=6000
FAST_CHARGE1=`expr $FAST_CHARGE + 1000`
FC=`expr $FAST_CHARGE \* 1000`
FCC=`expr $FAST_CHARGE1 \* 1000`
CF=`expr 4000 \* 1000`
BMS=/sys/devices/platform/soc/c440000.qcom,spmi/spmi-0/spmi0-02/c440000.qcom,spmi:qcom,pm8150b@2:qpnp,fg/power_supply/bms

#Set_value $CF $BMS/charge_full
Set_value '0' /sys/class/qcom-battery/restrict_chg

Set_value $FCC /sys/class/qcom-battery/restricted_current
Set_value $FCC /sys/class/qcom-battery/restrict_cur

Fast_charge current_max
Fast_charge hw_current_max
Fast_charge pd_current_max
Fast_charge ctm_current_max
Fast_charge sdp_current_max
Fast_charge constant_charge_current_max

sleep 5
done

