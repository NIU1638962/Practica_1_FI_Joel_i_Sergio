#! /bin/bash
cut -f1-11,13-15 CAvideos.csv>CAvideos1.csv
awk '$12!=True && $12!=False' CAvideos1.csv>CAvideos2.csv
awk '$14!=True' CAvideos2.csv>CAvideos3.csv
