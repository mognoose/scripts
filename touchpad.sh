if [ -z $1 ]
  then
    tap=1
  else
    tap=$1
fi
if [ -z $2 ]
  then
    nat=1
  else
    nat=$2
fi
if [ -z $3 ]
  then
    mid=1
  else
    mid=$3
fi

#Touchpad id
echo "Getting touchpad id"
id=$(xinput --list | grep -m 1 Touch | awk {'print $6'} | sed 's/id=//g')
echo "Touchpad id: $id"
echo "setting props: tap:$tap, nat:$nat, mid:$mid"
xinput --set-prop $id "libinput Tapping Enabled" $tap
xinput --set-prop $id "libinput Natural Scrolling Enabled" $nat
xinput --set-prop $id "libinput Middle Emulation Enabled" $mid
xinput --list-props $id | grep "libinput Tapping Enabled ("
xinput --list-props $id | grep "libinput Natural Scrolling Enabled ("
xinput --list-props $id | grep "libinput Middle Emulation Enabled ("
echo "done"
