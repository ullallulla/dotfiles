touch /etc/libinput/local-overrides.quirks

# Disable high resolution scrolling
cat << EOF > /etc/libinput/local-overrides.quirks
[Disable Mouse High Resolution Scrolling]
MatchName=*
AttrEventCode=-REL_WHEEL_HI_RES;-REL_HWHEEL_HI_RES;
EOF
