#define N 150
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
extern uint8_t median(uint32_t dim, uint8_t vec_in[], uint8_t vec_out[]);
int main(){
  int i;
  uint8_t original[N], ordenado[N], mediana;
  for (i=0;i<N;i++){original[i]=(rand() % 255);}
  mediana=median(N,original,ordenado);
  printf("\n[");
  for (i=0;i<N;i++){printf("%i,",original[i]);}
  printf("]\n\n");
  for (i=0;i<N;i++){printf("\n%i",ordenado[i]);}
  printf("\n\n\n\nmediana: %i",mediana);
  return 0;
}

