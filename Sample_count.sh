#!/bin/bash
#PG

for i in *.txt
do
sampleid=$(echo $i | cut -d '.' -f1)
echo $sampleid >> sampleids
exomesize=37

grep -cE '3_prime_UTR_variant|5_prime_UTR_variant|downstream_gene_variant|frameshift_variant|inframe_deletion|intergenic_variant|missense_variant|non_coding_transcript_exon_variant|regulatory_region_variant|splice_donor_region_variant|splice_polypyrimidine_tract_variant|splice_region_variant|stop_gained|TF_binding_site_variant|upstream_gene_variant' $i > ${sampleid}_nonsyn_count
awk "{print \$1/$exomesize}" ${sampleid}_nonsyn_count >> nonsyn_tmb 
paste sampleids nonsyn_tmb > samplewise_nonsyn_tmb

grep "synonymous_variant" $i | wc -l > ${sampleid}_syn_count
awk "{print \$1/$exomesize}" ${sampleid}_syn_count >> syn_tmb
paste sampleids syn_tmb > samplewise_syn_tmb
done

rm sampleids *count