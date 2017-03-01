#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#define BUFSIZE 1000

int main(int argc, char *argv[])
{
  int s;
  int len;
  int sin_size;
  char buf[BUFSIZE];

  struct sockaddr_in remote_addr;
  memset(&remote_addr, 0, sizeof (remote_addr));
  remote_addr.sin_family = AF_INET;
  remote_addr.sin_addr.s_addr = inet_addr("127.0.0.1");
  remote_addr.sin_port = htons (8000);

  if ((s = socket(PF_INET, SOCK_DGRAM, 0)) < 0)
    {
      perror ("socket");
      return 1;
    }
  strcpy (buf, "This is a test message");
  printf ("sending:%s\n", buf);
  sin_size = sizeof (struct sockaddr_in);
  if ((len =sendto(s, buf, strlen (buf), 0, (struct sockaddr *) &remote_addr,sizeof (struct sockaddr))) < 0)
    {
      perror ("recvfrom");
      return 1;
    }
  close (s);
  return 0;
}
