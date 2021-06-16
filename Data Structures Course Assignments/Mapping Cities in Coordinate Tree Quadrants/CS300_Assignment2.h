#include <fstream>
#include <iostream>
#include <string>
#include <sstream>
#include <vector>
#include <cmath>
#define MAX_ENTRY_LENGTH 10
using namespace std;

struct Coordinates{
	Coordinates();
	Coordinates(int px,int py,string name);
	double distanceToCoord(const Coordinates& Point);
	int x;
	int y;
	string name;
	Coordinates* sonNW;
	Coordinates* sonNE;
	Coordinates* sonSW;
	Coordinates* sonSE;
	Coordinates* duplicates;
	/*{Coordinates & operator = (Coordinates & rhs)
	{
		this->x=rhs.x;
		this->y=rhs.y;
		this->name=rhs.name;
		this->sonNW=rhs.sonNW;
		this->sonNE=rhs.sonNE;
		this->sonSE=rhs.sonSE;
		this->sonSW=rhs.sonSW;
		this->duplicates=rhs.duplicates;
		return ;
	}}*/

};

Coordinates::Coordinates()
	:x(0),y(0),name("<None>"),sonNW(NULL),sonNE(NULL),sonSW(NULL),sonSE(NULL),duplicates(NULL)
{}
Coordinates::Coordinates(int px, int py,string name)
				:x(px),y(py),name(name),sonNW(NULL),sonNE(NULL),sonSW(NULL),sonSE(NULL),duplicates(NULL)
{}
double Coordinates::distanceToCoord(const Coordinates & Point)
{
	return sqrt (pow(x-Point.x,2)+pow(y-Point.y,2));
}

class PointQuadTree
{
public:
	PointQuadTree(int BoundaryX,int BoundaryY);
	void PT_insert(Coordinates & Coord);
	void pretty_print();
	Coordinates* PT_compare(Coordinates * Root, const Coordinates & Coord ,string & Quadrant, Coordinates * Father);
	void PT_search(const int & sX,const int & sY,const int & radius);
	bool insideBoundary(const Coordinates & Coord);
	void PT_search(Coordinates & Coord,const int radius,Coordinates* Father,vector<Coordinates> & Found,vector<Coordinates>&Visited);
	const int QueryRootQuadrant( Coordinates & coord,const int radius,Coordinates * Mother);
	Coordinates * getRoot();
private:
	
	Coordinates* Root; 
	void pretty_print(const Coordinates*);
	Coordinates UpperRightBound;
	Coordinates NOT_FOUND;

};
Coordinates* PointQuadTree::getRoot()
{
	return Root;
}


void PointQuadTree::PT_search(Coordinates & Coord,int radius,Coordinates*Father,vector<Coordinates> & Found,vector<Coordinates>&Visited)
{
	if(Father != NULL)
	{
		Visited.push_back(*Father);
		int QueryQuadrant = this->QueryRootQuadrant(Coord,radius,Father);
		switch(QueryQuadrant)
		{
		case 1:		
			this->PT_search(Coord,radius,Father->sonSE,Found,Visited);
			break;
	case 2:
		this->PT_search(Coord,radius,Father->sonSE,Found,Visited);
		this->PT_search(Coord,radius,Father->sonSW,Found,Visited);
		break;
	case 3:
		this->PT_search(Coord,radius,Father->sonSW,Found,Visited);
	break;
	case 4:
		this->PT_search(Coord,radius,Father->sonSE,Found,Visited);
		this->PT_search(Coord,radius,Father->sonNE,Found,Visited);
		break;
	case 5:
		this->PT_search(Coord,radius,Father->sonSW,Found,Visited);
		this->PT_search(Coord,radius,Father->sonNW,Found,Visited);
		break;
	case 6:
		this->PT_search(Coord,radius,Father->sonNE,Found,Visited);
		break;
	case 7:
		this->PT_search(Coord,radius,Father->sonNE,Found,Visited);
		this->PT_search(Coord,radius,Father->sonNW,Found,Visited);
		break;
	case 8:
		this->PT_search(Coord,radius,Father->sonNW,Found,Visited);
		break;
	case 9:
		this->PT_search(Coord,radius,Father->sonNE,Found,Visited);
		this->PT_search(Coord,radius,Father->sonSW,Found,Visited);
		this->PT_search(Coord,radius,Father->sonSE,Found,Visited);
		break;
	case 10:
		this->PT_search(Coord,radius,Father->sonNW,Found,Visited);
		this->PT_search(Coord,radius,Father->sonSW,Found,Visited);
		this->PT_search(Coord,radius,Father->sonSE,Found,Visited);
		break;
	case 11:
		this->PT_search(Coord,radius,Father->sonSE,Found,Visited);
		this->PT_search(Coord,radius,Father->sonNE,Found,Visited);
		this->PT_search(Coord,radius,Father->sonNW,Found,Visited);
		break;
	case 12:
		this->PT_search(Coord,radius,Father->sonNE,Found,Visited);
		this->PT_search(Coord,radius,Father->sonSW,Found,Visited);
		this->PT_search(Coord,radius,Father->sonNW,Found,Visited);
		break;
	case 13:
		Found.push_back(*Father);
		this->PT_search(Coord,radius,Father->sonNW,Found,Visited);
		this->PT_search(Coord,radius,Father->sonNE,Found,Visited);
		this->PT_search(Coord,radius,Father->sonSW,Found,Visited);
		this->PT_search(Coord,radius,Father->sonSE,Found,Visited);
		break;
		}
	}
}

