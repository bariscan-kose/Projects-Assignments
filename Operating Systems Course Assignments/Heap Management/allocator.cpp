#include <string>
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <pthread.h>
#include <semaphore.h>
#include <stdbool.h>
using namespace std;

sem_t sema;

struct node
{
    int threadId,size,index;
    struct node *next;
    struct node *prev;
    node(int x,int y,int z)
    {
        threadId=x;
        size=y;
        index=z;
    }
};

class HeapManager
{
private:
    node *head,*tail;

public:
    HeapManager()
    {
        head = NULL;
        tail = NULL;
    }
    int initHeap(int size) 
    {   
	sem_init(&sema,0,1);
        node* tmp= new node(-1,size,0);
        tmp->prev=NULL;
        tmp->next=NULL;
        head=tmp;
        tail=tmp;
        print();
        return 1;
    }
    int myMalloc(int ID,int size)
    {
    	
        sem_wait(&sema);
        node* it = head;
        int returnIndex;
        
        bool done= false;
        while(it != NULL & !done)
        {
            if(it->threadId == -1)
            {
                if(it->size == size)
                {
                    it->threadId=ID;
                    done=true;
                }
                else if ( it->size > size)
                {
                    node* temp= new node(-1,((it->size) - size),((it->index)+size));
                    temp->next=it->next;
                    if(it->next==NULL)
                    {
                        tail=temp;
                    }
                    temp->prev=it;
                    it->next=temp;
                    it->size=size;
                    it->threadId=ID;
                    done=true;
                    if(it->prev==NULL)
                    {
                        head=it;
                    }
                    returnIndex=it->index;
                }
            }
            it=it->next;
        }
        if(done)
        {cout << "Allocated for thread" << ID << "\n"; }
        else if (!done)
        {cout << "Can not allocate, requested size " <<size << " for thread " << ID<<" is bigger than remaining size\n";}
        print();
        
        sem_post(&sema);
        if(done) return returnIndex;
        else return -1;
        
    }
    int myFree(int ID,int index)
    {
    
        sem_wait(&sema);
        node* it = head;
        bool done=false;
        while (it != NULL && !done)
        {
            if(it->index == index && it->threadId==ID)
            {
                it->threadId=-1;
                while( (it->prev != NULL && it->prev->threadId == (-1)) || (it->next != NULL && it->next->threadId == (-1)))
                {
                    if(it->prev != NULL && it->prev->threadId == (-1))
                    {   
                        it->prev->size = it->size + it->prev->size;
                        node* tmp= it;
                        it->prev->next=it->next;
                        if(it->next != NULL)
                        {
                            it->next->prev=it->prev;
                        }
                        it=it->prev;
                        delete tmp;
                        if(it->next == NULL)
                        {
                            tail=it;
                        }

                    }
                    else if (it->next != NULL && it->next->threadId == (-1))
                    {   
                        it=it->next;
                        it->prev->size = it->size + it->prev->size;
                        node* tmp= it;
                        it->prev->next=it->next;
                        if(it->next != NULL)
                        {
                            it->next->prev=it->prev;
                        }
                        it=it->prev;
                        delete tmp;
                        if(it->next==NULL)
                        {
                            tail=it;
                        }
                    }
                }
                
                done=true;
            }
            it=it->next;
        }
        if(done)
        {cout << "Freed for thread" << ID << "\n"; }
        else if (!done)
        {cout << "Can not free, requested index " << index << " for thread" << ID <<" is non-existent\n";}
        print();
        
        sem_post(&sema);
        if(done) return 1;
        else return -1;
    }
    void print()
    {
        node* it = head;
        while(it != NULL)
        {   
            if(it != head)
            {  cout << "---"; }
            cout<< "[" << it->threadId << "] [" << it->size << "] [" << it->index << "]";
            it=it->next;
        }
        cout << "\n";
        return ;
    }
};


