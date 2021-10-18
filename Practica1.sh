#! /bin/bash
if [ $# -eq 0 ]; then
	cut -d, -f1-11,13-15 CAvideos.csv>CAvideos1.csv
	awk -F',' 'NR==1 || $12=="True" || $12=="False"' CAvideos1.csv>CAvideos2.csv
	awk -F',' 'NR==1 || $14!="True"' CAvideos2.csv>CAvideos3.csv
	awk -F"," 'BEGIN { OFS = "," } NR==1 {$15="Ranking_Views"; print} NR!=1 && $8<=1000000 {$15="Bueno"; print} NR!=1 && $8>1000000 && $8<=10000000 {$15="Excelente"; print} NR!=1 && $8>10000000 {$15="Estrella"; print}' CAvideos3.csv > CAvideos4.csv
	tr [,] [%]<CAvideos4.csv>CAvideos5.csv
	awk -F"%" 'BEGIN { OFS = "%" } NR==1 {$16="Rlikes"; print} NR!=1 {$16=($9*100)/$8; print}' CAvideos5.csv > CAvideos6.csv
	awk -F"%" 'BEGIN { OFS = "%" } NR==1 {$17="Rdislikes"; print} NR!=1 {$17=($10*100)/$8; print}' CAvideos6.csv > CAvideos7.csv
	tr [,] [.]<CAvideos7.csv>CAvideos8.csv
	tr [%] [,]<CAvideos8.csv>CAvideos9.csv
else
	registre=$(grep "^$@" CAvideos.csv)
	echo ${registre:-"El registre amb identificador $@ no existeix."}
fi
