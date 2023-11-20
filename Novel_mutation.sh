#!/bin/bash
for i in *.maf
do 
sampleid=$(echo $i | cut -d '_' -f1)
awk -F'\t' '$14 == "novel" {print}' $i > ${sampleid}_novels
done