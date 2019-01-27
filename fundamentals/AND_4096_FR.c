if (value&0xFFF)
{
	printf ("la valeur n'est pas divisible par 0x1000 (ou 4096)\n");
	printf ("a propos, le reste est %d\n", value&0xFFF);
}
else
	printf ("la valeur est divisible par 0x1000 (ou 4096)\n");
