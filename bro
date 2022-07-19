#!/bin/sh
> ad_final_list.txt

c=$(sed -n '$=' links.txt)

for ((i=1; i<=c; i++))
do
    url=$(sed -n "$i p" links.txt)
    curl $url >> ad_list.txt
    
    sleep 1
done


sed 's/\localhost//g;s/\#.*/#/;s/\#//g;s/\::1//g;s/\=//g;s/\(^(127)*\.(0)*\.(0)*\.(1)*\)//g;/^$/d;s/\(^(0)*\.(0)*\.(0)*\.(0)*\)//g;s/ //g' ad_list.txt > ad_list_2.txt

sort -u ad_list_2.txt > ad_final_list.txt

rm ad_list.txt 
rm ad_list_2.txt