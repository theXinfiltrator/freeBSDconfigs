xset b off
setxkbmap -option ctrl:nocaps
xmodmap -e "clear Mod1"
xmodmap -e "keycode 64 = Escape"
ulimit -Sc 0
hsetroot -fill /home/rookie/.img.jpg
bash /home/rookie/.lemonbar.sh | lemonbar -p -g 1920x26+0+0 -F#abb2bf -B#D9000000 -f "Noto Sans Mono"-16 -f FontAwesome-16 -d &
xbindkeys &
xcompmgr &
exec cwm
