# generate shell script

source config

# create dir
data_normalize_out=$out/1.data_normalize
pca_out=$out/2.pca
deg_out=$out/3.deg

if [ ! -d $data_normalize_out ]; then mkdir -p $data_normalize_out; fi
if [ ! -d $pca_out ]; then mkdir -p $pca_out; fi
if [ ! -d $deg_out ]; then mkdir -p $deg_out; fi


# data normalize
echo -e "Rscript $data_normalize_r \ \n\t -c $matrix \ \n\t -l $length \ \n\t -m $normalized_method \ \n\t -t $threads \ \n\t -o $data_normalize_out" | sed 's/\\[ ]*$/\\/g' > $data_normalize_out/run_data_normalize.sh

# pca
echo -e "Rscript $pca_r \ \n\t -m $matrix \ \n\t -i $meta \ \n\t -c $pca_color \ \n\t -s $pca_shape \ \n\t -o $pca_out" | sed 's/\\[ ]*$/\\/g' > $pca_out/run_pca.sh

# deg
if [ ! $batch ]; then
    echo -e "Rscript $deg_r \ \n\t -m $matrix \ \n\t -i $meta \ \n\t -c $con \ \n\t -t $treat \ \n\t -o $deg_out" | sed 's/\\[ ]*$/\\/g' > $deg_out/run_deg.sh 
else
    echo -e "Rscript $deg_r \ \n\t -m $matrix \ \n\t -i $meta \ \n\t -c $con \ \n\t -t $treat \ \n\t -b $batch \ \n\t -o $deg_out" | sed 's/\\[ ]*$/\\/g' > $deg_out/run_deg.sh
fi



# 简易版
cat $data_normalize_out/run_data_normalize.sh > $out/../script/2.run.sh 
echo -e "\n\t" >> $out/../script/2.run.sh

cat $pca_out/run_pca.sh >> $out/../script/2.run.sh 
echo -e "\n\t" >> $out/../script/2.run.sh

cat $deg_out/run_deg.sh >> $out/../script/2.run.sh

nohup bash $out/../script/2.run.sh > $out/../script/2.run.log 2>&1 &