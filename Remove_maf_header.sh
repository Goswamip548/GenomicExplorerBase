#!/bin/bash
for i in *.maf
do
id=$(echo $i | cut -d '_' -f1)
tail -n +3 $i > ${id}adeno.maf
done