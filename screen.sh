a=$(echo "Home\nOffice\nInternal\nCancel" | rofi -dmenu -font "lato 18" -i -p "Select screen")
if [ $a = "Home" ]; then
  sh $HOME/.screenlayout/home.sh
elif [ $a = "Office" ]; then
  sh $HOME/.screenlayout/office.sh
elif [ $a = "Above" ]; then
  sh $HOME/.screenlayout/above.sh
elif [ $a = "Internal" ]; then
  sh $HOME/.screenlayout/internal.sh
fi
