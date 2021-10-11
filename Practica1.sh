#! /bin/bash
cut -d, -f1-11,13-15 CAvideos.csv>CAvideos1.csv
awk '$12!=True && $12!=False' CAvideos1.csv>CAvideos2.csv
awk '$13!=True && $13!=False' CAvideos2.csv>CAvideos3.csv
awk '$14!=True && $14!=False' CAvideos3.csv>CAvideos4.csv
awk '$14!=True' CAvideos4.csv>CAvideos5.csv
