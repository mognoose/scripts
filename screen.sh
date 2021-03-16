a=$(echo "External\nAbove\nInternal\nCancel" | rofi -dmenu -font "lato 18" -i -p "Select screen")
if [ $a = "External" ]
then
	sh $HOME/.screenlayout/external.sh
elif [ $a = "Above" ]
then
	sh $HOME/.screenlayout/exabove.sh
elif [ $a = "Internal" ]
then
	sh $HOME/.screenlayout/internal.sh
fi
