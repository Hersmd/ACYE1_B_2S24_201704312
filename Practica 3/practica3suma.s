.global _start

.data
msg:
    .ascii "Enter 3 consecutive digits: "

header:
    .ascii "==============================PRACTICA 3==============================="
    .ascii "\nUniversidad de San Carlos de Guatemala\nFacultad de Ingeniería \n"
    .ascii "Escuela de Ciencias y Sistemas\nArquitectura de Computadores y Ensambladores 1"
    .ascii "\nSección B\nHenri Eduardo Martinez Duarte\n201704312\n"
    b volver_menu

menu_str:
    .ascii "\n------------------MENU------------------\n"
    .ascii "1. Suma\n"
    .ascii "2. Resta\n"
    .ascii "3. Multiplicación\n"
    .ascii "4. División\n"
    .ascii "5. Calculo con Memoria\n"
    .ascii "6. Salir\n"
    .ascii "-----------------------------------------\n"
    .ascii "Ingrese su eleccion: "

error_msg:
    .ascii "\nERROR: número inválido, el número debe estar entre 1 y 6.\n"

volver_msg: 
    .ascii "\nPulse enter para volver al menú principal."

result:
    .space 4

.bss
input: 
    .space 4

.text
_start:
    mov x0, 1       // stdout
    ldr x1, =header    // load msg
    mov x2, 265     // size msg
    mov x8, 64      // write syscall_num
    svc 0   
    mov x0, 1       // stdout
    ldr x1, =volver_msg // load prompt
    mov x2, 44     // size prompt
    mov x8, 64      // write syscall_num
    svc 0           // syscall

    // Read Enter key
    mov x0, 0       // stdin
    ldr x1, =input  // load input
    mov x2, 1       // size input
    mov x8, 63      // read syscall_num
    svc 0           // syscall

    // Read Enter key
    ldrb w1, [x1]   // load the entered character
    cmp w1, 10      // compare with newline character
    b.eq menu       // if Enter is pressed, branch to menu

    b volver_menu  // else, repeat the loop

menu:
    mov x0, 1       // stdout
    ldr x1, =menu_str    // load msg
    mov x2, 186     // size msg
    mov x8, 64      // write syscall_num
    svc 0   

    /*mov x0, 1       // stdout
    ldr x1, =msg    // load msg
    mov x2, 28      // size msg
    mov x8, 64      // write syscall_num
    svc 0           // syscall */

    mov x0, 0       // stdin
    ldr x1, =input  // load input
    mov x2, 1       // size input with flush
    mov x8, 63      // read syscall_num
    svc 0           // syscall

    ldr x0, =input  // load input
    ldrb w3, [x0]   // load 1st digit
    sub w3, w3, 48  // ascii to num

    cmp w3, 1       // check if input is 1
    b.lt error
    b.eq suma 

    cmp w3, 2       // check if input is 2
    b.eq resta 
    

suma:
    mov x0, 1       // stdout
    ldr x1, =msg    // load msg
    mov x2, 28      // size msg
    mov x8, 64      // write syscall_num
    svc 0           // syscall 

    mov x0, 0       // stdin
    ldr x1, =input  // load input
    mov x2, 1       // size input with flush
    mov x8, 63      // read syscall_num
    svc 0           // syscall

    mov x0, 0       // stdin
    ldr x1, =input  // load input
    mov x2, 4       // size input with flush
    mov x8, 63      // read syscall_num
    svc 0           // syscall

    ldr x0, =input  // load input
    ldrb w1, [x0]   // load 1st digit
    sub w1, w1, 48  // ascii to num
    add x0, x0, 1   // input offset
    ldrb w2, [x0]   // load 2nd digit
    sub w2, w2, 48  // ascii to num
    add x0, x0, 1   // input offset
    ldrb w3, [x0]   // load 3rd digit
    sub w3, w3, 48  // ascii to num
    add w4, w1, w2  // sum two digit
    add w4, w4, w3  // sum three digit

    /*mov x0, 1       // stdout
    ldr x1, =msg    // load msg
    mov x2, 28      // size msg
    mov x8, 64      // write syscall_num
    svc 0           // syscall */

    // Convert sum to string
    subs w11, w4, 9  // check if sum is greater than 9
    mov w20, w4
    b.gt gt9
    add w4, w4, 48  // num to ascii
    ldr x5, =result // load address of result
    strb w4, [x5]   // store result
    mov w6, 10      // ASCII for newline
    strb w6, [x5, 1] // store newline

    mov x0, 1       // set stdout
    ldr x1, =result // load result
    mov x2, 2       // size result (1 for digit + 1 for newline)
    mov x8, 64      // write syscall_num
    svc 0           // syscall
    b volver_menu        // return to menu

resta:
    mov x0, 1       // stdout
    ldr x1, =error_msg    // load msg
    mov x2, 60     // size msg
    mov x8, 64      // write syscall_num
    svc 0   

    mov x0, 0       // stdin
    ldr x1, =input  // load input
    mov x2, 2      // size input
    mov x8, 63      // read syscall_num
    svc 0           // syscall

    b volver_menu        // return to menu


gt9:
    mov w4, w20     // restore sum for next iteration

    mov w9, 10
    udiv w1, w4, w9  // w1 = w4 / 10, w1 ahora contiene el dígito más significativo (1)
    mul w8, w1, w9   // w8 = w1 * 10
    sub w2, w4, w8  // w2 = w4 - (w1 * 10), w2 ahora contiene el dígito menos significativo (2)
// Convertir los dígitos a ASCII
    add w1, w1, 48  // Convertir el dígito más significativo a ASCII
    add w2, w2, 48  // Convertir el dígito menos significativo a ASCII
 // Almacenar los dígitos en direcciones de memoria contiguas
    ldr x5, =result  // Cargar la dirección base de result en x5
    strb w1, [x5]    // Almacenar el dígito más significativo en result[0]
    strb w2, [x5, 1] // Almacenar el dígito menos significativo en result[1]

    // Agregar un salto de línea al final
    mov w3, 10       // ASCII para nueva línea
    strb w3, [x5, 2] // Almacenar el salto de línea en result[2]

    // Imprimir el resultado
    mov x0, 1        // stdout
    ldr x1, =result  // Cargar la dirección de result en x1
    mov x2, 3        // Tamaño del resultado (2 dígitos + nueva línea)
    mov x8, 64       // syscall number para write
    svc 0            // syscall

    b volver_menu

    // Salir del programa
    mov x8, 93       // syscall number para exit
    svc 0            // syscall

error:
    mov x0, 1       // stdout
    ldr x1, =error_msg    // load msg
    mov x2, 65     // size msg
    mov x8, 64      // write syscall_num
    svc 0   
    b volver_menu        // return to menu

volver_menu:
    // Prompt user to press Enter
    mov x0, 1       // stdout
    ldr x1, =volver_msg // load prompt
    mov x2, 44     // size prompt
    mov x8, 64      // write syscall_num
    svc 0           // syscall

    // Read Enter key
    mov x0, 0       // stdin
    ldr x1, =input  // load input
    mov x2, 2      // size input
    mov x8, 63      // read syscall_num
    svc 0           // syscall

    // Read Enter key
    ldrb w1, [x1]   // load the entered character
    cmp w1, 10      // compare with newline character
    b.eq menu       // if Enter is pressed, branch to menu

    b volver_menu  // else, repeat the loop
