#include <stdio.h>	// Standard I/O functions
#include <stdlib.h>
#include <sys/wait.h>	// wait() function for process synchronization
#include <unistd.h>	// fork(), execlp(), and process-related functions

void collatzConjecture(int n) {
	while (n != 1) {
		printf("%d%s", n, ", ");

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
		collatzConjecture(n);
		exit(0);
	}
	else {
		// Parent process
		wait(NULL);
	}

	return 0;
}
