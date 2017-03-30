#include <stdio.h>
/*
1、快速排序是先从数组中找出一个基本数，然后把数组中比它大的数放到它的右面，把比它小的数放到它的左面，再对左右区间进行上述操作，直至区间只有一个数。 
2、分治法 
*/

int arr[] = {12,34,656,122,990,1};

int AdjustArray(int arr[],int l,int r)
{
	int i = l,j = r;
	int x = arr[i];
	while(i<j)
	{
		while(i < j&&arr[j] > x) //从区间末尾找出比基本数小的数 
			j--;
		if(i<j)
		{
			arr[i] = arr[j];
			i++;
		}
		while(i < j&&arr[i] < x)//从区间开头找出比基本数大的数 
			i++;
		if(i < j)
		{
			arr[j] = arr[i];
			j--;
		}
	}
	arr[i] = x;
	return i;
 } 
 
 void quick_sort(int arr[], int l, int r)
 {
 	if(l < r)
 	{
 		int i = AdjustArray(arr,l,r);//基本数左边都是比它小的数，基本数右边都是比它大的数，以基本数的位置为界，分成两个区间，在进行上述操作 
 		quick_sort(arr,l,i - 1);//i是基本数，不应该在去排序了 
 		quick_sort(arr,i + 1,r);
	 }
 }
 
 void main()
{
	int n = sizeof(arr)/sizeof(arr[0]);
	quick_sort(arr,0,n - 1);
	int index;
	for(index = 0;index < n;index++)
	{
		printf("%d\n",arr[index]);
	}
} 
