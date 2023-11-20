#!/bin/bash
#PG
# Specify the common driver_lengths file
driver_lengths_file="driverlen_own.txt"

# Loop through all drivergenes files
for drivergenes_file in *drivergenes; do
# Extract gene names and lengths, and append to a new file
grep -wf <(cut -f1 "$drivergenes_file") "$driver_lengths_file" | awk 'BEGIN {FS="\t"; OFS="\t"} {print $1, $2}' > "${drivergenes_file}_len"
done