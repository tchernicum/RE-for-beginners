if (value&0xFFF)
{
	printf ("value is not divisible by 0x1000 (or 4096)\n");
	printf ("by the way, remainder is %d\n", value&0xFFF);
}
else
	printf ("value is divisible by 0x1000 (or 4096)\n");
