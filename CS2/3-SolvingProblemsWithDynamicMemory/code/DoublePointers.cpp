#include <iostream>

using namespace std;

struct date
{
    int day;
    int month;
    int year;
};


int main(int argc, char **argv)
{
    const int NUM_ITEMS = 2;
    
    ////
    // Here's an example of an array on the stack with
    // structs inside
    date arrayOnStack[NUM_ITEMS];
    
    arrayOnStack[0].day = 13;
    arrayOnStack[0].month = 2;
    arrayOnStack[0].year = 2015;
    
    arrayOnStack[1].day = 5;
    arrayOnStack[1].month = 12;
    arrayOnStack[1].year = 1983;
    
    for (int i=0; i < NUM_ITEMS; i++)
    {
        cout << arrayOnStack[i].day << " "
             << arrayOnStack[i].month << " "
             << arrayOnStack[i].year << endl;
    }
    
    // Nothing to delete because it's all on the stack
    
    
    ////
    // Now let's make an array on the stack with pointers
    // to structs on the heap. For each date, we need to
    // create a new struct on the heap, and store the pointer
    // in the next slot of the array.
    
    date * arrayOfPointersOnStack[NUM_ITEMS];
    
    arrayOfPointersOnStack[0] = new date;
    arrayOfPointersOnStack[0]->day = 13;
    arrayOfPointersOnStack[0]->month = 2;
    arrayOfPointersOnStack[0]->year = 2015;
    
    arrayOfPointersOnStack[1] = new date;
    arrayOfPointersOnStack[1]->day = 5;
    arrayOfPointersOnStack[1]->month = 12;
    arrayOfPointersOnStack[1]->year = 1983;
    
    for (int i=0; i < NUM_ITEMS; i++)
    {
        cout << arrayOfPointersOnStack[i]->day << " "
             << arrayOfPointersOnStack[i]->month << " "
             << arrayOfPointersOnStack[i]->year << endl;
    }
    
    // We have to delete the structs on the heap, but that's it
    for (int i=0; i < NUM_ITEMS; i++)
    {
        delete arrayOfPointersOnStack[i];
    }
    
    
    
    ////
    // Let's continue using structs on the heap, but let's
    // additionally put the array on the heap, too.  Now we
    // need to create a new array, which means we need to store
    // the result in a pointer.  But we are also storing pointers
    // in our array, which we need to indicate with another *.
    
    date ** dynamicArrayOfPointers = new date*[NUM_ITEMS];
    
    // Remember that arrays are indexed the same way, whether
    // they are created on the stack or in the heap, so actually
    // the next bit of code looks the same as the previous version
    
    dynamicArrayOfPointers[0] = new date;
    dynamicArrayOfPointers[0]->day = 13;
    dynamicArrayOfPointers[0]->month = 2;
    dynamicArrayOfPointers[0]->year = 2015;
    
    dynamicArrayOfPointers[1] = new date;
    dynamicArrayOfPointers[1]->day = 5;
    dynamicArrayOfPointers[1]->month = 12;
    dynamicArrayOfPointers[1]->year = 1983;
    
    for (int i=0; i < NUM_ITEMS; i++)
    {
        cout << dynamicArrayOfPointers[i]->day << " "
             << dynamicArrayOfPointers[i]->month << " "
             << dynamicArrayOfPointers[i]->year << endl;
    }
    
    // We have to delete the structs on the heap first, then
    // we also have to delete the array itself because it's on
    // the heap too!
    for (int i=0; i < NUM_ITEMS; i++)
    {
        delete dynamicArrayOfPointers[i];
    }
    delete [] dynamicArrayOfPointers;
    
    
    
    return 0;
}
