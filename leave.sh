a=$(echo "Sleep\nLock\nLogout\nRestart\nShutdow" | rofi -dmenu -font "lato 18" -i -p "⏻")
if [ $a = "Sleep" ]; then
	#sudo systemctl suspend
	#sh $HOME/.scripts/lock.sh && sudo systemctl suspend
	#sh $HOME/.scripts/locki3.sh
	sudo systemctl suspend
	#sudo systemctl suspend
elif [ $a = "Logout" ]; then
	i3-msg exit
elif [ $a = "Lock" ]; then
	sh $HOME/.scripts/lock.sh
elif [ $a = "Restart" ]; then
	sudo reboot
elif [ $a = "Shutdown" ]; then
	sudo /sbin/shutdown -h now
fi
