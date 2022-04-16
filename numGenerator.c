#include <stdio.h>
#include <stdlib.h>

void numberGen(int start, int stop);

int main(int argc, char* argv[])
{
   switch (argc){
      case 1:
         printf("Error: Expected atleast one argument\nnumGen <start> <stop> or numGen <stop>\n");
         break;
      case 2:
         numberGen(0, atoi(argv[1]));
         break;
      case 3:
         numberGen(atoi(argv[1]), atoi(argv[2]));
         break;
      default:
         printf("Too many arguments passed\n");
   }
}

void numberGen(int start, int stop) {
   if (start == stop) return;
   switch (start < stop) {
      case 0:
         for (int i = start; i > stop; i--)
            printf("%d\n", i);
         break;
      case 1:
         for (int i = start; i < stop; i++)
            printf("%d\n", i);
         break;
   }
}
