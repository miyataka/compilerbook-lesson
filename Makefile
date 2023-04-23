CFLAGS=-std=c11 -g -fno-common

chibicc: main.o
	$(CC) -o chibicc main.o $(LDFLAGS)

test: chibicc
	./test.sh

clean:
	rm -f chibicc *.o *~ tmp*

dockertest:
	docker run -it -v $(PWD):/9cc -w /9cc compilerbook make test

ssh:
	./scripts/instance-start.sh
	./scripts/setup.sh

.PHONY: test clean dockertest
