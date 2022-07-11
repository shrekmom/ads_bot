#!/bin/sh
> ad_final_list.txt

c=$(sed -n '$=' links.txt)

for ((i=1; i<=c; i++))
do
    url=$(sed -n "$i p" links.txt)
    curl $url >> ad_list.txt
    
    sleep 1
done


sed 's/\localhost//g;/^#/d;s/\::1//g;s/\=//g;s/\-//g;s/\([127]*\.[0]*\.[0]*\.[1]*\)//g;s/ //g;/^$/d;s/\([0]*\.[0]*\.[0]*\.[0]*\)//g' ad_list.txt > ad_list_2.txt

perl -CIOED -p -e 's/\p{Script_Extensions=Han}/$& /g' ad_list_2.txt > ad_list.txt

sort -u ad_list.txt > ad_final_list.txt

rm ad_list.txt 
rm ad_list_2.txt

echo "$(<ad_final_list.txt )"