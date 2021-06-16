#include "CS300_Assignment2.h"

int main()
{
	ifstream inFile;
	
	inFile.open("cities.txt");
	string citiesFile;
	
	int inFileCounter=0;
	
	while(!inFile){
		inFileCounter++;
		cout << "Unable to open cities file. Please try another cities file: ";
		cin >> citiesFile;
		inFile.open(citiesFile);
		if(inFileCounter==5) exit(1);
	}

	int sBoundaryX,sBoundaryY;
	string boundaryInput;
	getline(inFile,boundaryInput);
	stringstream inStream;
	inStream << boundaryInput;
	inStream>>sBoundaryX>>sBoundaryY;
	
	PointQuadTree NewTree(sBoundaryX,sBoundaryY);

	string cityInfo;
	int CityX,CityY;
	string CityName;
	
	while(getline(inFile,cityInfo))
	{
		
		inStream.clear();
		inStream<<cityInfo;
		inStream>>CityName>>CityX>>CityY;
		Coordinates* addition=new Coordinates();
		addition->x=CityX;
		addition->y=CityY;
		addition->name=CityName;
		NewTree.PT_insert(*addition);
	}

	NewTree.pretty_print();

	while(true)
	{
	inFile.close();
	cout<<"Enter queries file name:(-1 to exit)";
	string queriesFile;
	cin>>queriesFile;
	if(queriesFile=="-1") exit(0);
	inFile.open(queriesFile);

	while(!inFile){
		inFileCounter++;
		cout << "Unable to open queries file. Please try another queries file: ";
		cin >> queriesFile;
		if(queriesFile=="-1") exit(0);
		inFile.open(queriesFile);
		if(inFileCounter==5) exit(1);
	}
	
	string queriesInfo;
	int radius;
	while(getline(inFile,queriesInfo))
	{
		inStream.clear();
		inStream<<queriesInfo;
		inStream>>CityX;
		inStream.ignore();
		inStream.clear();
		inStream>>CityY;
		inStream.ignore();
		inStream.clear();
		inStream>>radius;
		Coordinates * anchor=new Coordinates;
		anchor->x=CityX;
		anchor->y=CityY;
		anchor->name="Anchor";
		vector<Coordinates>found;
		vector<Coordinates>visited;
		NewTree.PT_search(*anchor,radius,NewTree.getRoot(),found,visited);
		int iterator=0;
		if (found.size() == 0) cout << "<None>";
		while(iterator < found.size ())
		{
			cout <<found[iterator].name << "," << " " ;
			iterator++;
		}
		iterator= 0;
		cout << "\n";
		if (visited.size() == 0 ) cout << "<None>";
		while(iterator < visited.size ())
		{
			cout <<visited[iterator].name << "," << " " ;
			iterator++;
		}
		cout << "\n";
		delete anchor;
		cout<<"\n";
		
	}
	}


}
