#!/bin/bash
#PG
for i in *.vcf
do
sampleid=$(echo $i | cut -d "." -f1)
grep -v '^#' $i > ${sampleid}_variants
grep -o 'GnomAD:[^|;]*' ${sampleid}_variants > ${sampleid}_gnomad
grep -o '1000Genomes:[^|;]*' ${sampleid}_variants > ${sampleid}_1000g
done