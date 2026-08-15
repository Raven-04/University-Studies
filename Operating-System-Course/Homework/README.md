===========================================================================================
					Collatz Program
===========================================================================================
Description: -
--------------
Generates the collatz sequence for a given positive integer. It does this by creating a child process using "fork()", and this child process will print out the sequence.

Code: -
-------

collatz.c: -

	#include <stdio.h>
	#include <stdlib.h>
	#include <sys/wait.h>
	#include <unistd.h>
 
	void collatzConjecture(int n) {
		while (n != 1) {
			printf("%d%s", n, ", ")
			
			// If the number is even, then divide by 2
			if (n % 2 == 0) {
				n = n/2;
			}
			else {
			// If the number is odd, then 3*n+1
				n = 3*n+1;
			}
		}
		printf("1\n");
		printf("The operation is complete.\n");
	}

	int main(int argc, char *argv[]) {
		// Checks for the number of arguments
		// 1 means no argument was passed
		// 2 means one argument was passed
		if (argc != 2) {
			printf("Error: One argument must be passed.\n");
			return 1;
		}
	
		int n = atoi(argv[1]);
	
		// Checks whether the entered value is less than 1
		if (n <= 0) {
			printf("Error: Cannot choose zero or negative numbers.\n");
			return 1;
		}
	
		pid_t pid = fork();
	
		// The fork() fails and print an error msg
		if (pid < 0) {
			printf("Error: Fork failed\n");
			return 1;
		}
		else if (pid == 0) {
			// Child process
			printf("Collatz sequence (%d%s", n, "):\n");
		}
		else {
			// Parent process
			wait(NULL);
		}
	
		return 0;
	}


How to run the code: -
----------------------
nano collatz.c		   Used to create and write the C language code for the program.
ctrl + o		   Once code is completed, you have to save it.
ctrl + x		   Exit the nano code area.
gcc collatz.c -o collatz   Compile the code and create an output file to run.

Sample Input: -
---------------
./collatz 12		   Run the output file with your chosen number (input).


Expected Output: -
------------------
Collatz sequence (12):
12, 6, 3, 10, 5, 16, 8, 4, 2, 1
The operation is complete.

===========================================================================================
					Vowel Count Program
===========================================================================================
Description: -
--------------
The program will count the total number of vowels in a given string while using a separate process to do this. Furthermore, parent process forks a child to run the vowel_count.c using the execlp() command.

Codes: -
-------

main.c: -

	#include <stdio.h>
	#include <sys/wait.h>
	#include <unistd.h>
	
	int main(int argc, char *argv[]) {
		// Checks if 1 argument is passed or if the string is empty
		if (argc != 2 || argv[1][0] == 0) {
			printf("Error: One argument should be passed.\n");
			return 1;
		}
	
		pid_t pid = fork();
	
		if (pid < 0) {
			printf("Error: Fork failed.\n");
			return 1;
		}
	
		if (pid == 0) {
			// Executing the vowel_count program and passing the argument
			execlp("./vowel_count", "vowel_count", argv[1], NULL);
			printf("Error: execlp failed\n");
			return 1;
		}
		else {
			wait(NULL);
		}
	
		return 0;
	}


vowel.c: -

	#include <stdio.h>
	#include <unistd.h>
	#include <string.h>
	
	int main(int argc, char *argv[]) {
		// Checks whether there is more/less than one argument
		if (argc != 2) {
			printf("Error: One argument should be passed.\n");
			return 1;
		}
	
		// Extracting the input string
		char *str = argv[1];
	
		int counter = 0;
		// Loop through each character until the null
		for (int i = 0; str[i] != '\0'; i++) {
			// Checks the string if it has characters in the vowel list
			// by using strchr
			if (strchr("aeiouAEIOU", str[i])) {
				counter++;
			}
		}
	
		printf("Number of vowels: %d\n", counter);
	
		return 0;
	}

How to run the code: -
----------------------
nano vowel_count.c	      Used to create and write the C language code for the program.
ctrl + o		          Once code is completed, you have to save it.
ctrl + x		          Exit the nano code area.
gcc vowel_count.c -o vowel_count  Compile the code and create an output file to run.
nano main.c	      	      Used to create and write the C language code for the program.
ctrl + o		          Once code is completed, you have to save it.
ctrl + x		          Exit the nano code area.
gcc main.c -o main		  Compile the code and create an output file to run.

Sample Input: -
---------------
./main "Hello World"		  Run the output file with your chosen string (input).


Expected Output: -
------------------
Number of vowels: 3
