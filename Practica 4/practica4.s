.global _start

.data
header:
    .ascii "==============================PRACTICA 4==============================="
    .ascii "\nUniversidad de San Carlos de Guatemala\nFacultad de Ingeniería \n"
    .ascii "Escuela de Ciencias y Sistemas\nArquitectura de Computadores y Ensambladores 1"
    .ascii "\nSección B\nHenri Eduardo Martinez Duarte\n201704312\n"
    .ascii "======================================================================\n"
    lenHeader = . - header

menu_str:
    .ascii "\n------------------MENU------------------\n"
    .ascii "1. Ingreso de lista de números\n"
    .ascii "2. Bubble Sort\n"
    .ascii "3. Insertion Sort\n"
    .ascii "4. Finalizar Programa\n"
    .ascii "-----------------------------------------\n"
    .ascii ">> Ingrese su eleccion: "
    lenMenu = . - menu_str

volver_msg: 
    .ascii "\nPulse enter para volver al menú principal."
    lenVolver = . - volver_msg

ingresar_msg: 
    .ascii "\nPulse enter para ingresar al menú principal."
    lenIngresar = . - ingresar_msg

clear_screen:
    .asciz "\x1B[2J\x1B[H"
    lenClear = . - clear_screen 
    
error_opcion_invalida:
    .ascii "\nERROR: opción inválida, el número debe estar entre 1 y 4.\n"
    lenErrorOpcion = . - error_opcion_invalida

error_opcion_invalida_submenu1:
    .ascii "\nERROR: opción inválida, el número debe estar entre 1 y 3.\n"
    lenErrorOpcion_submenu1 = . - error_opcion_invalida_submenu1

end_msg:
    .ascii "\n============================== FINALIZANDO PROGRAMA ==============================\n"
    lenEnd_msg = . - end_msg

menu_ingresar_lista_msg:
    .ascii "\n------------------INGRESO DE LISTA DE NÚMEROS------------------\n"
    .ascii "1. Ingresar lista de números de forma manual.\n"
    .ascii "2. Ingresar lista de números cargando archivo CSV.\n"
    .ascii "3. Volver al menú principal.\n"
    .ascii "-----------------------------------------------------------------\n"
    .ascii ">> Ingrese su eleccion: "
    lenMenuIngresarLista = . - menu_ingresar_lista_msg

ingresar_lista_msg:
    .ascii "\n------------------INGRESO DE LISTA DE NÚMEROS------------------\n"
    .ascii "Ingrese los números separados por comas: (Ejemplo: 1,2,3,4,5)\n"
    .ascii ">> "
    lenIngresarLista = . - ingresar_lista_msg

total_msg: 
    .asciz "Total de numeros: %d\n"
    lenTotalmsg = . - total_msg

numero_msg: 
    .asciz "Numero en el arreglo: %c\n"
    lenNumeromsg = . - numero_msg

bubble_sort_msg: 
    .asciz "\nRealizando ordenamiento por Bubble Sort\n"
    lenBubbleSortmsg = . - bubble_sort_msg

insertion_sort_msg:
    .asciz "\nRealizando ordenamiento por Insertion Sort\n"
    lenInsertionSortmsg = . - insertion_sort_msg

result:
    .space 10
    
.bss
input: 
    .space 1024
input_opcion:
    .space 4
numeros: 
    .space 500  // Espacio para almacenar hasta 500 números



.text
.macro print reg, len
    MOV x0, 1
    LDR x1, =\reg
    MOV x2, \len
    MOV x8, 64
    SVC 0
.endm

.macro read reg, len
    MOV x0, 0
    LDR x1, =\reg
    MOV x2, \len
    MOV x8, 63
    SVC 0
.endm

_start:
    // Clear screen
    print clear_screen, lenClear

    // Print header
    print header, lenHeader

    print ingresar_msg, lenIngresar

    // Read Enter key
    read input_opcion, 2

    // Read Enter key
    ldr x1, =input_opcion
    ldrb w1, [x1]   // load the entered character
    cmp w1, 10      // compare with newline character
    b.eq menu       // if Enter is pressed, branch to menu

    b volver_menu  // else, repeat the loop 

