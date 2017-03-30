#include <stdio.h>
/*
1、一个大小为n的数组，里面的数都属于范围[0, n-1]，有不确定的重复元素，找到至少一个重复元素，要求O(1)空间和O(n)时间。

 */ 
 
int FindRepeatNum(int arr[],int MAXN)
{
	int i = 0;
	int j = 0;
	//int tmp;
	for(;i < MAXN;i++)
	{
		while(i != arr[i])
		{
			if(arr[i] == arr[arr[i]])
				return arr[i];
			int tmp = arr[arr[i]];
			arr[arr[i]] = arr[i];
			arr[i] = tmp;
			
		}
	}
	return -1;
}



void main()
{
    int arr[4] = {2, 1, 3,2};
    int num = FindRepeatNum(arr,4);
    if(num == -1)
    	printf("数组arr中无重复数字\n");
    else
    	printf("数组arr中重复数字是：%d",num);
 } 


