#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>

int numbers[2048];

void leerArchivo(){
  FILE * fp;
  char * line = NULL;
  size_t len = 0;
  int number;

  fp = fopen("numbers.txt", "r");
  if (fp == NULL)
     exit(EXIT_FAILURE);

   int i = 0;
   while (i < 2048){
      getline(&line, &len, fp);
      numbers[i++] = atoi(line);
   }

   fclose(fp);
   if (line)
      free(line);
   exit(EXIT_SUCCESS);
}

void ordenar(){
   int i, j, aux;
   for(i = 0; i < 2047; i++){
      for(j = i+1;j < 2048; j++){
      	if(numbers[i] > numbers[j]){
	   aux = numbers[i];
	   numbers[i] = numbers[j];
	   numbers[j] = aux;
	}
      }
   }
}

int main(void){
    leerArchivo();
    ordenar();
}
