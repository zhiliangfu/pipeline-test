Rscript /Users/ling/Desktop/pipeline_test/1.count_normalize/data_normalize_20220819.R \
	 -c /Users/ling/Desktop/pipeline_test/test/datasets/count.csv \
	 -l /Users/ling/Desktop/pipeline_test/test/datasets/gene_length.csv \
	 -m TPM \
	 -t 5 \
	 -o /Users/ling/Desktop/pipeline_test/test/results/1.data_normalize

	
Rscript /Users/ling/Desktop/pipeline_test/2.pca/pca_20220819.R \
	 -m /Users/ling/Desktop/pipeline_test/test/datasets/count.csv \
	 -i /Users/ling/Desktop/pipeline_test/test/datasets/meta.csv \
	 -c Group \
	 -s Group \
	 -o /Users/ling/Desktop/pipeline_test/test/results/2.pca

	
Rscript /Users/ling/Desktop/pipeline_test/3.deg/deg_20220819.R \
	 -m /Users/ling/Desktop/pipeline_test/test/datasets/count.csv \
	 -i /Users/ling/Desktop/pipeline_test/test/datasets/meta.csv \
	 -c NC \
	 -t Treat \
	 -o /Users/ling/Desktop/pipeline_test/test/results/3.deg
