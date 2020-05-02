#include <stdio.h>
#include <zconf.h>
#include "strings.h"

void ft_bzero(void *start, size_t n);
char *ft_strcat(char *s1, char *s2);
int ft_isalpha(int c);
int ft_isdigit(int c);
int ft_isascii(int c);
int ft_isalnum(int c);
int ft_isprint(int c);
int ft_toupper(int c);
int ft_tolower(int c);
int ft_puts(const char *s);
size_t ft_strlen(const char *s);
void *ft_memset(void *b, int c, size_t len);

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

	result = ft_isalpha('_');
	if (result)
		printf("ft_isalpha test 4\n");

	result = ft_isalpha('1');
	if (result)
		printf("ft_isalpha test 5\n");
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

	result = ft_isdigit('_');
	if (result)
		printf("ft_isdigit test 4\n");
}

void test_isascii(void)
{
	int result;

	result = ft_isascii(0);
	if (!result)
		printf("ft_isascii test 1\n");

	result = ft_isascii(127);
	if (!result)
		printf("ft_isascii test 2\n");

	result = ft_isascii(128);
	if (result)
		printf("ft_isascii test 3\n");
}

void test_isalnum(void)
{
	int result;

	// alpha part
	result = ft_isalnum('a');
	if (!result)
		printf("ft_isalnum test 1\n");

	result = ft_isalnum('A');
	if (!result)
		printf("ft_isalnum test 2\n");

	result = ft_isalnum('z');
	if (!result)
		printf("ft_isalnum test 3\n");

	result = ft_isalnum('1');
	if (!result)
		printf("ft_isalnum test 4\n");

	// num part
	result = ft_isalnum('0');
	if (!result)
		printf("ft_isalnum test 5\n");

	result = ft_isalnum('9');
	if (!result)
		printf("ft_isalnum test 6\n");

	result = ft_isalnum('_');
	if (result)
		printf("ft_isalnum test 7\n");
}

void test_isprint(void)
{
	int result;

	// alpha part
	result = ft_isprint(40);
	if (!result)
		printf("ft_isprint test 1\n");

	result = ft_isprint(176);
	if (!result)
		printf("ft_isprint test 2\n");

	result = ft_isprint(-1);
	if (result)
		printf("ft_isprint test 2\n");
}

void test_toupper(void)
{
	int result;

	result = ft_toupper('a');
	if ('A' != result)
		printf("ft_toupper test 1\n");

	result = ft_toupper('z');
	if ('Z' != result)
		printf("ft_toupper test 2\n");

	result = ft_toupper('A');
	if ('A' != result)
		printf("ft_toupper test 3\n");

	result = ft_toupper('-');
	if ('-' != result)
		printf("ft_toupper test 4\n");
}

void test_tolower(void)
{
	int result;

	result = ft_tolower('a');
	if ('a' != result)
		printf("ft_tolower test 1\n");

	result = ft_tolower('z');
	if ('z' != result)
		printf("ft_tolower test 2\n");

	result = ft_tolower('A');
	if ('a' != result)
		printf("ft_tolower test 3\n");

	result = ft_tolower('Z');
	if ('z' != result)
		printf("ft_tolower test 3\n");

	result = ft_tolower('-');
	if ('-' != result)
		printf("ft_tolower test 4\n");
}

void test_puts(void)
{
	int ret;

	ret = ft_puts("222222222222:123:12");
	if (ret <= 0)
		printf("puts test 1");

	ret = ft_puts("");
	if (ret <= 0)
		printf("puts test 1");

	ret = ft_puts(0);
	if (ret <= 0)
		printf("puts test 1");
}

void test_ft_strlen(void)
{
	size_t ret;
	size_t correction;
	char *str;

	str = "";
	ret = ft_strlen(str);
	correction = strlen(str);
	if (ret != correction)
		printf("cor : %zu  result: %zu\n", correction, ret);

	str = "asnoetuhaosenhutaosentuhasonetuhnsaoethuaonesthu    aoesuthaosuhnV";
	ret = ft_strlen(str);
	correction = strlen(str);
	if (ret != correction)
		printf("cor : %zu  result: %zu\n", correction, ret);

	str = "o";
	ret = ft_strlen(str);
	correction = strlen(str);
	if (ret != correction)
		printf("cor : %zu  result: %zu\n", correction, ret);
}

void test_ft_memset(void)
{
	char mem[100] = { "abc" };
	char *ret;
	char *result;

	result = "abc";
	ret = ft_memset(mem, 'c', 0);
	if (0 != memcmp(ret, result, ft_strlen(result)))
		printf("ft_memset error");

	result = "ccccccc";
	ret = ft_memset(mem, 'c', 7);
	if (0 != memcmp(ret, result, ft_strlen(result)))
		printf("ft_memset error");
}

int main(void)
{
	test_ft_bzero();
	test_ft_strcat();
	test_isalpha();
	test_isdigit();
	test_isascii();
	test_isalnum();
	test_isprint();
	test_toupper();
	test_tolower();
	//	test_puts();
	test_ft_strlen();
	test_ft_memset();
	return 0;
}
