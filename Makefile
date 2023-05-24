CFLAGS=-std=c11 -g -fno-common
OS=`uname -s`

chibicc: main.o
	$(CC) -o chibicc main.o $(LDFLAGS)

test: chibicc
	./test.sh

clean:
	rm -f chibicc *.o *~ tmp*

image:
	docker build -t compilerbook .

dockertest:
	docker run -it -v $(PWD):/9cc -w /9cc compilerbook make test

ssh:
	./scripts/instance-start.sh
	./scripts/setup.sh

ob-ls:
	objdump -d -M intel /bin/ls

test1:
	cc -o test1 test1.c

ob-test1:
	objdump -d -M intel test1

docker-ob-ls: image
	docker run -it -v $(PWD):/9cc -w /9cc compilerbook objdump -d -M intel /bin/ls

docker-test1: image
	docker run -it -v $(PWD):/9cc -w /9cc compilerbook cc -o test1 test1.c

.PHONY: test clean dockertest
