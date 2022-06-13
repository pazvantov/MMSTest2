#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <math.h>
#include "car.h"


int randNum(int min,int max)
{
    return min + rand() % (max - min + 1);
}

double randReal(double min, double max)
{
    return min + ((double)rand() / RAND_MAX) * (max - min);
}

void randModel(char* name)
{
    int i = 0;
    int numbofsml;
    name[i++] = randNum('A','Z');
    numbofsml = randNum(4,10);
    for(int c = 0;c<numbofsml;c++)
    {
        name[i++] = randNum('a','z');
    }
    name[i] = 0;
}

void FillCars(Car *array, size_t n)
{
    for(int i=0;i<n;i++)
    {
        randModel(array[i].model);
        array[i].maxspeed = randNum(100,300);
        array[i].price = randReal(1000.0,100000.0);
    }
}

void printCars(Car *array, size_t n)
{
    for(int i=0;i<n;i++)
    {
        printf("Model:%25s  Maxspeed:%5u   Price:%8.2lf\n",
        array[i].model,array[i].maxspeed,array[i].price);
    }
}

int compModelASC(const void* el1, const void* el2)
{
    Car* c1 = (Car*)el1;
    Car* c2 = (Car*)el2;
    return strcmp(c1->model,c2->model);
}

int compModelDESC(const void* el1, const void* el2)
{
    Car* c1 = (Car*)el1;
    Car* c2 = (Car*)el2;
    return strcmp(c2->model,c1->model);
}

int compSpeedASC(const void* el1, const void* el2)
{
    Car* c1 = (Car*)el1;
    Car* c2 = (Car*)el2;
    return c1->maxspeed - c2->maxspeed;
}

int compSpeedDESC(const void* el1, const void* el2)
{
    Car* c1 = (Car*)el1;
    Car* c2 = (Car*)el2;
    return c2->maxspeed - c1->maxspeed;
}

int compPriceASC(const void* el1, const void* el2)
{
    Car* c1 = (Car*)el1;
    Car* c2 = (Car*)el2;
    if(fabs(c1->price - c2->price) < 0.001)
    {
        return 0;
    }
    else if(c1->price > c2->price)
    {
        return 1;
    }
    else return -1;
}

int compPriceDESC(const void* el1, const void* el2)
{
    Car* c1 = (Car*)el1;
    Car* c2 = (Car*)el2;
    if(fabs(c1->price - c2->price) < 0.001)
    {
        return 0;
    }
    else if(c1->price < c2->price)
    {
        return 1;
    }
    else return -1;
}

int (*getComparator(int n))(const void*, const void*)
{
    switch(n)
    {
        case 1:
            return compModelASC;
        case 2:
            return compModelDESC;
        case 3:
            return compSpeedASC;
        case 4:
            return compSpeedDESC;
        case 5:
            return compPriceASC;
        case 6:
            return compPriceDESC;
        default:
            return NULL;
    }
}