const int PointQuadTree::QueryRootQuadrant(Coordinates & Coord,int radius,Coordinates * Mother)
{
	if( Mother->x < Coord.x - radius )
	{
		if( Mother->y >= Coord.y +  radius) return 1;	
		else if ( Mother-> y < Coord.y-radius) return 6;
		else return 4;
	}
	else if( Mother->x >= Coord.x + radius)
	{
		if( Mother->y >= Coord.y +  radius) return 3;	
		else if ( Mother-> y < Coord.y-radius) return 8;
		else return 5;
	}
	else if(Mother->x < Coord.x+ radius && Mother->x >= Coord.x-radius)
	{
		if( Mother->y >= Coord.y +  radius) return 2;
		else if( Mother->y < Coord.y -  radius) return 7;
		else if ( Mother->y >= Coord.y -  radius &&  Mother->y < Coord.y +  radius)
		{
			if(Coord.distanceToCoord(*Mother) <= radius) 
			{
				return 13;

			}
			

			else if(Mother-> x < Coord.x)
			{
				if(Mother->y >= Coord.y)
				{
					if(Coord.distanceToCoord(*Mother) > radius) return 9;
				}
				else {
					if(Coord.distanceToCoord(*Mother) > radius) return 11;
				}
			}
			else 
			{
				if(Mother->y >= Coord.y)
				{
					if(Coord.distanceToCoord(*Mother) > radius) return 10;
				}
				else {
					if(Coord.distanceToCoord(*Mother) > radius) return 12;
				}			
			
			}
			
		}

	}
	else exit (1);
}

PointQuadTree::PointQuadTree(int BoundaryX,int BoundaryY)
{
	UpperRightBound.x=BoundaryX;
	UpperRightBound.y=BoundaryY;
	UpperRightBound.name="Boundary";
	Root=NULL;
}

bool PointQuadTree::insideBoundary(const Coordinates & Coord)
{
	if( Coord.x <= this->UpperRightBound.x && Coord.y <= this->UpperRightBound.y && Coord.x >= 0 && Coord.y >= 0)
		return true;
	else return false;
}

void PointQuadTree::PT_insert(Coordinates & Coord)
{
	if(Root==NULL && insideBoundary(Coord))
	{
		Root = &Coord;		
	}
	else if ( Root!=NULL && insideBoundary(Coord))
		{
			string Quadrant;
			Coordinates* Father=NULL;
			Father=this->PT_compare(Root,Coord,Quadrant,Father);
			if (Quadrant == "SW") Father->sonSW=&Coord;
			else if (Quadrant == "NW") Father->sonNW=&Coord;
			else if (Quadrant == "NE") Father->sonNE=&Coord;
			else if (Quadrant == "SE") Father->sonSE=&Coord;
			else if (Quadrant == "Duplicate") Father->duplicates=&Coord;
		}
	else ;
}

Coordinates* PointQuadTree::PT_compare( Coordinates * Mother, const Coordinates & Coord,string & Quadrant,Coordinates* Father)
{
	if(Coord.x== Mother->x && Coord.y== Mother->y)
	{
		Quadrant= "Duplicate";
	}

	if (Coord.x >= Mother->x)
	{
		if(Coord.y>=Mother->y)
		{
			Quadrant="NE";
		}
		else Quadrant="SE";
	}
	else {
		if(Coord.y>=Mother->y)
		{
			Quadrant="NW";
		}
		else Quadrant="SW";
	}
	Father=Mother;
	if(Quadrant == "SW" && Mother->sonSW != NULL)
	{
		Father=this->PT_compare(Mother->sonSW,Coord,Quadrant,Father);
	}
	else if(Quadrant == "NW" && Mother->sonNW != NULL)
	{
		Father=this->PT_compare(Mother->sonNW,Coord,Quadrant,Father);
	}
	else if(Quadrant == "SE" && Mother->sonSE != NULL)
	{
		Father=this->PT_compare(Mother->sonSE,Coord,Quadrant,Father);
	}
	else if(Quadrant == "NE" && Mother->sonNE != NULL)
	{
		Father= this->PT_compare(Mother->sonNE,Coord,Quadrant,Father);
	}
	
	return Father;
	

}


void PointQuadTree::pretty_print()
{
	this->pretty_print(Root);
}


void PointQuadTree::pretty_print(const Coordinates * Mother){// pretty print the quadtree rooted at root:
if (Mother != NULL){ // if the tree is not empty
	cout<<Mother->name<<"\n";

	this->pretty_print(Mother->sonSE) ;// recursively print the south east subtree
	this->pretty_print(Mother->sonSW) ;// recursively print the south west subtree
	this->pretty_print(Mother->sonNE) ;// recursively print the north east subtree
	this->pretty_print(Mother->sonNW);// recursively print the north west subtree

}

}
