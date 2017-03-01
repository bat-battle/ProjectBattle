# Makefile for QT-O1 application
CC = gcc
TARGET_CLIENT=client
TARGET_SERVICE=service
all:

	$(CC) client.c -o $(TARGET_CLIENT)
	$(CC) service.c -o $(TARGET_SERVICE)
               
#	$(STRIP) $(TARGET1)	
clean:
	rm -f *.o

realclean:
	rm -f *.o
	rm -f *.wifi
 
