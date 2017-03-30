#include <stdio.h>

/*
1、一个大小为n的数组，里面的数都属于范围[0, n-1]，有不确定的重复元素，找到至少一个重复元素，要求O(1)空间和O(n)时间。 
*/

int FindRepeatNum(int arr[],int length)
{
	int i = 0;
	int index;
	for(;i < length;i++)
	{
		index = arr[i] >= length ? arr[i] - length:arr[i];
		if(arr[index] >= length)
			return index;
		else
			arr[index] += length; 
		
	}
	return -1;	
} 

void main()
{
	const int MAXN = 10;  
    int arr[10] = {2, 4, 1, 5, 7,  6, 1, 9, 0, 2};
    int num = FindRepeatNum(arr,10);
    if(num == -1)
    	printf("数组arr中无重复数字\n");
    else
    	printf("数组arr中重复数字是：%d",num);
 } 
