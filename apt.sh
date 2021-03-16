icon="↻"
update="$(sudo apt update)"
updates="$(apt list --upgradable | grep -v Listing | wc -l)"

if [ $updates = "0" ]
then
$updates = "none"
else
echo $icon $updates
fi
