//Write a program to search 2nd highest number from an array.

public class SecondHighest 
{
    public static void main(String args[])
    {
        //Variable declaration
        int arr[] = {1, 2, 5, 6, 3, 2};
        int temp; // for swapping

        //Finding second highest number
        for(int i=0; i<6; i++)
        {
            for(int j=i+1; j<6; j++)
            {
                if(arr[i] > arr[j])
                {
                    temp = arr[i];
                    arr[i] = arr[j];
                    arr[j] = temp;
                }
            }
        }

        //printing second highest number
        System.out.println("Second largest : "+ arr[6-2]);
    }
}
