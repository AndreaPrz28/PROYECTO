section .text
    global mover_personaje

;rcx = puntero al arreglo(arr)
;rdx=longitud del arreglo

mover_personaje:
    ; rcx   ; En este registro vamos a guardar el puntero a la matriz
    ; dx   ; En este guardaremos los renglones de la matriz
    ; r8   ; En este guardaremos las columnas de la matriz

    push rbx
    push rsi
    push rdi

    mov rsi, rcx   ; rsi guarda el puntero de la matriz
    mov rbx, 0    ; índice lineal
    imul rdx, r8   ; multiplicamos filas X columnas, para tener el total de elementos

    .loop:
        cmp rbx, rdx   ; Hacemos una validacion si indice > total de elementos
        jge .fin       ; salta si es mas grande o igual

        mov al, [rsi + rbx]   ; Colocamos en ax el valor actual
        mov eax, 38    ; Asignamos un & en el espacio de la matriz para comprobar que estamos manejando todo bien
        mov [rsi + rbx], eax   

        inc rbx
    jmp .loop

    .fin:
        pop rbx
        pop rsi
        pop rdi

        ret                    