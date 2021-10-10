#! /bin/bash
cut -d, -f1-11,13-15 CAvideos.csv>CAvideos1.csv
awk -F',' ' { print S1,S2 }' CAvideos.csv | wc -l
