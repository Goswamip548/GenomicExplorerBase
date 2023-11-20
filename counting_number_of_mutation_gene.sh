#!/bin/bash

# Specify the directory where your files are located
directory="/home/genomebuster/poulami/CRC_conventional/MAF/MAC-SRCC"

# Loop through all gene files in the directory
for gene_file in "$directory"/*_drivergenes; do
    # Extract the sample ID from the gene file name
    sample_id=$(basename "$gene_file" | cut -d'_' -f1)

    # Construct the corresponding data file name
    data_file="${directory}/${sample_id}_mutated_genes"

    # Loop through genes and count occurrences in the data file
    while IFS= read -r gene; do
        count=$(grep -c "$gene" "$data_file")
        echo "$gene     $count" >> ${sample_id}_driver_counts
    done < "$gene_file"
done