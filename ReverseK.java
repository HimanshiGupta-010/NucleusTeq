//1. reverse First k element of Queue

import java.util.*;

public class ReverseK 
{
    public static void main(String args[]) 
    {
		
        LinkedList<Integer> queue=new LinkedList<>(); //creating a queue
        int k; //to contain number of elements to be reversed

        Scanner sc = new Scanner(System.in);
        
        //User input
        System.out.println("Enter the number of elements to be reversed(Between 1 to 10) : ");
        k = sc.nextInt();
        
        //inserting elements 
        queue.add(10);
        queue.add(20);
        queue.add(30);
        queue.add(40);
        queue.add(50);
        queue.add(60);
        queue.add(70);
        queue.add(80);
        queue.add(90);
        queue.add(100);
  
        System.out.println(queue);//printing  queue elements

        queue = reverse(queue, k);//function call

        System.out.println(queue);//prinnting the elements of queue after reversing k elements 
	}

	static LinkedList<Integer> reverse(LinkedList<Integer> queue, int k)
	{
		reverse2(queue, k);

		int size = queue.size()-k;
		
        while(size > 0)
		{
			int value = queue.poll();
			queue.add(value);
			size--;
		}
		
        return queue;
		
	}

	static void reverse2(LinkedList<Integer> queue, int k) 
    {

		if(k == 0)
        {
            return;
        }

		int e = queue.poll();
		reverse2(queue, k-1);
		queue.add(e);		
	}
}