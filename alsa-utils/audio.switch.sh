#!/usr/bin/env bash
#
#
COMMAND=$1

case "$COMMAND" in
    headset)
        echo "Using USB audio device (headsets)"
        pacmd set-default-sink   "alsa_output.usb-GeneralPlus_USB_Audio_Device-00.analog-stereo"
        pacmd set-default-source "alsa_input.usb-GeneralPlus_USB_Audio_Device-00.mono-fallback"
        ;;
    speaker)
        echo "Using system dock (speakers)"
        pacmd set-default-sink   "alsa_output.usb-Lenovo_ThinkPad_Thunderbolt_3_Dock_USB_Audio_000000000000-00.iec958-stereo"
        pacmd set-default-source "alsa_input.usb-046d_C270_HD_WEBCAM_200901010001-02.mono-fallback"
        ;;
    status)
        # "usb-General" must match with your currently used headset-sortof audio device
        STATUS=$(pacmd list-sinks | sed -n -e "/* index/,/name/ p" | grep "usb-General")
        if [ "$STATUS" == "" ]; then
            echo "speakers"
        else
            echo "headsets"
        fi
        ;;
    *)
        echo "Usage: $0 [OPTION]"
        echo "    headset   - Audio headset/mic "
        echo "    speaker   - Speakers/webcam mic"
        echo "    help      - Print this help list"
        echo ""
        ;;
esac
