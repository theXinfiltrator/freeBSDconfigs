#!/bin/sh

while true; do
    WINDOW_ID=$(xprop -root _NET_ACTIVE_WINDOW | awk '/_NET_ACTIVE_WINDOW/ {print $NF}')
    FOCUSED_APP="Desktop"
    if [ "$WINDOW_ID" != "0x0" ]; then
        FOCUSED_APP=$(xprop -id "$WINDOW_ID" WM_CLASS | awk '/WM_CLASS/ {print toupper(substr($NF, 2, 1)) substr($NF, 3)}' | tr -d '"')
    fi

    DATE=$(date "+%b-%d %a %H:%M")

    ACPICONF_OUTPUT=$(acpiconf -i 0)
    BATTERY_SIGN=$(awk '/State:/ {print ($NF == "discharging") ? "B-" : "B+"}' <<< "$ACPICONF_OUTPUT")
    REMAINING_CAPACITY=$(awk '/Remaining capacity:/ {print $3}' <<< "$ACPICONF_OUTPUT")

    WORKSPACE_INFO=$(wmctrl -l | awk '$2 != -1 {print $2}' | sort -n | uniq | tr '\n' ' ')

    CURRENT_WS=$(xdotool get_desktop)

    WORKSPACE_INFO_WITH_STAR=$(echo "$WORKSPACE_INFO" | sed "s/\<$CURRENT_WS\>/*&/")

    echo "%{l} $WORKSPACE_INFO_WITH_STAR| $FOCUSED_APP %{c}$DATE %{r}$BATTERY_SIGN:$REMAINING_CAPACITY "

    sleep 0.1
done
