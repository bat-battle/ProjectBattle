#include <stdio.h>
/*
1、归并排序的‘归’是递归的含义，‘并’是合并的含义
2、将数组分成两个小组，再递归地将每个小组分成两个小组，直至小组中只有一个元素，我们就可以认为小组是有序的，然后把相邻的两个小组合并 
*/ 

int arr[] = {12,34,656,122,990,1};

void merge_array(int arr[],int first,int mid,int last,int tmp[])//合并相邻的有序小组 
{
	int i = first, j = mid + 1;
	int m = mid, n = last;
	int k = 0;
	while(i <= m && j <= n)//两个数组中哪个元素大，取哪个，直到取完一个或者取完两个数组为止。 
	{
		if(arr[i] <= arr[j])
			tmp[k++] = arr[i++];
		else
			tmp[k++] = arr[j++];
	}
	
	while(i <= m)
		tmp[k++] = arr[i++];
	while(j <= n)
		tmp[k++] = arr[j++];
	for(i = 0;i < k;i++)
		arr[first + i] = tmp[i];
}

void merge_sort(int arr[],int first,int last,int tmp[])//递归地将小组分开，使每个小组变得有序 
{
	if(first < last)
	{
		int mid = (first + last)/2;
		merge_sort(arr,first,mid,tmp);
		merge_sort(arr,mid + 1,last,tmp);
		merge_array(arr,first,mid,last,tmp);
	}
}

void main()
{
	int n = sizeof(arr)/sizeof(arr[0]);
	int p[n];
	merge_sort(arr,0,n - 1,p);
	int index;
	for(index = 0;index < n;index++)
	{
		printf("%d\n",arr[index]);
	}
} 
