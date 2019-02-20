INSTALLDIR=/usr/local/bin
PYCOMPILER=nuitka3
ARGS=


all:
	$(PYCOMPILER) $(ARGS) subcount.py -o subcount

install: all
	install -Dm755 subcount $(INSTALLDIR)

clean:
	rm subcount
	rm -r subcount.build
