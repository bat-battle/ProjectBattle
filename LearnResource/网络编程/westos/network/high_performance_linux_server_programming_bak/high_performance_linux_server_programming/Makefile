#需要包含的头文件
INCLUS = -I.

all : byteorder testlisten testaccept testoobrecv testoobsend

byteorder : byteorder.o
testlisten : testlisten.o
testaccept : testaccept.o

testoobrecv : testoobrecv.o
testoobsend : testoobsend.o

byteorder.o : byteorder.c
	gcc -c byteorder.c 

testlisten.o : testlisten.c
	gcc -c testlisten.c

testaccept.o : testaccept.c
	gcc -c testaccept.c

testoobrecv.o : testoobrecv.c
	gcc -c testoobrecv.c

testoobsend.o : testoobsend.c
	gcc -c testoobsend.c
    
clean : 
	rm -rf *o byteorder testlisten testaccept testoobrecv testoobsend
