# include "unistd.h"

void ft_cat(int fd)
{
	char buffer[400] = {};
	int ret;

	while (0 < (ret = read(fd, buffer, 399)))
		write(STDOUT_FILENO, buffer, ret);

	//	 loop on the line
}