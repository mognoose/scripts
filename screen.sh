
layouts=$(ls $HOME/.screenlayout)

choice=$(echo $layouts | rofi -dmenu -sep ' ' -font "lato 18" -i -p 'Select screen:')

echo $choice

if [ "$choice" ]; then
    sh $HOME/.screenlayout/$choice && sh $HOME/.screenlayout/restore.sh

else
    echo "Program terminated." && exit 1
fi

# sh $HOME/.screenlayout/restore.sh

# a=$(echo "Home\nOffice\nInternal\nCancel" | rofi -dmenu -font "lato 18" -i -p "Select screen")
# if [ $a = "Home" ]; then
#   sh $HOME/.screenlayout/home.sh
# elif [ $a = "Office" ]; then
#   sh $HOME/.screenlayout/office.sh
# elif [ $a = "Above" ]; then
#   sh $HOME/.screenlayout/above.sh
# elif [ $a = "Internal" ]; then
#   sh $HOME/.screenlayout/internal.sh
# fi
