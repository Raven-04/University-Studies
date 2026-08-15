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
