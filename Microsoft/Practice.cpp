#include<iostream>
using namespace std;
int getSingle(int arr[], int n)
{

	int num = 0;
	int fact = 1;
	for (int j = 0; j<32; j++)
	{
		int curr_bit = 0;
		for (int i = 0; i<n; i++)
		{
			if ((arr[i] & fact) == fact)
				curr_bit++;
		}
		if (curr_bit % 3 == 1)
		{
			num = num | fact;
		}
		fact <<= 1;
	}
	return num;
}
int main()
{
	int arr[] = { 3,2,3,3,1,1,1,2,2,4,4,4,100 };
	int n = sizeof(arr) / sizeof(arr[0]);
	printf("The element with single occurrence is %d ", getSingle(arr, n));
	return 0;
}