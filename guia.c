#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>


void leerArchivo(){
  FILE * fp;
  char * line = NULL;
  size_t len = 0;
  int number;

  fp = fopen("numbers.txt", "r");
  if (fp == NULL)
     exit(EXIT_FAILURE);
     
   while (getline(&line, &len, fp) != -1) {
      number = atoi(line);
      printf("%i", number);
   }

   fclose(fp);
   if (line)
      free(line);
   exit(EXIT_SUCCESS);  
}

int main(void){
    leerArchivo();
}
