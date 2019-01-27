#include <stdio.h>
#include <stdint.h>
#include <time.h>

// PRNG entier définitions, données et routines:

// constantes provenant du livre Numerical Recipes
const uint32_t RNG_a=1664525;
const uint32_t RNG_c=1013904223;
uint32_t RNG_state; // variable globale

void my_srand(uint32_t i)
{
	RNG_state=i;
};

uint32_t my_rand()
{
        RNG_state=RNG_state*RNG_a+RNG_c;
        return RNG_state;
};

// PRNG FPU définitions et routines:

union uint32_t_float
{
	uint32_t i;
	float f;
};

float float_rand()
{
	union uint32_t_float tmp;
	tmp.i=my_rand() & 0x007fffff | 0x3F800000;
	return tmp.f-1;
};

// test

int main()
{
	my_srand(time(NULL)); // initialisation du PRNG

	for (int i=0; i<100; i++)
		printf ("%f\n", float_rand());

	return 0;
};
