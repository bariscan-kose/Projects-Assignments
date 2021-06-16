#include "my_heap.h"
const int hadTo=MAX_CAPACITY;
My_heap::My_heap()
{
	heap_begin=nullptr;
	blk=nullptr;
	used_bytes=0;
}

My_heap::~My_heap()
{
	cout<<"At destruction, the heap had a memory leak of " <<  used_bytes << " bytes.";
	memory_block* temp=blk;
	while(blk != nullptr)
	{
		temp=blk->left;
		deallocate(blk);
		blk=temp;
	}
	delete heap_begin;
	blk=nullptr;
	heap_begin=nullptr;
	used_bytes=0;
}

memory_block* My_heap::bump_allocate(int num_bytes)
{
	if( used_bytes + num_bytes <= hadTo )
	{
		if(blk!= nullptr){

		memory_block* added=new memory_block;
		added->used= true;
		added->size=num_bytes;
		added->starting_address=blk->starting_address+blk->size;
		blk->right = added;
		added->left = blk;
		added->right=nullptr;
		blk=added;
		used_bytes += num_bytes;
		return added;
		}
		else if (blk == nullptr){//Empty linked list to begin with
		memory_block* added=new memory_block;
		added->used= true;
		added->size=num_bytes;
		added->starting_address=0;
		added->left = nullptr;
		added->right=nullptr;
		used_bytes += num_bytes;
		blk=added;
		heap_begin=added;
		return added;
		}
	}
	else{
		return nullptr; // Not enough size
	}
}


void My_heap::deallocate(memory_block* to_delete)
{
	
	if(to_delete->left!=nullptr && to_delete->left->used==false)
	{
		to_delete->left->size+=to_delete->size;
		to_delete->left->right=to_delete->right;
		if(to_delete->right !=nullptr)
		{to_delete->right->left=to_delete->left;}
		if(to_delete->right == nullptr)
		{
			blk=to_delete->left;
		}
		used_bytes-=to_delete->size;
		delete to_delete;
		
	}
	else if (to_delete->right != nullptr && to_delete->right->used==false)
	{
		to_delete->right->size+=to_delete->size;
		to_delete->right->starting_address=to_delete->starting_address;
		
		if(to_delete->left !=nullptr)
		{to_delete->left->right=to_delete->right;}
		if(to_delete->left == nullptr)
		{
			heap_begin=to_delete->left;
		}
		used_bytes-=to_delete->size;
		delete to_delete;
		
	}
	else
	{
		to_delete->used=false;
		used_bytes-=to_delete->size;
	}
}

memory_block * My_heap::first_fit_allocate(int num_bytes)
{
	memory_block* itr = heap_begin;

	while(used_bytes+num_bytes <= hadTo)

	{
		if(itr==nullptr)
		{
			return ((*this).bump_allocate(num_bytes));
		}

		if (itr->used==false && itr->size >= num_bytes)
		{
			itr->used=true;
			used_bytes += itr->size;
			return itr;
		}
		else itr=itr->right;
	}
	return nullptr;
}

memory_block* My_heap::best_fit_allocate(int num_bytes)
{

	while(used_bytes + num_bytes <= hadTo)

	{
		memory_block* itr=heap_begin;
		memory_block* smallest=nullptr;
		int min=MAX_CAPACITY;
		while(itr!=nullptr){
			if(itr->used==false && itr->size < min)
			{ 
				smallest=itr;
				min=itr->size;
			}
			itr=itr->right;
		}
		if(smallest != nullptr){
		smallest->used=true;
		used_bytes += smallest->size;
		return smallest;
		}
		else if (smallest==nullptr){
			return (*this).bump_allocate(num_bytes);
		}
	}
	return nullptr;
}

memory_block* My_heap::first_fit_split_allocate(int num_bytes)
{
	memory_block* allocated=(*this).first_fit_allocate(num_bytes);
	int excess=allocated->size - num_bytes;
	allocated->size=num_bytes;
	if(excess != 0)
	{
		memory_block* split = new memory_block;
		split->size=excess;
		split->used=false;
		split->right=allocated->right;
		allocated->right->left=split;
		allocated->right=split;
		split->left=allocated;
		split->starting_address=allocated->starting_address+allocated->size;
	}
	used_bytes -= excess;
	return allocated;
}
float My_heap::get_fragmantation()
{
	int free_memory= hadTo - used_bytes ;
	int AllFree=0;
	int MaxFree=0;
	memory_block* itr=heap_begin;
	while(itr!=nullptr)
	{
		if(itr->used == false)
		{
			if(MaxFree<itr->size)
			{
				MaxFree=itr->size;
			}
			AllFree += itr->size;
		}
		itr=itr->right;
	}
	if(hadTo - AllFree-used_bytes > MaxFree)
	{
		MaxFree= hadTo - AllFree - used_bytes;
	}
	float fragmentation=float(free_memory-MaxFree)/float(free_memory) * 100;
	return fragmentation;
}

void My_heap::print_heap()
{
	int memory_blocks=0,memory_blocks_used=0,memory_blocks_free=0;
	memory_block* itr=heap_begin;
	while(itr!=nullptr)
	{
		if(itr->used ==true)
		{
			memory_blocks_used+=1;
		}
		else if ( itr->used ==false)
		{
			memory_blocks_free+=1;
		}
		memory_blocks+=1;
		itr=itr->right;
	}

	cout << "Maximum capacity of heap :"<<hadTo << "B \n";
	cout << "Currently used memory (B):" <<used_bytes << "\n";
	cout << "Total memory blocks:" <<memory_blocks <<"\n";
	cout << "Total used memory blocks: " <<memory_blocks_used<<"\n";
	cout << "Total free memory blocks: "<<memory_blocks_free<<"\n";
	cout <<"Fragmentation: "<< (*this).get_fragmantation() << "%\n";
	itr=heap_begin;
	int blockIndex=0;
	cout << "------------------------------\n";
	while(itr != nullptr)
	{
		string usedity=(itr->used)? "True":"False";
		cout<<"Block "<<blockIndex<<"\t\tUsed: "<<usedity<<"\tSize (B):"
			<<itr->size<<"\tStarting Address: 0x";
		cout<<hex<<itr->starting_address<<dec<<"\n";
		blockIndex++;
		itr=itr->right;
	}
	cout << "------------------------------\n";
	cout << "------------------------------\n";
}

