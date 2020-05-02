#include <stdio.h>
#include <zconf.h>
#include "strings.h"

void ft_bzero(void *start, size_t n);
char *ft_strcat(char *s1, char *s2);
int ft_isalpha(int c);
int ft_isdigit(int c);

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

# define size 100
void test_ft_strcat()
{
	char s1[size] = {};
	char s2[size] = { "34" };
	char *ret;

	// empty s1
	ret = ft_strcat(s1, "1234");
	if (memcmp(ret, "1234", strlen("1234")) != 0)
		printf("ft_strcat test 1\n");

	// empty s2
	ret = ft_strcat(s1, "");
	if (memcmp(ret, "1234", strlen("1234")) != 0)
		printf("ft_strcat test 2\n");

	// add 34
	ret = ft_strcat(s1, s2);
	if (memcmp(ret, "123434", strlen("123434")) != 0)
		printf("bzero test 3\n");

	// check the 0 at the end
	char s11[size] = { 0, 0, 0, 'u' };
	char s22[size] = { 'a', 'b', 'c' };
	ret = ft_strcat(s11, s22);
	if (memcmp(ret, "abc", 4) != 0)
		printf("ft_strcat test 4");
}

void test_isalpha(void)
{
	int result;

	result = ft_isalpha('a');
	if (!result)
		printf("ft_isalpha test 1\n");

	result = ft_isalpha('A');
	if (!result)
		printf("ft_isalpha test 2\n");

	result = ft_isalpha('z');
	if (!result)
		printf("ft_isalpha test 3\n");

	result = ft_isalpha('1');
	if (result)
		printf("ft_isalpha test 3\n");
}

void test_isdigit(void)
{
	int result;

	result = ft_isdigit('0');
	if (!result)
		printf("ft_isdigit test 1\n");

	result = ft_isdigit('9');
	if (!result)
		printf("ft_isdigit test 2\n");

	result = ft_isdigit('z');
	if (result)
		printf("ft_isdigit test 3\n");
}

int main()
{
	test_ft_bzero();
	test_ft_strcat();
	test_isalpha();
	test_isdigit();
	return 0;
}
