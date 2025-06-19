section .text
    global mover_personaje

mover_personaje:
    ; rcx   ; En este registro vamos a guardar el puntero a la matriz
    ; dx   ; En este guardaremos los renglones de la matriz
    ; r8   ; En este guardaremos las columnas de la matriz
    ; r9   ; En este guardamos la tecla ingresada

    ; Estos son los elementos de la pila que vamos a usar
    push rbx
    push rsi
    push rdi
    push rbp

    mov rsi, rcx   ; rsi guarda el puntero de la matriz
    mov rbx, 0    ; índice lineal
    imul rdx, r8   ; multiplicamos filas X columnas, para tener el total de elementos
    mov rbp, r9   ; es el caracter que nos dicta el movimiento

    ; Aqui vamos a buscar donde esta la letra 'P'    
    .buscar_P:
        cmp rbx, rdx   ; Hacemos una validacion si indice > total de elementos
        jge .fin       ; Salta si es mas grande

        mov al, [rsi + rbx]   ; Colocamos en al el valor de la posicion actual de la "matriz"
        cmp al, 'P'    ; Comparamos matriz[i][j] == 'P'
        je .avanzar     ; Si es igual, saltamos a una subrutina donde realizaremos
                        ; el movimiento que la tecla nos indique

        inc rbx    ; Si no es igual se aumenta el contador hasta encontrala
    jmp .buscar_P

    ; Aqui realizaremos el movimiento de la 'P'
    .avanzar:
        cmp rbp, 'd'   ; Si tecla == d el movieminto es a la derecha
        je .derecha
        
        cmp rbp, 'a'   ; Si tecla == a el movieminto es a la derecha
        je .izquierda

        cmp rbp, 'w'   ; Si tecla == w el movieminto es a la derecha
        je .arriba

        cmp rbp, 's'   ; Si tecla == s el movieminto es a la derecha
        je .abajo
    jmp .fin     

    jmp .fin
        
        ; Funcion para moverse a la derecha
        .derecha:
            inc rbx   ; Incrementamos en 1 para ver que hay en la posicion derecha
            mov al, [rsi + rbx]   ; Asignamos a al la posicion siguiente
            cmp al, '#'   ; Y si en dicha posicion ha un '#' no se puede avanzar
            je .fin   

                      ; ~~~ En caso de que el jump no salte ~~~

            dec rbx   ; Decrementamos para volver a la posicion inicial
                      ; pero sabiendo que si podremos avanzar al siguiente espacio

            mov al, '.'   ; En al colocamos un '.' para poder asignarlo despues al espacio correspondiente de la "matriz"
            mov [rsi + rbx], al   ; A la posicion actual le asignamos lo que tiene al
            inc rbx   ; Incrementamos en 1 la posicion de la matriz para avanzar al siguiente  
                      ; sigueinte espacio de la matriz 

            mov al, 'P'   ; En 
            mov [rsi + (rbx)], al
            jmp .fin

        ; Funcion para moverse a la izquierda
        .izquierda:
            dec rbx   ; Decrementamos en 1 para ver que hay en la posicion a la izquierda
            mov al, [rsi + rbx]
            cmp al, 35
            je .fin

            inc rbx

            mov al, '.'
            mov [rsi + rbx], al
            dec rbx

            mov al, 'P'
            mov [rsi + (rbx)], al
            jmp .fin

        ; Funcion para moverse arriba
        .arriba:
            sub rbx, 12
            mov al, [rsi + rbx]
            cmp al, '#'
            je .fin

            add rbx,12

            mov al, '.'
            mov [rsi + rbx], al
            sub rbx, 12

            mov al, 'P'
            mov [rsi + rbx], al
            jmp .fin

        ; Funcion para moverse abajo
        .abajo:
            add rbx, 12
            mov al, [rsi + rbx]
            cmp al, '#'
            je .fin

            sub rbx, 12

            mov al, '.'
            mov [rsi + rbx], al
            add rbx, 12

            mov al, 'P'
            mov [rsi + rbx], al
            jmp .fin

    .fin:
        ; Regresamos los elementos de la pila que tomamos
        pop rbp
        pop rdi
        pop rsi
        pop rbx
        
        ; Retornamos la matriz con el movimiento del personaje ya realizado
        ret                