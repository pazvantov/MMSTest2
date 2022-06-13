#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <math.h>
#include "car.h"

int main()
{
    srand(time(NULL));
    Car array[10];
    FillCars(array,10);
    int n;
    printf("1.ModelASC\n2.ModelDESC\n3.SpeedASC\n4.SpeedDESC\n5.PriceASC\n6.PriceDESC");
    printf("\nChoose:");
    scanf("%d",&n);
    qsort(array,10,sizeof(array[0]),getComparator(n));

    printCars(array,10);

    return 0;
}