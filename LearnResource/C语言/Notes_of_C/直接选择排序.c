#include <stdio.h> 

int arr[] = {12,34,656,122,990,1};
void select_sort(int arr[], int n)
{
	int i, j, MinIndex;
	for(i = 0;i < n;i++)
	{
		MinIndex = i;//每次循环为i选择一个符合要求的值，即 在 i+1,i+2,i+3.......n-1无序区中选择一个最小的值，这里0,1,2...i被视为有序区， 
		for(j = i + 1;j < n;j++)
		{
			if(arr[j] < arr[MinIndex])
				MinIndex = j;
		}
		int tmp = arr[i];
		arr[i] = arr[MinIndex];
		arr[MinIndex] = tmp;
	}
 } 


void main()
{
	int n = sizeof(arr)/sizeof(arr[0]);
	select_sort(arr,n);
	int index;
	for(index = 0;index < n;index++)
	{
		printf("%d\n",arr[index]);
	}
}
