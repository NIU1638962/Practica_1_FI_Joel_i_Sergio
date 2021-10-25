#! /bin/bash
if [ $# -eq 0 ]; then
	cut -d, -f1-11,13-15 CAvideos.csv>CAvideos1.csv
	awk -F"," 'NR==1 || (($12=="True" || $12=="False") && $14!="True")' CAvideos1.csv>CAvideos2.csv
	awk -F"," 'BEGIN { OFS = "," } NR==1 {$15="Ranking_Views"; print} NR!=1 && $8<=1000000 {$15="Bueno"; print} NR!=1 && $8>1000000 && $8<=10000000 {$15="Excelente"; print} NR!=1 && $8>10000000 {$15="Estrella"; print}' CAvideos2.csv > CAvideos1.csv
	awk '{ gsub(",","¦"); print}' CAvideos1.csv>CAvideos2.csv
	awk -F"¦" 'NR==1 || (($12=="True" || $12=="False") && $14!="True")' CAvideos2.csv>CAvideos1.csv
	awk -F"¦" 'BEGIN { OFS = "¦" } NR==1 {$16="Rlikes"; print} NR!=1 {$16=($9*100)/$8; print}' CAvideos1.csv > CAvideos2.csv
	awk -F"¦" 'BEGIN { OFS = "¦" } NR==1 {$17="Rdislikes"; print} NR!=1 {$17=($10*100)/$8; print}' CAvideos2.csv > CAvideos1.csv
	awk -F"¦" 'BEGIN { OFS = "¦" } { gsub(",",".",$16); print}' CAvideos1.csv>CAvideos2.csv
	awk -F"¦" 'BEGIN { OFS = "¦" } { gsub(",",".",$17); print}' CAvideos2.csv>CAvideos1.csv
	awk '{ gsub("¦",","); print}' CAvideos1.csv>CAvideos_Processat.csv
	rm CAvideos1.csv CAvideos2.csv
else
	registre=$(grep "^$@" CAvideos.csv)
	echo ${registre:-"El registre amb Video_id '$@' no existeix."}
fi
