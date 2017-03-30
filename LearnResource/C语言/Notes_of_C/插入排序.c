#include <stdio.h>

#define MAX 100
int arr[5] = {23,324,123,9,124};
void insert_sort(int arr[])
{
	int i = 0;
	int j,tmp;
	printf("-------%d",sizeof(arr));
	int arr_len = sizeof(arr)/sizeof(arr[0]);
	printf("数组长度是 %d\n",arr_len);
	for(;i < arr_len;i++)
	{
		if(arr[i] < arr[i-1])
		{
			tmp = arr[i];
			for(j = i - 1;j >= 0 && arr[j] > tmp;j--)
				arr[j + 1] = arr[j];
			arr[j] = tmp;
		}
	}
	for(i = 0;i < arr_len;i++)
		printf("%d\n",arr[i]);
}

void main()
{
	insert_sort(arr);	
} 
