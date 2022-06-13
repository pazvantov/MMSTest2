#ifndef CAR_H
#define CAR_H

typedef struct 
{
    char model[21];
    uint8_t maxspeed;
    double price;
}Car;

int randNum(int min,int max);
double randReal(double min, double max);
void randModel(char* name);
void FillCars(Car *array, size_t n);
void printCars(Car *array, size_t n);
int compModelASC(const void* el1, const void* el2);
int compModelDESC(const void* el1, const void* el2);
int compSpeedASC(const void* el1, const void* el2);
int compSpeedDESC(const void* el1, const void* el2);
int compPriceASC(const void* el1, const void* el2);
int compPriceDESC(const void* el1, const void* el2);
int (*getComparator(int n))(const void*, const void*);
#endif