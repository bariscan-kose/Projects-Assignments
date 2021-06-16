
#include "CS300_A4.h"

int main()
{


	fstream inFile,outFile;
	stringstream inStream;
	string inputFile;
	inFile.open("inputs2.txt");
	outFile.open("outpututo.txt");
	vector<vector<bloc*>> BLO(1);
	vector<string> ROW;
	
	string BlockNames,RowNames;
	int ColumnNum,B=0,R=0,C=0;
	string boundaryInputs;

	/*

	cout << "Please enter a file name";
	cin>>inputFile;
	inFile.open(inputFile);
	
	int inFileCounter=0;
	
	while(!inFile){
		inFileCounter++;
		cout << "Unable to open input file. Please try another input file: ";
		cin >> inputFile;
		inFile.open(inputFile);
		if(inFileCounter==5) exit(1);
	}
	*/
	
	getline(inFile,boundaryInputs);
	

	inStream << boundaryInputs;

	
	while(inStream>>BlockNames)
	{
		bloc* necmettin = new bloc(BlockNames);
		BLO[0].push_back(necmettin);
		B++;
	}
	

	inStream.clear();

	getline(inFile,boundaryInputs);
	inStream << boundaryInputs;
	while(inStream>>RowNames)
	{
		ROW.push_back(RowNames);
		R++;
	}
	inStream.clear();
	
	getline(inFile,boundaryInputs);
	inStream << boundaryInputs;
	while(inStream>>ColumnNum)
	{
		C=ColumnNum;
	}
	inStream.clear();
	string commands;
	for ( int i = 0 ; i < B ; i++)
		{
			for ( int k = 0 ; k < R ; k++)
			{
				string rowitty = ROW[k];
				BLO[0][i]->bl[rowitty];
				for(int j = 0;j<C;j++)
				{
					BLO[0][i]->bl[rowitty][j];
				}
			}

		}
	
	
	unordered_map<string,seat> namemap;
	
	/*
	for (int i = 1 ; i< R+1; i++)
	{ 
		vector<bloc*>* calmington = new vector<bloc*>;
		BLO.push_back(*calmington);
		for(int k =0;k<B;k++)
		{
			bloc* remingtons = new bloc;
			remingtons=BLO[0][k];
			BLO[i].push_back(remingtons);
		}	
	} 
	*/
	unordered_map<string,int> findRowNum;
	for (int i =0;i<R;i++)
	{
		findRowNum[ROW[i]]=i;
	}

	unordered_map<string,int> findBloNum;
	for (int i =0;i<B;i++)
	{
		findBloNum[BLO[0][i]->blocName]=i;
	}

	
	
	

	while(getline(inFile,commands))
	{
		vector<priority_queue<bloc*,vector<bloc*>,Compare>> pique;

	for (int i =1 ; i<R+1;i++)
				{	
					
					priority_queue<bloc*,vector<bloc*>,Compare> pq(Compare(ROW[i-1],C));
					pique.push_back(pq);
				}

		for(int k =0; k<R;k++)
	{
		for(int i=0;i<B;i++)
		{
			pique[k].push(BLO[0][i]);
		}
	}
		inStream<<commands;
		string determiner;
		inStream>>determiner;
		if (determiner == "print")
		{
			for ( int i = 0 ; i < B ; i++)
			{
				outFile << BLO[0][i]->blocName << "\n~~~~~~~~~~\n";
				for ( int k =0 ; k<R ; k++ )
				{
					if( (BLO[0][i]->bl).find(ROW[k]) != (BLO[0][i]->bl).end())
					{
						outFile << ROW[k] << " : ";
						for (int j=0 ; j < C; j++)
						{
							if((BLO[0][i]->bl)[ROW[k]][j].colNum == j)
							{   outFile<<(BLO[0][i]->bl)[ROW[k]][j].custNam.substr(0,3)<<" " ;
							}
							else 
							{
								
								outFile  << "---" <<" " ;
							}

						
						}
						outFile<<"\n";
					}
				}
				outFile<<"========\n\n";
			}

		}

		else if (determiner == "reserve_seat")
		{
			string customerName,blockName,rowName;
			int columnNumber;
			inStream>>customerName>>blockName>>rowName>>columnNumber;
			string output1,output2;
			output1=customerName+" has reserved "+ blockName +" "+ rowName + "-" +to_string(columnNumber) ;
			output2=customerName+" could not reserve a seat!";
			if(namemap.find(customerName) == namemap.end())
			{
				
				int theBloNum = findBloNum[blockName];
				(BLO[0][theBloNum]->bl)[rowName][columnNumber]=seat(BLO[0][theBloNum]->blocName,rowName,customerName,columnNumber);
				namemap[customerName]=seat(blockName,rowName,customerName,columnNumber);
				outFile <<  output1 <<"\n";
			}
			else 
			{
				outFile<< output2 <<"\n" ;
			}
		}
		else if (determiner=="reserve_seat_by_row")
		{
			string customerName,rowName,blockName;
			//int columnNumber;
			inStream>>customerName>>rowName;
			if(namemap.find(customerName)!= namemap.end())
			{
				outFile << customerName+" could not reserve a seat!"<<"\n";
			}
			else {

				
				
				int theRowNum = findRowNum[rowName];
				//pique[theRowNum].push(pique[theRowNum].top());
				//pique[theRowNum].pop();
				int i = 0;
				int b;
				bool added = false;
				while(i<C && !added)
				{
					if( (pique[theRowNum].top()->bl)[rowName][i].colNum != i)
					{
						b=i;
						(pique[theRowNum].top()->bl)[rowName][i]=seat(pique[theRowNum].top()->blocName,rowName,customerName,i);
						added=true;
					}
					i++;
				}
			namemap[customerName]=seat(pique[theRowNum].top()->blocName,rowName,customerName,b);
			outFile <<customerName+" has reserved "+pique[theRowNum].top()->blocName +" "+ rowName + "-" +to_string(b)+" by emptiest block" <<"\n";
			}

		}
		else if (determiner=="cancel_reservation")
		{
			string customerName;
			inStream>>customerName;
			if(namemap.find(customerName) == namemap.end())
			{
				outFile <<"Could not cancel the reservation for " + customerName + "; no reservation found!"<<"\n";
			}
			else 
			{
				string blocking,rowing;
				int columning;
				blocking=namemap[customerName].blockNam;
				rowing= namemap[customerName].rowNam;
				columning=namemap[customerName].colNum;
				int theBloNum=findBloNum[blocking];
				(BLO[0][theBloNum]->bl)[rowing].erase(columning);
				(BLO[0][theBloNum]->bl)[rowing][columning];
				namemap.erase(customerName);
				outFile<<"Cancelled the reservation of "+ customerName<<"\n";
			}
		
		}
		else if (determiner == "get_seat")
		{
			string customerName;
			inStream>>customerName;
			// Found that <customre_name> has a reservation in <block_name><row_name>-<column_number>
			//There is no reservation made for <customre_name>!
			if(namemap.find(customerName) == namemap.end())
			{
				outFile <<"There is no reservation made for "+customerName+"!"<<"\n";
			}
			else 
			{
				string blockName = namemap[customerName].blockNam;
				string rowName = namemap[customerName].rowNam;
				int columnNumber = namemap[customerName].colNum;
				outFile << "Found that "+customerName+" has a reservation in " + blockName + " "+rowName+"-" + to_string(columnNumber)<<"\n";
			}
		}
		else 
		{
			break;
		}
		for(int k =0; k<R;k++)
	{
		
	}
		
		inStream.clear();
		
	}
	
}
