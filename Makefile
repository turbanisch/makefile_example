RAW = data/raw
INT = data/intermediate
FIN = data/final

# merge
$(FIN)/merged.csv: R/merge.R $(INT)/oecd.csv $(INT)/wdi.csv
	Rscript --vanilla $^ $@

# clean
$(INT)/wdi.csv: R/clean_wdi.R $(RAW)/wdi.csv
	Rscript --vanilla $^ $@

$(INT)/oecd.csv: R/clean_oecd.R $(RAW)/oecd.csv
	Rscript --vanilla $^ $@

# download
$(RAW)/oecd.csv: R/get_oecd.R
	Rscript --vanilla $^ $@

$(RAW)/wdi.csv: R/get_wdi.R
	Rscript --vanilla $^ $@

# clean
clean: 
	rm -f $(RAW)/*
	rm -f $(INT)/*
	rm -f $(FIN)/*