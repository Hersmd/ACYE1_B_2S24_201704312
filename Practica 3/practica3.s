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

input_msg1:
    .ascii "\nIngrese el primer numero "

input_msg2:
    .ascii "\nIngrese el segundo numero "

input_suma:
    .ascii "a sumar: "

input_resta:
    .ascii "a restar: "

input_multiplicacion:
    .ascii "a multiplicar: "

result_msg:
    .ascii "\nResultado: "

error_msg:
    .ascii "\nERROR: número inválido, el número debe estar entre 1 y 6.\n"

volver_msg: 
    .ascii "\nPulse enter para volver al menú principal."

result:
    .space 4

.bss
input: 
    .space 4
input_2: 
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

    cmp w3, 6       // check if input is 6
    b.eq end 

    b.eq error
    

suma:
    mov x0, 1       // stdout
    ldr x1, =input_msg1    // load msg
    mov x2, 26      // size msg
    mov x8, 64      // write syscall_num
    svc 0           // syscall 
    
    mov x0, 1       // stdout
    ldr x1, =input_suma    // load msg
    mov x2, 9      // size msg
    mov x8, 64      // write syscall_num
    svc 0           // syscall 

    mov x0, 0       // stdin
    ldr x1, =input  // load input
    mov x2, 1       // size input with flush
    mov x8, 63      // read syscall_num
    svc 0           // syscall

    mov x0, 0       // stdin
    ldr x1, =input  // load input
    mov x2, 3       // size input with flush
    mov x8, 63      // read syscall_num
    svc 0           // syscall

    mov x0, 1       // stdout
    ldr x1, =input_msg2    // load msg
    mov x2, 27     // size msg
    mov x8, 64      // write syscall_num
    svc 0           // syscall 
    
    mov x0, 1       // stdout
    ldr x1, =input_suma    // load msg
    mov x2, 9      // size msg
    mov x8, 64      // write syscall_num
    svc 0           // syscall 

    mov x0, 0       // stdin
    ldr x1, =input_2  // load input
    mov x2, 4       // size input with flush
    mov x8, 63      // read syscall_num
    svc 0           // syscall*/

        //  ------------------------CONVIRTIENDO ENTRADA A ENTERO-------------------------

    ldr x0, =input  // load input
    ldrb w1, [x0]   // load 1st digit
    sub w1, w1, 48  // ascii to num
    add x0, x0, 1   // input offset
    ldrb w2, [x0]   // load 2nd digit

    mov w21, 10
    cmp w2, 10      // check if 2nd digit is a newline
    b.eq one_byte   // branch to one_byte if newline

    sub w2, w2, 48  // ascii to num
    mul w1, w1, w21  // multiply first digit by 10
    add w6, w1, w2  // numero de dos digitos
    b continue_suma

one_byte:
    sub w1, w1, 10      // restar 10
    mov w21, 1       // cambiar valor para que en el futuro el unico digito se multiplique por 1
    ret          // continuar con el resto de la subrutina

continue_suma:
    ldr x0, =input_2  // load input
    ldrb w1, [x0]   // load 1st digit
    sub w1, w1, 48  // ascii to num
    add x0, x0, 1   // input offset
    ldrb w2, [x0]   // load 2nd digit

    mov w21, 10
    cmp w2, 10      // check if 2nd digit is a newline
    b.eq one_byte_2   // branch to one_byte_2 if newline

    sub w2, w2, 48  // ascii to num
    mul w1, w1, w21  // multiply first digit by 10
    add w4, w1, w2  // numero de dos digitos
    b continue_suma_2

one_byte_2:
    sub w1, w1, 10      // restar 10
    mov w21, 1       // cambiar valor para que en el futuro el unico digito se multiplique por 1
    ret          // continuar con el resto de la subrutina

continue_suma_2:
    //------------------------RESULTADO-----------------------------
    add w4, w4, w6  // resultado, puede ser de 1, 2 o 3 digitos

    // Convert sum to string
    mov w20, w4    // save sum for gt9 or gt99

    subs w11, w4, 99  // check if sum is greater than 99
    b.gt gt99   

    subs w11, w4, 9  // check if sum is greater than 9
    b.gt gt9

    add w4, w4, 48  // num to ascii
    ldr x5, =result // load address of result
    strb w4, [x5]   // store result
    mov w5, 10      // ASCII for newline
    strb w5, [x5, 1] // store newline

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

gt99:
    mov w4, w20     // restore sum for next iteration

    mov w9, 100
    udiv w1, w4, w9  // w1 = w4 / 10, w1 ahora contiene el dígito más significativo
    mul w8, w1, w9   // w8 = w1 * 100
    sub w2, w4, w8  // w2 = w4 - (w1 * 100), w2 ahora contiene los dígito menos significativos

    mov w9, 10
    udiv w7, w2, w9  // w7 = w2 / 10, w7 ahora contiene el segundo dígito más significativo
    mul w8, w7, w9   // w8 = w7 * 10
    sub w2, w2, w8  // w2 = w2 - (w1 * 100), w2 ahora contiene los dígitos menos significativos

// Convertir los dígitos a ASCII
    add w1, w1, 48  // Convertir el dígito más significativo a ASCII
    add w7, w7, 48  // Convertir el segundo dígito más significativo a ASCII
    add w2, w2, 48  // Convertir el dígito menos significativo a ASCII
 // Almacenar los dígitos en direcciones de memoria contiguas
    ldr x5, =result  // Cargar la dirección base de result en x5
    strb w1, [x5]    // Almacenar el dígito más significativo en result[0]
    strb w7, [x5, 1] // Almacenar el segundo dígito más significativo en result[1]
    strb w2, [x5, 2] // Almacenar el dígito menos significativo en result[2]

    // Agregar un salto de línea al final
    mov w3, 10       // ASCII para nueva línea
    strb w3, [x5, 3] // Almacenar el salto de línea en result[2]

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
end:
    // Salir del programa
    mov x8, 93          // syscall exit
    svc 0      
