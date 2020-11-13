#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>

int numbers[];

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
   int i, j;
   for(i = 0; i < 2048; i++){
      for(j = i+1; < 2047; j++){
      
      }
   }
}

int main(void){
    leerArchivo();
    ordenar();
}
