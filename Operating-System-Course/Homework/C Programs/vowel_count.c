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
	// Loop throuh each character until the null
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
