#Juntar los dos pasos
awk -F',' 'NR==1 || $12=="True" || $12=="False"' CAvideos_1.csv>CAvideos_2.csv
awk -F',' 'NR==1 || $14!="True"' CAvideos_2.csv>CAvideos_3.csv

#awk -F',' 'NR==1 || $12=="True" && $12=="False" && $14!="True"' CAvideos_1.csv$

awk -F"," 'BEGIN { OFS = "," } NR==1 {$15="Ranking_Views"; print} NR!=1 && $8<=$

#Podriamos hacerlo al principio y conservar más datos
tr [,] [¦]<CAvideos_4.csv>CAvideos_5.csv

awk -F"¦" 'BEGIN { OFS = "¦" } NR==1 {$16="Rlikes"; print} NR!=1 {$16=$9/$8*100$
awk -F"¦" 'BEGIN { OFS = "¦" } NR==1 {$17="Rdislikes"; print} NR!=1 {$17=$10/$8$
tr [,] [.]<CAvideos_7.csv>CAvideos_8.csv
tr [¦] [,]<CAvideos_8.csv>CAvideos_9.csv
