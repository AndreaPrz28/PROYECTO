section .text
    global mover_personaje

;rcx = puntero al arreglo(arr)
;rdx=longitud del arreglo

mover_personaje:
    rcx   ; En este registro vamos a guardar el puntero a la matriz
    rdx   ; En este guardaremos los renglones de la matriz
    r