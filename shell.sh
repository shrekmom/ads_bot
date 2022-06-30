#!/bin/sh

> ad_list.txt

for ((c=1; c<=10; c++))
do
    cat "$c".txt >> ad_list.txt
    
    sleep 1
done


sed '/^$/d;/^#/d;s/\://g;s/\=//g;s/\-//g;s/\<localhost\>//g;s/\([0-9]*\.[0-9]*\.[0-9]*\.[0.9]*\)//g;s/[0-9]*//g;s/ //g;' ad_list.txt > ad_list_2.txt


perl -CIOED -p -e 's/\p{Script_Extensions=Han}/$& /g' ad_list_2.txt > ad_final_list.txt

echo "$ad_final_list"