# merge
final.csv: merge.R oecd.csv wdi.csv
	Rscript --vanilla $^ $@

# clean
wdi.csv: clean_wdi.R wdi_raw.csv
	Rscript --vanilla $^ $@

oecd.csv: clean_oecd.R raw/oecd_raw.csv
	Rscript --vanilla $^ $@

# download
wdi_raw.csv: get_wdi.R
	Rscript --vanilla $^ $@

# clean
clean: 
	rm -f *.csv