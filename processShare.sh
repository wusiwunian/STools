#!/bin/bash
file_name="win7-1.img"
total_size=40480
current_size=`du win7.img -m | awk '{print $1}'` > /dev/null
echo $current_size

num=0  
num_cur=0
str='#'  
max=100  
pro=('|' '/' '-' '\')  
while [ $num -le $max ]  
do  
	((color=30+num%8))  
	echo -en "\e[1;"$color"m"  
	let index=num%4  
	printf "[%-100s %d%% %c] %d/%d\r" "$str" "$num" "${pro[$index]}" "$current_size" "$total_size"
	current_size=`du $file_name -m | awk '{print $1}'` > /dev/null
	((num_cur=$current_size*100/$total_size))
	if [ $num -lt $num_cur ]; then
		((num=$num+1))
		str+='#'  
	fi
	sleep 0.1  
done  
printf "\n"  
echo -e "\e[1;30;m"
