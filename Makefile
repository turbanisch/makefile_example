RAW = data/raw

$(RAW)/wdi.rds: R/get_wdi.R
	Rscript --vanilla $^ $@

clean: 
	rm $(RAW)/*