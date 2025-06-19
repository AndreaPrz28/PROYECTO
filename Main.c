#include <stdio.h>   // Para los printf() y los scanf()
#include <stdlib.h>   // Para el system("cls")
#include <Windows.h>   // Para los Sleep

#define REN 12
#define COL 12

extern int mover_personaje(char *mapa, int ren, int col, char tecla);

int menu();
int display();


int main(){
    int op = 0;

    do{
        // El if es para que no entre al menu si en "display" seleccionamos 
        // la opcion de reiniciar el juego
        if (op != 1){
            op = menu();
        }

        // Este if es para que no entremos al displey en caso de seleccionar
        // la opcion de salir en el "menu"
        if (op != 2){
            op = display();
        }

    }while(op!=2);

    printf("\n\n\n\n    ~~~~~ HASTA PRONTO ~~~~~");
    Sleep(1000);
    system("cls");

    return 0;
}

int menu(){
    int resp = 0; 

    printf("\n************************************\n\n");
    printf("~~~ JUEGO DEL LABERINTO ~~~\n");
    printf("- Empezar (1)\n");
    printf("- Salir (2) \n\n");
    printf("Que opcion quieres? \n");
    fflush(stdin);
    scanf("%d", &resp);
    printf("\n************************************\n\n");

    Sleep(1500);
    system("cls");

    return resp;
}

int display(){

    int opcion=0;
    char tecla;

    // Aqui creamos nuestra matriz y laberinto

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
                        {'#','.','.','.','.','#','.','.','.','#','X','#'},  // La x esta en la posicion mapa[10][10]
                        {'#','#','#','#','#','#','#','#','#','#','#','#'}
    };

    // Adentro de este do-while es donde vamos a estar haciendo los moviminetos para el juego
    do{
    
        // En estos for imprimimos la matriz e instrucciones que se estaran viendo en pantalla
        for (int i=0; i<REN; i++){
            for (int j=0; j<COL; j++){
                printf(" %c", mapa[i][j]);
            }
            printf("\n");
        }

        printf("\n||| Usa W/A/S/D para moverte |||");
        printf("\n    Presiona r para reiniciar");
        printf("\n      Presiona e para salir\n\n");
        
        // Capturamos la tecla que nos indicara el movimiento
        while ((tecla = getchar()) == '\n');

        // Si es r nos regresa al main, y el main nos trae de vuelta al display
        if (tecla == 'r'){
            system("cls");
            Sleep(800);
            return 1;
        }

        // Si es e, nos regresa al main y saldremos del programa
        if (tecla == 'e'){
            system("cls");
            Sleep(800);
            return 2;
        }
        
        // Aqui es donde mandamos nuestra informacion a lenguaje ensamblador.
        // Mandamos la matriz, renglones, columnas y la tecla seleccionada
        mover_personaje((char *)mapa,REN,COL,tecla);

        // Aqui borramos la pantalla para que el movimiento de la 'P' 
        // se pueda apreciar mejor y se vea mas fluido
        system("cls");
    
    }while(opcion != 2);

    return opcion;
}
