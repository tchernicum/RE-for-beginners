#include <stdio.h>
#include <string.h>
#include <limits.h>

// copypasted from https://stackoverflow.com/a/8534275
char *strrev(char *str)
{
	char *p1, *p2;

	if (! str || ! *str)
		return str;
	for (p1 = str, p2 = str + strlen(str) - 1; p2 > p1; ++p1, --p2)
	{
		*p1 ^= *p2;
		*p2 ^= *p1;
		*p1 ^= *p2;
	}
	return str;
}

void itoa(int n, char s[])
{
	int i, sign;
	if ((sign = n) < 0) /* record sign */
		n = -n; /* make n positive */
	i = 0;
	do { /* generate digits in reverse order */
		s[i++] = n % 10 + '0'; /* get next digit */
	} while ((n /= 10) > 0); /* delete it */
	if (sign < 0)
		s[i++] = '-';
	s[i] = '\0';
	strrev(s);
}

int main()
{
	char buf[10];
	itoa (1234567890, buf);
	//itoa (-1234567890, buf);
	printf ("%s\n", buf);
};

