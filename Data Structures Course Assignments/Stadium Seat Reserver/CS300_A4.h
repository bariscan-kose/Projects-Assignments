#include <algorithm>
#include <string>
#include <iostream>
#include <string>
#include <sstream>
#include <fstream>
#include <unordered_map>
#include <vector>
#include <iomanip>
#include <queue>
using namespace std;

//the mapping -- unordered_map<string,unordered_map<string,seat>>
//seating -- unordered_map<string,seat>	

struct seat
{
	string blockNam,rowNam,custNam;
	int colNum;
	seat(string blocker,string rower,string custnamer,int columner):blockNam(blocker),rowNam(rower),custNam(custnamer),colNum(columner){};
	seat(){};
};

struct bloc
{
		unordered_map <string,unordered_map<int,seat>> bl;
		string blocName;
		bloc(string bName):blocName(bName){};
		bloc(){};
};

struct Compare {


	Compare(string lemitto,int L):Rowitton(lemitto),columnitto(L){};
	Compare():Rowitton(""),columnitto(0){};

    bool operator()(const bloc *  lhs,const  bloc* rhs) {
		int a=0 ;
		int b=0 ;
		for(int i =0 ; i < columnitto ; i++)
		{
			if((lhs->bl).at(Rowitton).at(i).colNum == i ) a++;
			if((rhs->bl).at(Rowitton).at(i).colNum == i ) b++;
		}
		return (a>b);
	}
	string Rowitton;
	int columnitto;
};



