head -n +2 115_vep.maf | tail -n +2 > header.maf
sed 's/TUMOR/TUMOR_67/g' 67adeno.maf > 67_adeno.maf
sed 's/TUMOR/TUMOR_99/g' 99adeno.maf > 99_adeno.maf
sed 's/TUMOR/TUMOR_115/g' 115adeno.maf > 115_adeno.maf
sed 's/TUMOR/TUMOR_120/g' 120adeno.maf > 120_adeno.maf
cat header.maf 67_adeno.maf 99_adeno.maf 115_adeno.maf 120_adeno.maf 127_adeno.maf 
129_adeno.maf 130_adeno.maf 140_adeno.maf 152_adeno.maf 162_adeno.maf 168_adeno.maf 
169_adeno.maf > adeno.maf
