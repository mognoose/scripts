mem=$(free -m | awk 'NR==2{printf "%.0f", ($3)/($2)*100 }')
crit=80
if [ $mem -gt 80 ]
then
echo $mem"%"
echo ""
echo "#AA0000"
fi