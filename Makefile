all:
	@cd fs && $(MAKE) nc
	@cd bibtex && $(MAKE)
	@cd src && $(MAKE) depend nc

dbs: sdb bdb

sdb:
	mkdir -p content/db
	rm -f content/db/static.db
	./fs/fs2db -db content/db/static.db content/static

bdb:
	rm -f content/db/bib.db
	./bibtex/bib2db content/biblio.bib content/db/bib.db

clean:
	@cd fs && $(MAKE) clean
	@cd bibtex && $(MAKE) clean
	@cd src && $(MAKE) clean
	rm -f content/db/bib.db content/db/static.db
