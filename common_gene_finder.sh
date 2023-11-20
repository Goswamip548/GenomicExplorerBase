#!/bin/bash
#PG 
#mutated genes per sample is stored as $sample_mutgenes, extracted from awk command, awk '{print $1}' after removing headers.
for i in *mutgenes
do
sampleid=$(echo $i | cut -d '_' -f1)
comm -12 <(sort $i) <(sort bothOGTSG)> ${sampleid}_both.txt
comm -12 <(sort $i) <(sort tsg)> ${sampleid}_tsg.txt
comm -12 <(sort $i) <(sort og)> ${sampleid}_og.txt
comm -12 <(sort $i) <(sort neither)> ${sampleid}_pathgenes.txt
done
number of cancer genes mapping is presented as a table:
#!/bin/bash
#PG

input_dir="/home/genomebuster/poulami/CRC_conventional/commonOG_TSG/oncokb"

output_file="cancergenes_distribution.tsv"

echo -e "Sample\tBoth\tPathGenes\tOG\tTSG\tTotalMutations" > "$output_file"

for file in "$input_dir"/*_both.txt; do
    sample_name=$(basename "$file" | cut -d'_' -f1)
    both_count=$(wc -l < "$file")
    pathgenes_count=$(wc -l < "$input_dir/${sample_name}_pathgenes.txt")
    og_count=$(wc -l < "$input_dir/${sample_name}_og.txt")
    tsg_count=$(wc -l < "$input_dir/${sample_name}_tsg.txt")
    total_count=$(wc -l < "$input_dir/${sample_name}_mutgenes")
    
    echo -e "$sample_name\t$both_count\t$pathgenes_count\t$og_count\t$tsg_count\t$total_count" >> "$output_file"
done