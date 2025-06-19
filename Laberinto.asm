section .text
    global mover_personaje

;rcx = puntero al arreglo(arr)
;rdx=longitud del arreglo

mover_personaje:
    ; rcx   ; En este registro vamos a guardar el puntero a la matriz
    ; dx   ; En este guardaremos los renglones de la matriz
    ; r8   ; En este guardaremos las columnas de la matriz
    ; r9   ; En este guardamos la tecla ingresada

    push rbx
    push rsi
    push rdi
    push rbp

    mov rsi, rcx   ; rsi guarda el puntero de la matriz
    mov rbx, 0    ; índice lineal
    imul rdx, r8   ; multiplicamos filas X columnas, para tener el total de elementos
    mov rbp, r9   ; es el caracter que nos dicta el movimiento

    .buscar:
        cmp rbx, rdx   ; Hacemos una validacion si indice > total de elementos
        jge .fin       ; salta si es mas grande o igual

        mov al, [rsi + rbx]   ; Colocamos en ax el valor actual
        cmp al, 'P'
        je .avanzar

        inc rbx
    jmp .buscar

    .avanzar:
        cmp rbp, 'd'
        je .derecha
        
        cmp rbp, 'a'
        je .izquierda

        cmp rbp, 'w'
        je .arriba

        cmp rbp, 's'
        je .abajo

        jmp .fin

        .derecha:
            mov al, '.'
            mov [rsi + rbx], al
            mov al, 'P'
            inc rbx
            mov [rsi + (rbx)], al
            jmp .fin

        .izquierda:
            mov al, '.'
            mov [rsi + rbx], al
            mov al, 'P'
            dec rbx
            mov [rsi + (rbx)], al
            jmp .fin

        .arriba:

        .abajo:


    .fin:
        pop rbp
        pop rdi
        pop rsi
        pop rbx

        ret                    