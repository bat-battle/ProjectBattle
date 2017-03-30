#include <stdio.h>
/*
1、逆数对：在一个数组中，每个数都有一个索引，如果i < j，但是a[i] > a[j]，则称 a[i] 和 a[j]是一队逆数对
2、简单的方法去求逆数对，算法复杂度是 O(N^2)，利用归并排序的思想去求逆数对，算法复杂度是 O(N*LogN); 
3、这种方法是把一个数组先分成一个个有序数组，在合并相邻的两个数组时，去选择两个数组中较小的元素，如果选择是左边的，即 索引靠前的，则不符合逆数对的要求，如果选择的是右边的即索引靠后的，
则说明选择的这个元素和在左边那个和它比较的元素及左边在它之后的元素都能组成逆数对。 

*/ 

int n_count;

void AdjustArr(int arr[],int first, int mid, int last,int tmp[])
{
	int i = first, j = mid;
	int k = mid + 1, l =last;
	int m = 0;
	while(i <= j&&k <= l)
	{
		if(arr[i] <= arr[k])
			tmp[m++] = arr[i++];
		else
		{
			tmp[m++] = arr[k++];
			n_count += j - i + 1; //a[j]和a[i]、a[i + 1]......a[mid]都能组成逆数对。 
		}
	}
	while(i <= j)
		tmp[m++] = arr[i++];
	while(k <= l)
		tmp[m++] = arr[k++]; 
	for(i = 0;i < m;i++)
		arr[i+first] = tmp[i];
}

void merge_sort(int arr[],int first,int last,int tmp[])
{
	if(first < last)
	{
		int mid = (first + last)/2;
		merge_sort(arr,first,mid,tmp);
		merge_sort(arr,mid + 1,last,tmp);
		AdjustArr(arr,first,mid,last,tmp);
	}
}

void main()
{
	int arr[8] = {1, 7, 2, 9, 6, 4, 5, 3};
	int tmp[8];
	merge_sort(arr,0,7,tmp);
	printf("数组arr中逆数对的个数是： %d",n_count);
}
