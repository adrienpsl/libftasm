#include <stdio.h>
#include <fcntl.h>
#include <zconf.h>
#include "strings.h"
# include "stdlib.h"

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
void *ft_memcpy(void *dest, void *start, size_t len);
void *ft_strdup(char *str);

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
		printf("ft_strcat test 1 %s, %s\n", ret, "1234");

	//	 empty s2
	ret = ft_strcat(s1, "");
	if (memcmp(ret, "1234", strlen("1234")) != 0)
		printf("ft_strcat test 1 _%s_, _%s_\n", ret, "1234");

	ret = ft_strcat(s1, s2);
	if (memcmp(ret, "123434", strlen("123434")) != 0)
		printf("bzero test 3\n");

	// check the 0 at the end
	char s11[size] = { 'o', 0, 0, 0, 'u' };
	char s22[size] = { 'a', 'b', 'c' };
	ret = ft_strcat(s11, s22);
	if (memcmp(ret, "oabc", 4) != 0)
		printf("ft_strcat test 4\n");
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

	int stdout;

	stdout = dup(1);
	// comment je fais pour que ce truc marche mieux?
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

void test_ft_memcpy(void)
{
	void *ret;
	char *result;
	char buffer[100] = {};

	result = "";
	ret = ft_memcpy(buffer, result, strlen(result));
	if (0 != memcmp(ret, result, ft_strlen(result)))
		printf("ft_memcpy error");

	result = "123\00012";
	ret = ft_memcpy(buffer, result, strlen(result) + 2);
	if (0 != memcmp(ret, result, ft_strlen(result) + 2))
		printf("ft_memcpy error");
}

#define mega 10000000
void test_ft_strdup(void)
{
	char *result;
	char *test;

	// test 1
	{
		test = malloc(mega);
		for (int i = 0; i < mega; ++i)
			test[i] = 'c';

		result = ft_strdup(test);
		for (int i = 0; i < mega; ++i)
			result[i] = 'c';
		if (0 != memcmp(test, result, mega))
			printf("error ft_strdup \n");
		free(test);

		for (int i = 0; i < mega; ++i)
			result[i] = 'o';
	}

	// test 2
	{
		test = strdup("");
		result = ft_strdup("");
		if (0 != memcmp(test, result, 1))
			printf("error ft_strdup 2\n");
	}
}
int ft_cat(int fd);

void test_ft_cat(void)
{
	char cmd[128];
	int i;
	int fd;
	int mine;
	int stdout;
	char *files[] = {
		"Makefile",
		"/bin/ls",
		"/dev/null",
		"/usr/bin/python",
		"/usr/bin/IOAccelMemory",
		NULL
	};

	stdout = dup(1);
	i = 0;
	while (files[i])
	{
		fd = open(files[i], O_RDONLY);
		mine = open("mine", O_WRONLY | O_TRUNC | O_CREAT, 0644);
		dup2(mine, 1);
		ft_cat(fd);
		close(fd);
		close(mine);
		dup2(stdout, 1);
		bzero(cmd, 128);
		strcat(cmd, "diff ");
		strcat(cmd, files[i]);
		strcat(cmd, " mine >> diff_file");
		if (system(cmd) != 0)
			printf("error \n");;
		i++;
	}
	ft_cat(-1);
	ft_cat(0);
}

int main(void)
{
	test_ft_bzero();
//	test_ft_strcat();
//	test_ft_strlen();
//	test_isalpha();
//	test_isdigit();
//	test_isascii();
//	test_isalnum();
//	test_isprint();
//	test_toupper();
//	test_tolower();
	test_puts();
//	test_ft_memset();
//	test_ft_memcpy();
//	test_ft_strdup();
//	test_ft_cat();
	return 0;


	//	b  0 1
	//	8  0 1 2 3 4 5 6 7
	//	   0 1 2 3 4 5 6 7 8 9
	//	0x 0 1 2 3 4 5 6 7 8 9 a b c d e f
	//	4
	//
	//	0x10 -> 16






}