menu:

    print menu_str, lenMenu 

    read input_opcion, 3  // read input_opcion

    ldr x0, =input_opcion  // load input_opcion
    ldrb w3, [x0]   // load 1st digit
    sub w3, w3, 48  // ascii to num

    mov w26, w3     // save input_opcion for later
    cmp w3, 1       // check if input_opcion is 1
    b.lt error

    b.eq menu_ingresar_lista
    
    cmp w26, 2
    b.eq bubble_sort

    cmp w26, 3
    b.eq insertion_sort

    cmp w3, 4       // check if input_opcion is 6
    b.eq end 

    bgt error


menu_ingresar_lista:
    print menu_ingresar_lista_msg, lenMenuIngresarLista

    read input_opcion, 3  // read input_opcion

    ldr x0, =input_opcion  // load input_opcion
    ldrb w3, [x0]   // load 1st digit
    sub w3, w3, 48  // ascii to num

    cmp w3, 1       // check if input_opcion is 1
    b.lt error_submenu1

    b.eq ingresar_lista

    cmp w3, 2
    //b.eq cargar_csv

    cmp w3, 3
    b.eq volver_menu

    b error_submenu1

ingresar_lista:
    print ingresar_lista_msg, lenIngresarLista

    read input, 1024

    ldr x0, =input      // Cargar la dirección de la cadena input
    ldr x1, =numeros    // Cargar la dirección del array numeros
    mov x2, #0          // Inicializar el índice del array numeros
    mov w4, #0          // Inicializar acumulador de números

loop:
    ldrb w3, [x0], #1   // Leer el siguiente carácter de input y avanzar el puntero
    cmp w3, #0          // Comparar con el carácter nulo (fin de cadena)
    beq end_loop        // Si es el fin de la cadena, salir del bucle

    cmp w3, #44         // Comparar con la coma (',')
    beq store_number    // Si es una coma, almacenar el número acumulado

    sub w3, w3, #48     // Convertir el carácter a su valor numérico
    mov w5, 10
    mul w4, w4, w5     // Multiplicar el acumulador por 10
    add w4, w4, w3      // Añadir el dígito al acumulador

    b loop              // Repetir el bucle

store_number:
    str w4, [x1, x2, LSL #2] // Almacenar el número acumulado en el array
    add x2, x2, #1           // Incrementar el índice del array
    mov w4, #0               // Reiniciar el acumulador
    b loop                   // Continuar con el siguiente carácter

end_loop:
    // Almacenar el último número si no termina en coma
    str w4, [x1, x2, LSL #2]
    cmp w4, #0
    mov x20, x2
    beq imprimir_numero
    b imprimir_numero

imprimir_numero:
    ldr x0, =numeros    // Cargar la dirección del array numeros
    mov x6, 0           // Inicializar el índice del array numeros
    b loop_imprimir_numero

loop_imprimir_numero:
    ldr w1, [x0, x6]        // Cargar el primer número del array
    add w1, w1, #48     // Convertir el número a su representación ASCII
    ldr x5, =result     // Cargar el mensaje de formato
    strb w1, [x5]       // Almacenar el número en el buffer de resultado

    add x6, x6, #1
    cmp x6, x20
    beq fin_imprimir_numero
    blt loop_imprimir_numero

fin_imprimir_numero:
    add x6, x6, #1
    mov w3, 10
    strb w3, [x5, x6]   // Almacenar el salto de línea
    print result, 2    // Imprimir el mensaje con el número
    b volver_menu

bubble_sort:
    print bubble_sort_msg, lenBubbleSortmsg
    b volver_menu

insertion_sort:
    print insertion_sort_msg, lenInsertionSortmsg
    b volver_menu

volver_menu:
    // Prompt user to press Enter
    print volver_msg, lenVolver

    // Read Enter key
    read input_opcion, 3
    ldr x1, =input_opcion  // load input_opcion
    ldrb w1, [x1]   // load the entered character
    cmp w1, 10      // compare with newline character
    b.eq menu       // if Enter is pressed, branch to menu

    b volver_menu  // else, repeat the loop


error:
    print error_opcion_invalida, lenErrorOpcion  
    b volver_menu        // return to menu

error_submenu1:
    print error_opcion_invalida_submenu1, lenErrorOpcion_submenu1
    b menu_ingresar_lista        // return to menu

end:
    // Salir del programa
    print end_msg, lenEnd_msg
    mov x0, 0
    mov x8, 93          // syscall exit
    svc 0   

