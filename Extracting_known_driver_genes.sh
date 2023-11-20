#!/bin/bash
for i in *.maf
do
sampleid=$(echo $i | cut -d '_' -f1)
tail -n +2 chrmonly.txt | awk '{print $1}' > driver_gene_list
tail -n +3 $i | awk '{print $1}' > ${sampleid}_mutated_genes
comm -12 <(sort ${sampleid}_mutated_genes) <(sort driver_gene_list) > ${sampleid}_drivergenes
done