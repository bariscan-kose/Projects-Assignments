#define _GNU_SOURCE
#define MAX 4
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <pthread.h>
//#include <time.h>
#include <stdbool.h>
#include <semaphore.h>

void *rideShare (void* thread_args);
char checkBuffer();
void put(char team);
char get();


char buffer[MAX];
int fill=0;
int goodjob =0;


pthread_barrier_t barrier1;  
pthread_barrier_t barrier2;
pthread_barrier_t barrier3;
pthread_barrier_t barrier4;
sem_t mutex;

void put(char team)
{
	buffer[fill]=team;
	fill=(fill+1)%MAX;
}

/*char get()
{
	char tmp;
	tmp=buffer[use];
	use=(use+1)%MAX;
}*/

char checkBuffer()
{	
	int counterA=0;
	int counterB=0;
	for(int i = 0 ; i < MAX; i++)
	{
		if(buffer[i]=='A') counterA++;
		else if(buffer[i]=='B') counterB++;
	}
	//printf("BUFFER : %s\n" , buffer);
	if(counterA==4) return 'C';
	else if (counterB==4) return 'C';
	else if (counterA==2) return 'C';
	else if (counterB==1) return 'B';
	else if (counterA==1) return 'A';
	else return 'D';
}

void *rideShare (void *thread_args)
{
  char * argument= thread_args;
  char thread_arg=*argument;
  int phase=0;
  bool repeater=false;
  while(phase==0)
  { 
 		goodjob=0;
  	pthread_barrier_wait(&barrier1);
  	//sem_wait(&semaph1);
  	sem_wait(&mutex);
  	put(thread_arg);
  	checkBuffer();
  	//printf("%c PUT IN BUFFER\n",thread_arg);
  	if(!repeater) printf("Thread ID: %d, Team: %c, I am looking for a car.\n",gettid(),thread_arg);
  	sem_post(&mutex);
  	//sem_post(&semaph2);
  	  	
 		pthread_barrier_wait(&barrier2);
  
		sem_wait(&mutex);
		if(buffer[MAX-1] != ' ' && checkBuffer()=='C')
		{	
			goodjob=1;
			//printf("PHASE ADVANCED\n");
		}
		
		if(goodjob) phase=1;
		
		fill=0;
		for(int i= 0 ; i < MAX; i++)
		{
				buffer[i]=' ';
		}
		sem_post(&mutex);
	}
		
  if(phase==1)
  {
  	pthread_barrier_wait(&barrier3);
  	printf("Thread ID: %d, Team: %c, I have found a spot in a car.\n",gettid(),thread_arg);
  
  	pthread_barrier_wait(&barrier4); 
		if(gettid()%4==0)
  	{
  		printf("Thread ID: %d, Team: %c, I am the captain and driving the car.\n",gettid(),thread_arg);
  		
	  }
	}
	return 0 ;
}

int main (int argc, char *argv[])
{
  
  int numA = atoi(argv[1]);
  int numB = atoi(argv[2]);
  printf("numA: %d, numB: %d\n",numA,numB);

  if (numA%2!=0 || numB%2!=0 || (numA+numB) %4!=0)
  {
    printf("Initial arguments not valid.\n");
    printf("The main terminates.\n");
    return 1;
  }
  
  for(int i = 0 ; i < MAX;i++)
  {
  	buffer[i]=' ';
  }
  
  pthread_t thread_id[(numA+numB)];
  char thread_args[numA+numB];
  
  /*sem_t semaph1,semaph2,mutex;
  sem_init (&semaph1,0,5);
  sem_init (&semaph2,0,-5);*/
  sem_init (&mutex,0,1);
  pthread_barrier_init(&barrier1,NULL,4);
  pthread_barrier_init(&barrier2,NULL,4);
  pthread_barrier_init(&barrier3,NULL,4);
  pthread_barrier_init(&barrier4,NULL,4);
  
  for (int i = 0 ; i < numA;i++)
  {
    thread_args[i]='A';
    pthread_create(&thread_id[i],NULL,rideShare,&thread_args[i]);
  }
  
  for (int i = numA ; i < numA+numB;i++)
  { 
    thread_args[i]='B';
    pthread_create(&thread_id[i],NULL,rideShare,&thread_args[i]);
  } 
  
  for (int i = 0 ; i < numA+numB;i++)
  { 
    pthread_join (thread_id[i], NULL);
  }   
  
  pthread_barrier_destroy(&barrier1);
  pthread_barrier_destroy(&barrier2);
  pthread_barrier_destroy(&barrier3);
  pthread_barrier_destroy(&barrier4);
  printf ("The main terminates\n");
  return 0;
  
}

