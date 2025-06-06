#include <stdio.h>
#include <stdlib.h>

#define REN 12
#define COL 12

extern int mover_personaje(char *mapa, int ren, int col);

int menu();
int display();


int main(){
    int op = 0;

    do{
        op = menu();
        op = display();

    }while(op!=2);
}

int menu(){
    int resp = 0;

    printf("\n************************************\n\n");
    printf("~~~ JUEGO DEL LABERINTO ~~~\n");
    printf("- Empezar (1)\n");
    printf("- Salir (2) \n\n");
    printf("Que opcion quieres? \n");
    scanf("%d", &resp);
    printf("\n************************************\n\n");

    return resp;
}

int display(){

    int opcion=0;

    char mapa[REN][COL] = {
                        {'#','#','#','#','#','#','#','#','#','#','#','#'},
                        {'#','P','.','.','.','#','.','.','.','.','.','#'},
                        {'#','#','.','#','.','#','.','#','#','#','.','#'},
                        {'#','.','.','#','.','.','.','#','.','#','.','#'},
                        {'#','.','#','#','#','#','#','#','.','#','.','#'},
                        {'#','.','#','.','.','.','.','#','.','#','.','#'},
                        {'#','.','#','#','#','#','.','#','.','.','.','#'},
                        {'#','.','.','.','.','.','.','#','#','#','#','#'},
                        {'#','.','#','#','#','#','.','#','.','.','.','#'},
                        {'#','.','#','.','#','#','.','#','.','#','.','#'},
                        {'#','.','.','.','.','#','.','.','.','#','X','#'},
                        {'#','#','#','#','#','#','#','#','#','#','#','#'}
    };

    do{
        for (int i=0; i<REN; i++){
            for (int j=0; j<COL; j++){
                printf(" %c", mapa[i][j]);
            }
            printf("\n");
        }
        printf("\n||| Usa W/A/S/D para moverte |||");
        printf("\n     Presiona E para salir\n\n");

        mover_personaje((char *)mapa,REN,COL);
        
        //printf(" ~~~ Reiniciar (1)");
        //printf(" ~~~ Salir (2)");
        opcion++;
    
    }while(opcion != 2);

    return opcion;
}
