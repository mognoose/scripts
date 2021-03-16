natural=1
tapping=1
middlebutton=1

#Touchpad id
id=$(xinput --list | grep Touch | awk {'print $6'} | sed 's/id=//g')
#Tapping enabled
tap=$(xinput --list-props $id | grep "Tapping Enabled (" | awk {'print $4'} | sed 's/(//g; s/)://g')
#natural scrolling enabled
nat=$(xinput --list-props $id | grep "Natural Scrolling Enabled (" | awk {'print $5'} | sed 's/(//g; s/)://g')
#middlebutton emulation enabled
mid=$(xinput --list-props $id | grep "Middle Emulation Enabled (" | awk {'print $5'} | sed 's/(//g; s/)://g')

xinput --set-prop $id $tap $tapping &&
xinput --set-prop $id $nat $natural &&
xinput --set-prop $id $mid $middlebutton

echo "done"
