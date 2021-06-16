#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <pthread.h>
#include <time.h>
#include <stdbool.h>
int turn = 1;

pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t cond = PTHREAD_COND_INITIALIZER;

void *playTheGame (void *threadargs);
void displayBoard (char *theBoard, int boardSize);
int checkResults (char *theBoard, int boardSize);

struct arg_struct
{
  char *arg1;
  char *arg2;
  int  *arg3;
};

void
displayBoard (char *theBoard, int boardSize)
{
  int boardSize2 = boardSize * boardSize;
  for (int i = 0; i < boardSize2; i++)
    {
    if( i % boardSize == 0)
    	{
    	printf("\n");
    	}	
    printf ("[%c]", *(theBoard + i));
    }
    printf("\n");
}

void *
playTheGame (void *threadargs)
{
  struct arg_struct *threadarg = threadargs;
  char *theBoard = threadarg->arg1;
  char *message = threadarg->arg2;
  int *boardSize = threadarg->arg3;
  //printf("MESSAGES %s , %c",message,*message);
  int boardSize2 = (*boardSize) * (*boardSize);
  
  pthread_mutex_lock (&mutex);
  
  while (1)
    { if(*message == 'X')
      {
      	while(turn==0)
      	{
      		pthread_cond_wait(&cond,&mutex);
      	}
      }
      else if(*message == 'O')
      {
      	while(turn==1)
      	{
      		pthread_cond_wait(&cond,&mutex);
      	}
      }
      
      int result = checkResults (theBoard, *boardSize);
      
      if (result==1 || result == 2 || result == 3)
	{
	  //printf("CHECKRESULTS RETURNED: %d\n",result);
	  turn=1-turn;
	  pthread_cond_signal(&cond);
	  pthread_mutex_unlock (&mutex);
	  return 0;
	}			//0-Continue 1-X 2-0 3-Tie
      else
	{
	//printf("CHECKRESULTS RETURNED: %d\n",result);
	}	
      
      bool done = false;
      do
	{
	  
	  int randoPlay = rand () % boardSize2;
	  //printf("RANDO PLAY :%d",randoPlay);
	  if (*(theBoard + randoPlay) == ' ')
	    {
	      *(theBoard + randoPlay) = *message;
	      done = true;
	      printf("Player %c played on : (%d,%d)\n",*message,randoPlay/(*boardSize),randoPlay%(*boardSize));
	      //printf("FOUND AN EMPTY SPACE");
	    } 
	} while (!done);
	//printf("DONE IS : %d",done);
      //pthread_cond_signal(&cond);
      turn= 1-turn;
      pthread_cond_signal(&cond);
      pthread_mutex_unlock (&mutex);  
    }
}

int
checkResults (char *theBoard, int boardSize)
{
  //displayBoard (theBoard, boardSize);
  int arraySize = 2 * boardSize + 2;
  char arr[arraySize][boardSize+1];
  bool areThereEmptyPlaces = false;
  int boardSize2 = boardSize * boardSize;
  for (int i = 0; i < arraySize; i++)
  {
  arr[i][boardSize]='\0';
  }
  
  
  for (int i = 0; i < boardSize; i++)
    {
      int k = 0;
      for (int j = i; j < boardSize2; j = j + boardSize)	//COLUMNS
	{
	  arr[i][k] = *(theBoard + j);
	  k++;
	}
      
    }
  
  int boardSize3 = boardSize * 2;
  for (int i = boardSize; i < boardSize3; i++)
    {
      int k = 0;
      int begin = (i - boardSize) * (boardSize);
      int limit = begin + boardSize;
      for (int j = begin; j < limit; j++)	//ROWS
	{
	  arr[i][k] = *(theBoard + j);
	  k++;
	}
    }
    
  int j = 0;
  for (int i = 0; i < boardSize2; i = i + boardSize + 1)
    {
      arr[arraySize-2][j] = *(theBoard + i);
      j++;
      
      //printf("J = %d , I = %d",j,i);
    }
  j = 0;
  for (int i = boardSize - 1; i < boardSize2; i = i + boardSize - 1)
    {
      arr[arraySize-1][j] = *(theBoard + i);
      j++;
      //printf("J = %d , I = %d",j,i);
    } 
  	
   
  char stringX[boardSize+1];
  char stringO[boardSize+1];
  
  for ( int i = 0 ; i < boardSize;i++)
  {
  	stringX[i]='X';
  	//printf("%c",stringX[i]);
  }
  for ( int i = 0 ; i < boardSize;i++)
  {
  	stringO[i]='O';
  	//printf("%c",stringO[i]);
  }
  stringX[boardSize]= '\0';
  stringO[boardSize]= '\0'	;
  
  //printf("X String : '%s', O String : '%s'\n", stringX, stringO);
  
  /*for (int i = 0; i < arraySize; i++)
  {
  printf("ARRAY %d : %s\n", i, arr[i]);
  }
  */
  for (int i = 0; i < arraySize; i++)
    {	
      if (strcmp (arr[i], stringX)==0)
	{
	  return 1;
	}
      else if (strcmp (arr[i], stringO)==0)
	{
	  return 2;
	}
    }
    
  for (int k = 0; k < boardSize2; k++)
    {
      if (*(theBoard + k) == ' ')
	{
	  areThereEmptyPlaces = true;
	  break;
	}
    }

  if (areThereEmptyPlaces)
    {
      return 0;			//CONTINUE
    }
  else if (!areThereEmptyPlaces)
    {
      return 3;			//TIE
    }
  printf("CHECKRESULT RETURNS 4\n");
  return 4;
}

int 
main (int argc, char *argv[])
{


  pthread_t thread1, thread2;
  char message1 = 'X';
  char message2 = 'O';
  bool taken = false;
  int boardSize = atoi (argv[1]);
  //printf("%d\n",boardSize);
  int boardSize2 = boardSize * boardSize;
  srand (time (NULL));

  char *theBoard = malloc ((boardSize2) * sizeof (char));

  if (theBoard == NULL)
    {
      printf ("Memory not allocated.\n");
      exit (1);
    }
  else
    {

      for (int i = 0; i < boardSize2; i++)
	{
	  *(theBoard + i) = ' ';
	  
	} 

      struct arg_struct thread1args, thread2args;

      thread1args.arg1 = theBoard;
      thread1args.arg2 = &message1;
      thread1args.arg3 = &boardSize;

      thread2args.arg1 = theBoard;
      thread2args.arg2 = &message2;
      thread2args.arg3 = &boardSize;
	
      pthread_create (&thread1, NULL, &playTheGame, (void *) &thread1args);
      pthread_create(&thread2, NULL, &playTheGame,(void*)&thread2args);

      pthread_join (thread1, NULL);
      pthread_join (thread2, NULL);

      printf ("Game end\n");

      int totalResult = checkResults (theBoard, boardSize);
      if (totalResult == 1)
	printf ("Winner is X");
      else if (totalResult == 2)
	printf ("Winner is 0");
      else if (totalResult == 3)
	printf ("It is a tie");
      else 
	{
	  printf ("CHECK RESULTS RETURNED WEIRD IN MAIN: %d\n",totalResult);
	}

      displayBoard (theBoard, boardSize);
      
    }
    
  return 0;
  
}

