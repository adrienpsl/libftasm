

#include <fcntl.h>
#include <stdio.h>

void ft_cat(int fd);

void tous(char *str)
{
	while(*str != 0)
	{
		putchar(*str);
		str = str + 1;
	}
}


ssize_t write(int fd, const void *buf, size_t nbyte);

int main(int ac, char **av)
{
//	ft_cat(open(__FILE__, O_RDONLY));


	char buffer[6] = { '*', '\n' ** };
	 // 0x22

	char *rdx = buffer;
	// 0x22

	*rdx = '\n';
	// -> 0x22 -> '\n'

	rdx = rdx + 1;
	// 0x23


	return (1);
}