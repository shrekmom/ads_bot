#!/bin/sh
> ad_final_list.txt

c=$(sed -n '$=' links.txt)

for ((i=1; i<=c; i++))
do
    url=$(sed -n "$i p" links.txt)
    curl $url >> ad_list.txt
    
done

sed 's/\localhost//g;s/\#.*/#/;s/\#//g;s/\::1//g;s/\=//g;' ad_list.txt > ad_list_2.txt

awk '{print $NF}'  ad_list_2.txt > ad_list.txt

sed 's/ //g;' ad_list.txt > ad_list_2.txt

sort -u ad_list_2.txt > ad_final_list.txt

rm ad_list.txt
rm ad_list_2.txt