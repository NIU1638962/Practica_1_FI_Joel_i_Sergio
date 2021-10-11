#! /bin/bash
cut -d, -f1-11,13-15 CAvideos.csv>CAvideos1.csv
awk -F',' 'NR==1 || $12=="True" || $12=="False && $14!="True""' CAvideos1.csv>CAvideos2.csv
