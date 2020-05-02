#include <stdio.h>
#include <zconf.h>
#include "strings.h"

void ft_bzero(void *start, size_t n);

void test_ft_bzero()
{
	char str[100] = { "12345678910" };
	char empty[100] = {};

	ft_bzero(str, 0);
	if (memcmp(str, "12345678910", 11) != 0)
		printf("bzero test 1 \n");

	ft_bzero(str, 1);
	if (memcmp(str, "\0002345678910", 11) != 0)
		printf("bzero test 2 \n");

	ft_bzero(str, 11);
	if (memcmp(str, empty, 11) != 0)
		printf("bzero test 3 \n");
}

void test_ft_strcat()
{
	// add str to a no null
}

int main()
{
	test_ft_bzero();
	return 0;
}
