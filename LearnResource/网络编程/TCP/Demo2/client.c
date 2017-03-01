#include<stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <netdb.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <sys/socket.h>

#define BUFSIZE 1000

int main (int argc, char *argv[])
{
  int s;
  int len;
  struct sockaddr_in remote_addr;
  char buf[BUFSIZE];
  memset (&remote_addr, 0, sizeof (remote_addr));
  remote_addr.sin_family = AF_INET;
  remote_addr.sin_addr.s_addr = inet_addr ("127.0.0.1");
  remote_addr.sin_port = htons (6667);
  if ((s = socket (PF_INET, SOCK_STREAM, 0)) < 0)
    {
      perror ("socket");
      return 1;
    }
  if (connect (s, (struct sockaddr *) &remote_addr, sizeof (struct sockaddr)) < 0)
    {
      perror ("connect");
      return 1;
    }
  printf ("connected to server\n");
  len = recv (s, buf, BUFSIZE, 0);
  buf[len] = '\0';
  printf ("%s", buf);
  while (1)
    {
      printf ("Enter string to send:");
      scanf ("%s", buf);
      if (!strcmp (buf, "quit"))
        {
             break;
        }
      len = send (s, buf, strlen (buf), 0);
      len = recv (s, buf, BUFSIZE, 0);
      buf[len] = '\0';
      printf ("received:%s\n", buf);
    }
  close (s);
  return 0;
}
