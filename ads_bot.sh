#!/bin/sh
> ad_final_list.txt

c=$(sed -n '$=' links.txt)

for ((i=1; i<=c; i++))
do
    url=$(sed -n "$i p" links.txt)
    curl $url >> ad_list.txt
    
done

d=$(sed -n '$=' ad_extra.txt)

for ((w=1; w<=d; w++))
do
    ad_extra=$(sed -n "$w p" ad_extra.txt)
    echo "$ad_extra" >> ad_list.txt
    
done

e=$(sed -n '$=' ad_excluded.txt)

for ((f=1; f<=e; f++))
do
    excluded=$(sed -n "$f p" ad_extra.txt)
    sed "s/\<$excluded\>//g" ad_list.txt > ad_list_2.txt
    
done

sed 's/\localhost//g;s/\#.*/#/;s/\#//g;s/\::1//g;s/\=//g;' ad_list_2.txt > ad_list.txt

awk '{print $NF}'  ad_list.txt > ad_list_2.txt

sed 's/ //g;' ad_list_2.txt >ad_list.txt

sort -u ad_list.txt > ad_final_list.txt

rm ad_list.txt
rm ad_list_2.txt