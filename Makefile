CC = gcc
CFLAGS = -Wall -Wextra -g -lmraa -lm

.PHONY: check

default: build

build:
	$(CC) $(CFLAGS) -o lab4b lab4b.c

invalid_check:
	echo "... testing invalid option"
	@./lab4b --xxx > /dev/null || \
	if [ $$? -eq 1 ]; \
	then \
		echo -e "PASSED\n"; \
	else \
		echo -e "FAILED\n"; \
	fi

	echo "... testing invalid argument"
	@./lab4b --scale=X > /dev/null || \
	if [ $$? -eq 1 ]; \
	then \
		echo -e "PASSED\n"; \
	else \
		echo -e "FAILED\n"; \
	fi

normal_check: .SHELLFLAGS = -c eval
normal_check: SHELL = bash -c 'eval "$${@//\\\\/}"'
normal_check:
	echo "... testing --scale=C --period=3 --log=test.log"
	@./lab4b --scale=C --period=3 --log=test.log <<- EOF \
	SCALE=F \
	PERIOD=1 \
	STOP \
	START \
	LOG TESTING XXXXXX?OFF \
	EOF

	@if [ $$? -eq 0 ]; \
	then \
		echo -e "PASSED"; \
	else \
		echo -e "FAILED"; \
	fi
	@rm -f test.log

check: build invalid_check normal_check

clean:
	@rm -f lab4b-204955724.tar.gz lab4b *.log

dist: build
	@tar -czf lab4b-204955724.tar.gz lab4b.c README Makefile
