NAME  = tikzgamemap
SHELL = bash
PWD   = $(shell pwd)
TEMP := $(shell mktemp -d -t tmp.XXXXXXXXXX)
TDIR  = $(TEMP)/$(NAME)
VERS  = $(shell ltxfileinfo -v $(NAME).dtx|sed -e 's/^v//')
LOCAL = $(shell kpsewhich --var-value TEXMFLOCAL)
UTREE = $(shell kpsewhich --var-value TEXMFHOME)

.PHONY: source clean distclean inst uninst install uninstall zip ctan

all:	$(NAME).pdf

source: $(NAME).dtx
	tex -shell-escape -recorder -interaction=batchmode $(NAME).dtx >/dev/null

$(NAME).pdf: $(NAME).dtx
	lualatex -shell-escape -recorder -interaction=batchmode $(NAME).dtx >/dev/null
	if [ -f $(NAME).glo ]; then makeindex -q -s gglo.ist -o $(NAME).gls $(NAME).glo; fi
	latexmk -pdflua -quiet -shell-escape $(NAME).dtx > /dev/null

clean:
	rm -f $(NAME).{aux,fdb_latexmk,fls,glo,gls,hd,idx,ilg,ind,ins,listing,log,out,tcbtemp}
	rm -rf _minted-$(NAME)
distclean: clean
	rm -f $(NAME).pdf tgm1.sty

inst: all
	mkdir -p $(UTREE)/{tex,source,doc}/latex/$(NAME)
	cp $(NAME).{dtx,ins} $(UTREE)/source/latex/$(NAME)
	cp tgm1.sty $(UTREE)/tex/latex/$(NAME)
	cp $(NAME).pdf README.md $(UTREE)/doc/latex/$(NAME)
	mktexlsr
uninst:
	rm -r $(UTREE)/{tex,source,doc}/latex/$(NAME)
	mktexlsr

install: all
	sudo mkdir -p $(LOCAL)/{tex,source,doc}/latex/$(NAME)
	sudo cp $(NAME).{dtx,ins} $(LOCAL)/source/latex/$(NAME)
	sudo cp tgm1.sty $(LOCAL)/tex/latex/$(NAME)
	sudo cp $(NAME).pdf README.md $(LOCAL)/doc/latex/$(NAME)
	mktexlsr
uninstall:
	sudo rm -r $(LOCAL)/{tex,source,doc}/latex/$(NAME)
	mktexlsr

zip: all
	mkdir $(TDIR)
	cp $(NAME).{pdf,dtx} tgm1.sty README.md Makefile $(TDIR)
	cd $(TEMP); zip -Drq $(PWD)/$(NAME)-$(VERS).zip $(NAME)
ctan: all
	mkdir $(TDIR)
	cp $(NAME).{pdf,dtx} README.md Makefile $(TDIR)
	cd $(TEMP); zip -Drq $(PWD)/$(NAME)-$(VERS).zip $(NAME)
