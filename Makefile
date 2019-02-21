ifeq ($(OS),Windows_NT)     # is Windows_NT on XP, 2000, 7, Vista, 10...
    WIN=--windows-icon=icon.ico
else
    OS= $(shell uname)  # same as "uname -s"
endif

INSTALLDIR=/usr/local/bin
PYCOMPILER=nuitka3
ARGS=


all:
	$(PYCOMPILER) $(ARGS) $(WIN) subcount.py -o subcount

install: all
	install -Dm755 subcount $(INSTALLDIR)

clean:
	rm subcount
	rm -r subcount.build
