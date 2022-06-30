#!/bin/sh

sed '/^$/d;/^#/d;s/\://g;s/\=//g;s/\-//g;s/\<localhost\>//g;s/\([0-9]*\.[0-9]*\.[0-9]*\.[0.9]*\)//g;s/[0-9]*//g;s/ //g;' 1.txt > ad_list.txt

echo "$ad_list"
