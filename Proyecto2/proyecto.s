.global itoa
.global atoi
.global proc_import
.global import_data
.global readCSV
.global openFile
.global closeFile
.global _start

.data
header:
    .ascii "============================== PROYECTO 2 ==============================="
    .ascii "\nUniversidad de San Carlos de Guatemala\nFacultad de Ingeniería \n"
    .ascii "Escuela de Ciencias y Sistemas\nArquitectura de Computadores y Ensambladores 1"
    .ascii "\nSección B\nHenri Eduardo Martinez Duarte\n201704312\n"
    .ascii "=========================================================================\n"
    lenHeader = . - header

salto:
    .asciz "\n"
    lenSalto = .- salto

espacio:
    .asciz "\t"
    lenEspacio = .- espacio

espacio2:
    .asciz " "
    lenEspacio2 = .- espacio2

diagonal:
    .ascii "/"
    lenDiagonal = .- diagonal

dpuntos:
    .asciz ":"
    lenDpuntos = .- dpuntos

flecha:
    .asciz ">> "
    lenFlecha = .- flecha

createSucces:
    .asciz "El Reporte Se Ha Abierto Correctamente\n"
    lenCreateSuccess = .- createSucces

ingresar_valor_msg:
    .asciz "Ingrese el valor para la celda "
    lenIngresarValorMsg = .- ingresar_valor_msg

cols:
    .asciz " ABCDEFGHIJK" //11 COLUMNAS

rows:
    .asciz "123456789:;<=>?@ABCDEFGH" //23 FILAS

cmdimp:
    .asciz "IMPORTAR"

cmdexp:
    .asciz "EXPORTAR"

cmddesde:
    .asciz "DESDE"

cmdhacia:
    .asciz "HACIA"

cmdsave:
    .asciz "GUARDAR"

cmden:
    .asciz "EN"

cmdsum:
    .asciz "SUMAR"

cmdres:
    .asciz "RESTAR"

cmdmul:
    .asciz "MULTIPLICAR"

cmddiv:
    .asciz "DIVIDIR"

cmdpot:
    .asciz "POTENCIAR"

cmdologico:
    .asciz "OLOGICO"

cmdylogico:
    .asciz "YLOGICO"

cmdoxlogico:
    .asciz "OXLOGICO"

cmdnologico:
    .asciz "NOLOGICO"

cmdprom:
    .asciz "PROMEDIO DESDE"

cmdmin:
    .asciz "MINIMO DESDE"

cmdmax:
    .asciz "MAXIMO DESDE"

cmdllenar:
    .asciz "LLENAR DESDE"

cmdy:
    .asciz "Y"

cmdentre:
    .asciz "ENTRE"

cmda_la:
    .asciz "A LA"

cmdhasta:
    .asciz "HASTA"

cmdsep:
    .asciz "SEPARADO POR COMA"

menu_cmd_msg:
    .asciz "Ingrese el comando a ejecutar\n>> "
    lenMenuCmdMsg = .- menu_cmd_msg

resultado_suma_msg:
    .asciz "El resultado de la operación es: "
    lenResultadoSumaMsg = .- resultado_suma_msg

resultado_promedio_msg:
    .asciz "El promedio del rango seleccionado es: "
    lenResultadoPromedioMsg = .- resultado_promedio_msg

resultado_minimo_msg:
    .asciz "El valor mínimo del rango seleccionado es: "
    lenResultadoMinimoMsg = .- resultado_minimo_msg

resultado_maximo_msg:
    .asciz "El valor máximo del rango seleccionado es: "
    lenResultadoMaximoMsg = .- resultado_maximo_msg

html_table_start:
    .ascii "<html>\n"
    .ascii "\t<head>\n"
    .ascii "\t\t<meta charset=\"UTF-8\">\n"
    .ascii "\t\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n"
    .ascii "\t\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
    .ascii "\t\t<title>Tabla De Símbolos</title>\n"
    .ascii "\t\t<link href=\"all.css\" rel=\"stylesheet\" type=\"text/css\">\n"
    .ascii "\t\t<link href=\"style.css\" rel=\"stylesheet\">\n"
    .ascii "\t\t<link href=\"https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i\" rel=\"stylesheet\">\n"
    .ascii "\t</head>\n"
    .ascii "\t<body class=\"bg-rose\">\n"
    .ascii "\t\t<div id=\"content-wrapper\" class=\"d-flex flex-column\">\n"
    .ascii "\t\t\t<div id=\"content\">\n"
    .ascii "\t\t\t\t<nav class=\"navbar navbar-expand navbar-light topbar mb-4 static-top shadow justify-content-center bg-gray-900 bg-gradient-dark2\">\n"
    .ascii "\t\t\t\t\t<label class=\"h1 text-coral\">ACYE1</label>\n"
    .ascii "\t\t\t\t\t<label class=\"h1 text-white\">- Proyecto 2</label>\n"
    .ascii "\t\t\t\t</nav>\n"
    .ascii "\t\t\t\t<div class=\"container-fluid bg-rose\">\n"
    .ascii "\t\t\t\t\t<div class=\"d-sm-flex justify-content-center\">\n"
    .ascii "\t\t\t\t\t\t<div class=\"col-xl-8 col-lg-7 justify-content-center ml-5 align-items-center\">\n"
    .ascii "\t\t\t\t\t\t\t<div class=\"card shadow mb-4\">\n"
    .ascii "\t\t\t\t\t\t\t\t<div class=\"row card-header bg-gray-900 py-3 justify-content-between\">\n"
    .ascii "\t\t\t\t\t\t\t\t\t<h6 class=\"h2 font-weight-bold text-turquoise\" bg-gray-900>TABLA EXPORTADA</h6>\n"
    .ascii "\t\t\t\t\t\t\t\t</div>\n"
    .ascii "\t\t\t\t\t\t\t\t<div class=\"card-body\">\n"
    .ascii "\t\t\t\t\t\t\t\t\t<div class=\"table-responsive\">\n"
    .ascii "\t\t\t\t\t\t\t\t\t\t<table class=\"table table-dark\" width=\"100%\" cellspacing=\"0\">\n"
    .ascii "\t\t\t\t\t\t\t\t\t\t\t<thead>\n"
len_html_table_start = . - html_table_start

html_header_end:
    .ascii "\t\t\t\t\t\t\t\t\t\t\t</thead>\n"
    .ascii "\t\t\t\t\t\t\t\t\t\t\t<tbody>\n"
len_html_header_end = . - html_header_end

html_table_end:
    .ascii "\t\t\t\t\t\t\t\t\t\t\t</tbody>\n"
    .ascii "\t\t\t\t\t\t\t\t\t\t</table>\n"
    .ascii "\t\t\t\t\t\t\t\t\t</div>\n"
    .ascii "\t\t\t\t\t\t\t\t</div>\n"
    .ascii "\t\t\t\t\t\t\t</div>\n"
    .ascii "\t\t\t\t\t\t</div>\n"
    .ascii "\t\t\t\t\t</div>\n"
    .ascii "\t\t\t\t</div>\n"
    .ascii "\t\t\t</div>\n"
    .ascii "\t\t</div>\n"
    .ascii "\t</body>\n"
    .ascii "</html>\n"
len_html_table_end = . - html_table_end



html_row_start:
    .ascii "\t\t\t\t\t\t\t\t\t\t\t<tr>\n"
len_html_row_start = . - html_row_start

html_row_end:
    .ascii "\t\t\t\t\t\t\t\t\t\t\t</tr>\n"
len_html_row_end = . - html_row_end

html_cell_start:
    .ascii "\t\t\t\t\t\t\t\t\t\t\t\t<td>"
len_html_cell_start = . - html_cell_start

html_cell_end:
    .ascii "</td>\n"
len_html_cell_end = . - html_cell_end

ingresar_encabezado_col_msg:
    .asciz "Ingrese el encabezado de la columna "
    lenIngresarEncabezadoColMsg = .- ingresar_encabezado_col_msg

closeFileSuccess:
    .asciz "El Archivo Se Ha Cerrado Correctamente\n"
    lenCloseFileSuccess = .- closeFileSuccess

errorImport:
    .asciz "Error En El Comando De Importación\n"
    lenErrorImport = .- errorImport
errorSave:
    .asciz "Error En El Comando De Guardado\n"
    lenErrorSave = .- errorSave
errorCmd:
    .asciz "Error, comando no encontrado\n"
    lenErrorCmd = .- errorCmd

errorPrimParam:
    .asciz "Error, primer parámetro incorrecto\n"
    lenErrorPrimParam = .- errorPrimParam

errorSegParam:
    .asciz "Error, segundo parámetro incorrecto\n"
    lenErrorSegParam = .- errorSegParam

errorColOutOfRange:
    .asciz "Error, columna fuera de rango, el rango es de A a K\n"
    lenErrColOutOfRange = .- errorColOutOfRange

errorColOutOfRange2:
    .asciz "Error, el numero de columna mas el numero de columnas a exportar excede a 11\n"
    lenErrColOutOfRange2 = .- errorColOutOfRange2

errorSum:
    .asciz "Error En El Comando de operación aritmética\n"
    lenErrorSum = .- errorSum

errorProm:
    .asciz "Error En El Comando de promedio\n"
    lenErrorProm = .- errorProm

errorCmdSec:
    .asciz "Error, comando secundario incorrecto (Y, EN, ENTRE, A LA)\n"
    lenErrorCmdSec = .- errorCmdSec

errorRowOutOfRange:
    .asciz "Error, fila fuera de rango, el rango es de 1 a 23\n"
    lenErrRowOutOfRange = .- errorRowOutOfRange

errorOpenFile:
    .asciz "Error al abrir el archivo\n"
    lenErrOpenFile = .- errorOpenFile

getIndexMsg:
    .asciz "Ingrese la columna para el encabezado "
    lenGetIndexMsg = .- getIndexMsg

err_valor_invalido_msg:
    .asciz "Error: Valor ingresado no válido, intente nuevamente\n"
    lenErrValorInvalido = .- err_valor_invalido_msg

errorRowNotFound:
    .asciz "Error: Fila no encontrada\n"
    lenErrorRowNotFound = .- errorRowNotFound

err_col_lt_1_msg:
    .asciz "Error: El primer parametro debe ser un numero mayor a 1 y menor a 23\n"
    lenErrColLt1 = .- err_col_lt_1_msg

err_division_cero_msg:
    .asciz "Error: No se puede dividir entre 0\n"
    lenErrDivisionCero = .- err_division_cero_msg

errorExport:
    .asciz "Error al exportar tabla\n"
    lenErrorExport = . - errorExport

readSuccess:
    .asciz "El Archivo Se Ha Leido Correctamente\n"
    lenReadSuccess = .- readSuccess

err_potencia_negativa_msg:
    .asciz "Error: No se puede elevar un numero a una potencia negativa\n"
    lenErrPotenciaNegativa = .- err_potencia_negativa_msg

.bss
input_opcion:
    .space 4

table_header:
    .space 20

arreglo:
    .rept 506
    .word 0
    .endr

val:
    .space 2

cell_col:
    .space 2

cell_row:
    .space 4 

bufferComando:
    .zero 50

filename:
    .space 100

buffer:
    .zero 4096

fileDescriptor:
    .space 8

listIndex:
    .zero 13

num:
    .space 8

col_imp:
    .space 1

character:
    .space 2

count:
    .zero 8
    

.text
.macro print stdout, reg, len
    MOV x0, \stdout
    LDR x1, =\reg
    MOV x2, \len
    MOV x8, 64
    SVC 0
.endm

.macro read stdin, reg, len
    MOV x0, \stdin
    LDR x1, =\reg
    MOV x2, \len
    MOV x8, 63
    SVC 0
.endm

itoa:
    // params: x0 => number, x1 => buffer address
    MOV x10, 0  // contador de digitos a imprimir
    MOV x12, 0  // flag para indicar si hay signo menos
    CBZ x0, i_zero
    CMP x0, 0
    MOV x2, 1
    BGT defineBase
    MOV  x12, 1
    MOV w5, '-'
    STRB w5, [x1], 1
    NEG x0, x0
    defineBase:
        CMP x2, x0      //Se compara el numero con la base 1, 10, 100, 1000, etc
        MOV x5, 0
        BGT i_convertirAscii      //Si la base es mayor que el numero, se sale del ciclo
        MOV x5, 10
        MUL x2, x2, x5  // Si la base es menor que el numero, se multiplica la base  por 10
        B defineBase

    i_zero:
        ADD x10, x10, 1
        MOV w5, '0'
        STRB w5, [x1], 1
        B i_endConversion

    i_convertirAscii:
        CBZ x2, i_endConversion
        UDIV x3, x0, x2             // Dividir el número entre la base, el residuo es el dígito a imprimir
        CBZ x3, i_reduceBase

        ADD x10, x10, 1
        CMP x10, 6
        BGE i_endConversion_mayor6

        MOV w5, w3
        ADD w5, w5, 48
        STRB w5, [x1], 1

        MUL x3, x3, x2
        SUB x0, x0, x3
        CMP x2, 1
        BLE i_endConversion

        i_reduceBase:
            MOV x5, 10
            UDIV x2, x2, x5

            CBNZ x10, i_addZero
            B i_convertirAscii

        i_addZero:
            CBNZ x3, i_convertirAscii
            ADD x10, x10, 1
            MOV w5, 48
            STRB w5, [x1], 1
            B i_convertirAscii
    i_endConversion_mayor6:
        MOV w5, '!' 
        STRB w5, [x1], 1
        B i_endConversion
    i_endConversion:
        ADD x10, x10, x12
        print 1, num, x10
        RET

itoa2:
    // params: x0 => number, x1 => buffer address
    MOV x10, 0  // contador de digitos a imprimir
    MOV x12, 0  // flag para indicar si hay signo menos
    CBZ x0, i_zero2
    CMP x0, 0
    MOV x2, 1
    BGT defineBase2
    MOV  x12, 1
    MOV w5, '-'
    STRB w5, [x1], 1
    NEG x0, x0
    defineBase2:
        CMP x2, x0      //Se compara el numero con la base 1, 10, 100, 1000, etc
        MOV x5, 0
        BGT i_convertirAscii2      //Si la base es mayor que el numero, se sale del ciclo
        MOV x5, 10
        MUL x2, x2, x5  // Si la base es menor que el numero, se multiplica la base  por 10
        B defineBase2

    i_zero2:
        ADD x10, x10, 1
        MOV w5, '0'
        STRB w5, [x1], 1
        B i_endConversion2

    i_convertirAscii2:
        CBZ x2, i_endConversion2
        UDIV x3, x0, x2             // Dividir el número entre la base, el residuo es el dígito a imprimir
        CBZ x3, i_reduceBase2

        ADD x10, x10, 1
        CMP x10, 6
        BGE i_endConversion_mayor62

        MOV w5, w3
        ADD w5, w5, 48
        STRB w5, [x1], 1

        MUL x3, x3, x2
        SUB x0, x0, x3
        CMP x2, 1
        BLE i_endConversion2

        i_reduceBase2:
            MOV x5, 10
            UDIV x2, x2, x5

            CBNZ x10, i_addZero2
            B i_convertirAscii2

        i_addZero2:
            CBNZ x3, i_convertirAscii2
            ADD x10, x10, 1
            MOV w5, 48
            STRB w5, [x1], 1
            B i_convertirAscii2
    i_endConversion_mayor62:
        MOV w5, '!' 
        STRB w5, [x1], 1
        B i_endConversion2
    i_endConversion2:
        ADD x10, x10, x12
        RET

atoi:
    // params: x5, x8 => buffer address
    SUB x5, x5, 1
    a_c_digits:
        LDRB w7, [x8], 1
        CBZ w7, a_c_convert
        CMP w7, 10  // Salto de línea   
        BEQ a_c_convert
        CMP w7, 32  // Espacio 
        BEQ a_c_convert
        B a_c_digits

    a_c_convert:
        SUB x8, x8, 2
        MOV x4, 1
        MOV x9, 0
        MOV x10, 0

        a_c_loop:
            ADD x10, x10, 1
            LDRB w7, [x8], -1
            CMP w7, '-'
            BEQ a_c_negative

            SUB w7, w7, 48
            MUL w7, w7, w4
            ADD w9, w9, w7

            MOV w6, 10
            MUL w4, w4, w6

            CMP x8, x5
            BNE a_c_loop
            B a_c_end

        a_c_negative:
            NEG X9, X9
        a_c_end:
            /*LDR x4, =num
            STR x8, [x4]
            print 1, salto, lenSalto
            print 1, num, 3
            print 1, salto, lenSalto*/
            RET
store_cell_row:
// params: x13 => bufferComando, x14 => cell_row
    STR xzr, [x14]
    LDRB w3, [x13], 1
    CMP w3, ' '
    BEQ err_row_not_found
    CMP w3, 10          // Salto de línea
    BEQ err_row_not_found
    CBZ w3, err_row_not_found
    
    STRB w3, [x14], 1
    
    LDRB w3, [x13], 1
    CBZ w3, ret_store_cell_row
    CMP w3, ' '
    BEQ ret_store_cell_row
    STRB w3, [x14], 1

    LDRB w3, [x13], 1
    CBZ w3, ret_store_cell_row
    CMP w3, 10          // Salto de línea
    BEQ ret_store_cell_row
    CMP w3, ' '
    BNE err_row_out_of_range
    ret_store_cell_row:
        //print 1, cell_row, 2
        RET
        
proc_save:
    LDR x14, =cmdsave // cargar comando de guardado
    LDR x13, =bufferComando

    save_loop:
        LDRB w2, [x14], 1
        LDRB w3, [x13], 1

        CBZ w2, save_cell

        CMP w2, w3
        BNE save_error

        B save_loop

        save_error:
            print 1, errorSave, lenErrorSave
            B end_proc_save
    save_cell:
        LDRB w2, [x13], 1   // cargar la letra (columna) o numero

        MOV W3, 'K'      // K
        CMP w2, W3
        BGT err_col_out_of_range

        CMP w2, 'A'      // A
        LDR x14, =cell_col
        STRB w2, [x14]
        LDR x14, =cell_row
        BGE cont_save_cell_index

        CMP w2, '*'      // 40 en ASCII 
        BEQ use_pointer_save

        CMP w2, '-'      // 0
        BLT err_prim_param // Si es menor a 0, error AGREGAR ERROR ESPECIFICO
        LDR x5, =num
        STR xzr, [x5]
        STRB w2, [x5], 1
        MOV x4, 1
        store_num_save_loop:
            MOV x2, xzr
            LDRB w2, [x13], 1
            CMP w2, ' '
            BEQ convert_num_save
            STRB w2, [x5], 1

            ADD x4, x4, 1
            B store_num_save_loop
        
        convert_num_save:
            LDR x5, =num
            LDR x8, =num
            STP x29, x30, [SP, -16]!
            BL atoi
            LDP x29, x30, [SP], 16
            B cont_save_num
        
        use_pointer_save:
            MOV x9, x28
            ADD x13, x13, 1
            B cont_save_num

        cont_save_cell_index:
            STP x29, x30, [SP, -16]!
            BL store_cell_row //guarda en cell_row la fila en ASCII
            LDP x29, x30, [SP], 16

            STP x29, x30, [SP, -16]!
            BL get_cell_sloth //Obtiene el slot de la matriz Y lo almacena en x6
            LDP x29, x30, [SP], 16

            LDR x4, =arreglo       // Dirección base del arreglo
            LDR x9, [x4, x6, LSL #3]       // Cargar el valor en x9
            
        cont_save_num:
            MOV x17, x9
            STRB wzr, [x14]
            LDR x14, =cmden
            verify_en:
                LDRB w2, [x14], 1   // comando EN 
                LDRB w3, [x13], 1   // BUFFER

                CBZ w2, get_second_param
        
                CMP w2, w3
                BNE err_prim_param

                B verify_en
        get_second_param:
            LDRB w2, [x13], 1   // cargar la letra (columna) o numero
            MOV W3, 'K'      // K
            CMP w2, W3
            BGT err_col_out_of_range
            CMP w2, 'A'      // A
            LDR x14, =cell_col
            STRB w2, [x14]
            LDR x14, =cell_row
            BGE cont_save_cell_index2
            B err_seg_param
            cont_save_cell_index2:
                STP x29, x30, [SP, -16]!
                BL store_cell_row //guarda en cell_row la fila en ASCII
                LDP x29, x30, [SP], 16

                STP x29, x30, [SP, -16]!
                BL get_cell_sloth //almacenado en x6
                LDP x29, x30, [SP], 16
                LDR x4, =arreglo       // Dirección base del arreglo
                STR x17, [x4, x6, LSL #3]       // Almacenar el valor en la matriz
    end_proc_save:
        RET
        
err_prim_param:
    print 1, errorPrimParam, lenErrorPrimParam
    B menucomando
err_seg_param:
    print 1, errorSegParam, lenErrorSegParam
    B menucomando

err_cmd_sec:
    print 1, errorCmdSec, lenErrorCmdSec
    B menucomando

get_cell_sloth:
    // params: ]cell_col y cell_row
    // salida: x6 => slot de la matriz
    // Interpretar la entrada
    LDR x14, =cell_col
    LDRB w16, [x14]          // Cargar la letra (columna)
    
    // Calcular la columna
    SUB w16, w16, 'A'        // Convertir letra a índice de columna (A=0, B=1, ..., Z=25)
    LDR x5, =cell_row
    LDR x8, =cell_row
    // Calcular la fila
    STP x29, x30, [SP, -16]!
    BL atoi                // Convertir la cadena de número a entero
    LDP x29, x30, [SP], 16
    SUB x9, x9, 1          // Restar 1 al índice de fila para obtener el índice de la celda

    CMP x9, 23             // Verificar si la fila está dentro del rango
    BGT err_row_out_of_range
    // Calcular la dirección de la celda
    MOV x5, 11              // Número de columnas
    MUL x6, x9, x5         // Calcular el desplazamiento de la fila
    ADD x6, x6, x16         // Añadir el desplazamiento de la columna
    // Cargar el valor almacenado en la celda
    
    RET

proc_prom:
    LDR x13, =bufferComando
    CMP x19, 10
    BGT cargar_otro_comando_prom
    LDR x14, =cmdprom // cargar comando de promedio
    B prom_loop
    cargar_otro_comando_prom:
        CMP x19, 11
        BGT cargar_otro_comando_prom2
        LDR x14, =cmdmin
        B prom_loop
        cargar_otro_comando_prom2:
            CMP x19, 12
            BGT cargar_otro_comando_prom3
            LDR x14, =cmdmax
            B prom_loop
            cargar_otro_comando_prom3:
                LDR x14, =cmdllenar
                B prom_loop

    prom_loop:
        LDRB w2, [x14], 1
        LDRB w3, [x13], 1

        CBZ w2, prom_cell1

        CMP w2, w3
        BNE prom_error

        B prom_loop

        prom_error:
            print 1, errorProm, lenErrorProm
            B end_proc_prom
    
    prom_cell1:
        LDRB w2, [x13], 1   // cargar la letra (columna) o numero
        MOV W3, 'K'      // K
        CMP w2, W3
        BGT err_col_out_of_range
        CMP w2, 'A'      // A
        BGE cont_prom_cell_index
        B err_col_out_of_range // Si no esta entre A y K, error
    
    cont_prom_cell_index:
        LDR x14, =cell_col
        STRB w2, [x14]
        LDR x14, =cell_row
        STP x29, x30, [SP, -16]!
        BL store_cell_row //guarda en cell_row la fila en ASCII
        LDP x29, x30, [SP], 16

        STP x29, x30, [SP, -16]!
        BL get_cell_sloth //almacenado en x6
        LDP x29, x30, [SP], 16
        MOV x22, x16             // se indica el numero de la primera columna
        MOV x17, x6

        LDR x14, =cmdhasta
        verify_hasta:
            LDRB w2, [x14], 1   // comando HASTA
            LDRB w3, [x13], 1   // BUFFER

            CBZ w2, get_second_param_prom
        
            CMP w2, w3
            BNE err_cmd_sec

            B verify_hasta
        
        get_second_param_prom:
            LDRB w2, [x13], 1   // cargar la letra (columna) o numero

            CMP w2,'K'
            BGT err_col_out_of_range

            CMP w2, 'A'      // A
            BGE cont_prom_cell_index2
            B err_col_out_of_range
            
            cont_prom_cell_index2:
                LDR x14, =cell_col
                STRB w2, [x14]
                LDR x14, =cell_row
                STP x29, x30, [SP, -16]!
                BL store_cell_row //guarda en cell_row la fila en ASCII
                LDP x29, x30, [SP], 16

                STP x29, x30, [SP, -16]!
                BL get_cell_sloth //almacenado en x6
                LDP x29, x30, [SP], 16
                //EN X9 Y X6 SE TIENE EL SLOT DEL SEGUNDO PARAMETRO
                //SE QUIERE GUARDAR EN X9 EL MAYOR Y EN X17 EL MENOR, PARA PODER RECORRER EL ARREGLO
                MOV x9, x6             
                MOV x18, x16             // Se almacena en x18 el numero de la segunda col
                
                CMP x17, x9
                CSEL x9, x17, x9, GT    // Se intercambian los valores para dejar en x9 el mayor
                CSEL x17, x6, x17, GT   // Se intercambian los valores para dejar en x17 el menor
  
                MOV x15, 0
                MOV x28, xzr           // Inicializar suma a 0
                //EN x22 se tiene el numero de la primera columna
                //EN x18 se tiene el numero de la segunda columna
                //EN x16 se tiene el numero de la segunda columna
                //Si el primer slot es mas grande que el segundo, se guarda x22 en x18
                //Es decir se guarda el numero de la primera columna en x18
                CSEL x18, x22, x18, GT    // Se intercambian para dejar en x18 la columna del mayor
                //Si el primer slot es mas grande que el segundo x16 se queda igual
                //Es decir
                CSEL x16, x16, x22, GT   // Se intercambian para dejar en x16 la columna del menor
                ADD x9, x9, 1        // Se incrmenta en para que recorra la ultima celda
                CMP x19, 10         // Se verifica si es el comando PROMEDIO
                LDR x4, =arreglo       // Dirección base del arreglo
                BGT comprobar_cmd_min
                //LDR x10, =cell_col
                B prom
                comprobar_cmd_min:
                    CMP x19, 11
                    BGT comprobar_cmd_max
                    LDR x5, [x4, x17, LSL #3]       // Cargar el valor en x5
                    MOV x28, x5                     // Inicializar el valor mínimo
                    ADD x17, x17, 1                // Mover a la siguiente celda
                    CMP x17, x9                     // Comparar si se ha llegado al final
                    BNE min                     // Si no se ha llegado al final, continuar
                    B end_proc_min             // Si se ha llegado al final, terminar
                comprobar_cmd_max:
                    CMP x19, 12
                    BGT comprobar_cmd_llenar  
                    LDR x5, [x4, x17, LSL #3]       // Cargar el valor en x5
                    MOV x28, x5
                    ADD x17, x17, 1
                    CMP x17, x9
                    BNE max
                    B end_proc_max
                comprobar_cmd_llenar:
                    B llenar
                prom:
                    LDR x19, [x4, x17, LSL #3]       // Cargar el valor en x19
                    MOV x23, 11
                    UDIV x2, x17, x23
                    MSUB x20, x2, x23, x17       // x20 contiene el residuo de la division entre 11
                    
                    CMP x20, x16               // Se compara el residuo con el numero de la primera columna
                    CINC x17, x17, LT       // Si el residuo es menor que el numero de la primera columna, se incrementa el slot
                    BLT prom                // Si el residuo es menor que el numero de la primera columna, se repite el ciclo
                    CMP x20, x18            // Se compara el residuo con el numero de la segunda columna
                    CINC x17, x17, GT       // Si el residuo es mayor que el numero de la segunda columna, se incrementa el slot
                    BGT prom

                    ADD x15, x15, #1         // Se incrementa en 1 el contador de celdas
                    ADD x28, x28, x19        // Se suma el valor de la celda a la suma
                    ADD x17, x17, 1
                    CMP x17, x9
                    BNE prom
                    end_prom:
                        UDIV x28, x28, x15
                        B end_proc_prom
                min:
                    LDR x19, [x4, x17, LSL #3]       // Cargar el valor en x19
                    MOV x23, 11
                    UDIV x2, x17, x23
                    MSUB x20, x2, x23, x17       // x20 contiene el residuo de la division entre 11
                    CMP x20, x16               // Se compara el residuo con el numero de la primera columna
                    CINC x17, x17, LT       // Si el residuo es menor que el numero de la primera columna, se incrementa el slot
                    BLT min                // Si el residuo es menor que el numero de la primera columna, se repite el ciclo
                    
                    CMP x20, x18            // Se compara el residuo con el numero de la segunda columna
                    CINC x17, x17, GT       // Si el residuo es mayor que el numero de la segunda columna, se incrementa el slot
                    BGT min

                    CMP x19, x28
                    CSEL x28, x19, x28, LT
                    ADD x17, x17, 1
                    CMP x17, x9
                    BGE end_proc_min

                    B min
                
                max:
                    LDR x19, [x4, x17, LSL #3]       // Cargar el valor en x19
                    MOV x23, 11
                    UDIV x2, x17, x23
                    MSUB x20, x2, x23, x17       // x20 contiene el residuo de la division entre 11
                    CMP x20, x16               // Se compara el residuo con el numero de la primera columna
                    CINC x17, x17, LT       // Si el residuo es menor que el numero de la primera columna, se incrementa el slot
                    BLT max                // Si el residuo es menor que el numero de la primera columna, se repite el ciclo
                    
                    CMP x20, x18            // Se compara el residuo con el numero de la segunda columna
                    CINC x17, x17, GT       // Si el residuo es mayor que el numero de la segunda columna, se incrementa el slot
                    BGT max

                    CMP x19, x28
                    CSEL x28, x19, x28, GT
                    ADD x17, x17, 1
                    CMP x17, x9
                    BGE end_proc_max
                    
                    B max
                
                llenar:
                    MOV x23, 11
                    UDIV x14, x17, x23             // x14 contiene la fila actual
                    MSUB x20, x14, x23, x17       // x20 contiene el residuo de la division entre 11
                                
                    CMP x20, x16               // Se compara el residuo con el numero de la primera columna
                    CINC x17, x17, LT       // Si el residuo es menor que el numero de la primera columna, se incrementa el slot
                    BLT llenar                // Si el residuo es menor que el numero de la primera columna, se repite el ciclo
                    CMP x20, x18            // Se compara el residuo con el numero de la segunda columna
                    CINC x17, x17, GT       // Si el residuo es mayor que el numero de la segunda columna, se incrementa el slot
                    BGT llenar

                    get_current_index:
                        LDR x19, =cell_col
                        ADD x20, x20, 'A'    // Convertir el índice de columna a letra
                        STRB w20, [x19]

                regreso:
                    // Solicitar al usuario que ingrese un valor para la celda
                    print 1, ingresar_valor_msg, lenIngresarValorMsg
                    print 1, cell_col, 1
                    ADD X0, x14, 1
                    LDR x1, =num
                    STP x29, x30, [SP, -16]!
                    BL itoa
                    LDP x29, x30, [SP], 16
                    print 1, dpuntos, lenDpuntos
                    print 1, espacio2, lenEspacio2
                    print 1, flecha, lenFlecha
                    LDR x8, =num
                    STR xzr, [x8]
                    read 0, num, 8
                    LDR x8, =num

                    loopComprobar:
                        LDRB w19, [x8], 1
                        CBZ w19, convertir
                        CMP w19, 10  // Salto de línea   
                        BEQ convertir
                        CMP w19, 32  // Espacio 
                        BEQ convertir
                        CMP w19, 45  // Signo menos
                        BEQ loopComprobar
                        CMP w19, 48  // 0
                        BLT err_valor_invalido
                        CMP w19, 57  // 9
                        BGT err_valor_invalido
                        B loopComprobar

                    convertir:

                    LDR x8, =num
                    LDR x5, =num
                    
                    STP x29, x30, [SP, -16]!
                    STR x9, [SP, -8]          // Guardar x9 en el stack
                    BL atoi
                    // Almacenar el valor en la matriz
                    LDR x4, =arreglo       // Dirección base del arreglo
                    STR x9, [x4, x17, LSL #3]

                    LDR x9, [SP, -8]          // Cargar x9 desde el stack
                    LDP x29, x30, [SP], 16

                    ADD x17, x17, 1
                    CMP x17, x9
                    BNE llenar
                    B end_proc_llenar
    end_proc_llenar:
        RET
    end_proc_min:
        print 1, resultado_minimo_msg, lenResultadoMinimoMsg
        RET
    end_proc_max:
        print 1, resultado_maximo_msg, lenResultadoMaximoMsg
        RET
    end_proc_prom:
        print 1, resultado_promedio_msg, lenResultadoPromedioMsg
        RET
    err_valor_invalido:
    print 1, err_valor_invalido_msg, lenErrValorInvalido
    B regreso


proc_op:
    // params: x13 => bufferComando
    // salida: x28 => suma
    LDR x13, =bufferComando
    CMP x19, 1
    BGT cargar_otro_comando_aritmetico
    LDR x14, =cmdsum // cargar comando de suma
    B op_loop
    cargar_otro_comando_aritmetico:
        CMP x19, 2
        BGT cargar_otro_comando_aritmetico2
        LDR x14, =cmdres
        B op_loop
        cargar_otro_comando_aritmetico2:
            CMP x19, 3
            BGT cargar_otro_comando_aritmetico3
            LDR x14, =cmdmul
            B op_loop
            cargar_otro_comando_aritmetico3:
                CMP x19, 4
                BGT cargar_otro_comando_aritmetico4
                LDR x14, =cmddiv
                B op_loop
                cargar_otro_comando_aritmetico4:
                    CMP x19, 5
                    BGT cargar_otro_comando_aritmetico5
                    LDR x14, =cmdpot
                    B op_loop
                    cargar_otro_comando_aritmetico5:
                        CMP x19, 6
                        BGT cargar_otro_comando_aritmetico6
                        LDR x14, =cmdologico
                        B op_loop
                        cargar_otro_comando_aritmetico6:
                            CMP x19, 7
                            BGT cargar_otro_comando_aritmetico7
                            LDR x14, =cmdylogico
                            B op_loop
                            cargar_otro_comando_aritmetico7:
                                CMP x19, 8
                                BGT cargar_otro_comando_aritmetico8
                                LDR x14, =cmdoxlogico
                                B op_loop
                                cargar_otro_comando_aritmetico8:
                                    CMP x19, 9
                                    LDR x14, =cmdnologico
                                    B op_loop
    op_loop:
        LDRB w2, [x14], 1
        LDRB w3, [x13], 1

        CBZ w2, op_cell

        CMP w2, w3
        BNE op_error

        B op_loop

        op_error:
            print 1, errorSum, lenErrorSum
            B end_proc_op
    op_cell:
        LDRB w2, [x13], 1   // cargar la letra (columna) o numero
        MOV W3, 'K'      // K
        CMP w2, W3
        BGT err_col_out_of_range
        CMP w2, 'A'      // A
        BGE cont_op_cell_index
        CMP w2, '*'      // 40 en ASCII 
        BEQ use_pointer_sum1
        CMP w2, '-'      // 0
        BLT err_prim_param // Si es menor a 0, error AGREGAR ERROR ESPECIFICO
        LDR x5, =num
        STR xzr, [x5]
        STRB w2, [x5], 1
        MOV x4, 1
        store_num_op_loop:
            MOV x2, xzr
            LDRB w2, [x13], 1
            CMP w2, ' '
            BEQ convert_num_op
            STRB w2, [x5], 1

            ADD x4, x4, 1
            B store_num_op_loop
        use_pointer_sum1:
            MOV x17, x28
            ADD x13, x13, 1
            B cont_op_num
        convert_num_op:
            LDR x5, =num
            LDR x8, =num
            STP x29, x30, [SP, -16]!
            BL atoi
            LDP x29, x30, [SP], 16
            MOV x5, xzr
            MOV x8, xzr
            MOV x17, x9
            B cont_op_num
        cont_op_cell_index:
            LDR x14, =cell_col
            STRB w2, [x14]
            LDR x14, =cell_row

            STP x29, x30, [SP, -16]!
            BL store_cell_row //guarda en cell_row la fila en ASCII
            LDP x29, x30, [SP], 16

            STP x29, x30, [SP, -16]!
            BL get_cell_sloth //almacenado en x6
            LDP x29, x30, [SP], 16

            LDR x4, =arreglo       // Dirección base del arreglo
            LDR x17, [x4, x6, LSL #3]       // Cargar el valor en x17

        cont_op_num:
            CMP x19, 3
            BGT cargar_otro_comando
            LDR x14, =cmdy
            B verify_y
            cargar_otro_comando:
                cmp x19, 4
                BGT cargar_otro_comando2
                LDR x14, =cmdentre
                B verify_y
            cargar_otro_comando2:
                cmp x19, 5
                BGT cargar_otro_comando3
                LDR x14, =cmda_la
                B verify_y
            cargar_otro_comando3:
                LDR x14, =cmdy
                B verify_y

            verify_y:
                LDRB w2, [x14], 1   // comando Y, ENTRE O A LA
                LDRB w3, [x13], 1   // BUFFER

                CBZ w2, get_second_param_op
        
                CMP w2, w3
                BNE err_cmd_sec

                B verify_y
        get_second_param_op:
            LDRB w2, [x13], 1   // cargar la letra (columna) o numero

            CMP w2,'K'
            //BGT err_col_out_of_range

            CMP w2, 'A'      // A
            BGE cont_op_cell_index2

            CMP w2, '*'      // 40 en ASCII
            BEQ use_pointer_sum2

            CMP w2, '-'      
            BLT err_prim_param // Si es menor a 0, error AGREGAR ERROR ESPECIFICO
            
            LDR x5, =num
            STR xzr, [x5]
            STRB w2, [x5], 1
            MOV x4, 1
            store_num_op_loop2:
                MOV x2, xzr
                LDRB w2, [x13], 1
                CBZ w2, convert_num_op2
                CMP w2, ' '
                BEQ convert_num_op2
                CMP w2, '\n'
                BEQ convert_num_op2
                STRB w2, [x5], 1

                ADD x4, x4, 1
                B store_num_op_loop2
            use_pointer_sum2:
                MOV x9, x28
                ADD x13, x13, 1
                B cont_op_num2

            convert_num_op2:
                LDR x5, =num
                LDR x8, =num
                STP x29, x30, [SP, -16]!
                BL atoi
                LDP x29, x30, [SP], 16
                MOV x5, xzr
                MOV x8, xzr
                B cont_op_num2
            cont_op_cell_index2:
                LDR x14, =cell_col
                STRB w2, [x14]
                LDR x14, =cell_row
                STP x29, x30, [SP, -16]!
                BL store_cell_row //guarda en cell_row la fila en ASCII
                LDP x29, x30, [SP], 16

                STP x29, x30, [SP, -16]!
                BL get_cell_sloth //almacenado en x6
                LDP x29, x30, [SP], 16

                LDR x4, =arreglo       // Dirección base del arreglo
                LDR x9, [x4, x6, LSL #3]       // Cargar el valor en x9
            
            cont_op_num2:
                MOV x28, xzr
                CMP x19, 1
                BEQ suma
                CMP x19, 2
                BEQ resta
                CMP x19, 3
                BEQ multiplicacion
                CMP x19, 4
                BEQ division
                CMP x19, 5
                BEQ potencia
                CMP x19, 6
                BEQ or_logico
                CMP x19, 7
                BEQ and_logico
                CMP x19, 8
                BEQ xor_logico
                CMP x19, 9
                BEQ not_logico
                suma:
                    ADDS x9, x17, x9      // Sumar el valor en x9
                    B end_operacion
                
                resta:
                    SUBS x9, x17, x9      // Restar el valor en x9
                    B end_operacion

                multiplicacion:
                    MUL x9, x17, x9       // Multiplicar el valor en x9
                    B end_operacion
                
                division:
                    CMP x9, 0
                    BEQ err_division
                    SDIV x9, x17, x9      // Dividir el valor en x9
                    B end_operacion

                    err_division:
                        print 1, err_division_cero_msg, lenErrDivisionCero
                        B menucomando
                
                potencia:
                    MOV x10, 1
                    MOV x11, 0
                    CMP x9, 0
                    BLT err_potencia_negativa
                    potencia_loop:
                        CMP x11, x9
                        BGE end_potencia
                        MUL x10, x10, x17
                        ADD x11, x11, 1
                        B potencia_loop
                    end_potencia:
                        MOV x9, x10
                        B end_operacion
                    err_potencia_negativa:
                        print 1, err_potencia_negativa_msg, lenErrPotenciaNegativa
                        B menucomando

                or_logico:
                    ORR x9, x17, x9       // OR lógico a nivel de bits
                    B end_operacion

                and_logico:
                    AND x9, x17, x9       // AND lógico a nivel de bits
                    B end_operacion

                xor_logico:
                    EOR x9, x17, x9       // XOR lógico a nivel de bits
                    B end_operacion

                not_logico:
                    MVN x9, x17           // NOT lógico a nivel de bits
                    B end_operacion

                end_operacion:
                MOV x28, x9
                MOV x9, xzr
                MOV x17, xzr
    end_proc_op:
        RET

proc_import:
    LDR x0, =cmdimp // cargar comando de importación
    LDR x1, =bufferComando

    imp_loop:
        LDRB w2, [x0], 1
        LDRB w3, [x1], 1

        CBZ w2, imp_filename

        CMP w2, w3
        BNE imp_error

        B imp_loop

        imp_error:
            print 1, errorImport, lenErrorImport
            B end_proc_import
    imp_filename:
        LDR x0, =filename
        imp_file_loop:
            LDRB w2, [x1], 1

            CMP w2, 32              // espacio
            BEQ cont_imp_file

            STRB w2, [x0], 1        
            B imp_file_loop         // continuar leyendo el nombre del archivo
        
        cont_imp_file:
            STRB wzr, [x0]  
            LDR x0, =cmdsep
            cont_imp_loop:
                LDRB w2, [x0], 1
                LDRB w3, [x1], 1
                
                CBZ w2, end_proc_import
                B cont_imp_loop

                CMP w2, w3
                BNE imp_error
    end_proc_import:
        RET

import_data:
    LDR x1, =filename
    STP x29, x30, [SP, -16]!
    BL openFile
    LDP x29, x30, [SP], 16

    LDR x25, =buffer
    MOV x10, 0
    LDR x11, =fileDescriptor
    LDR x11, [x11]
    MOV x17, 0 //contador de columnas
    LDR x15, =listIndex

    read_head:
        read x11, character, 1
        LDR x4, =character
        LDRB w2, [x4]

        CMP w2, 44          // Coma
        BEQ getIndex

        CMP w2, 10          // Salto de línea
        BEQ getIndex

        STRB w2, [x25], 1       // Guardar caracter en buffer
        ADD x10, x10, 1         // Incrementar contador de caracteres
        B read_head

        getIndex:
            print 1, getIndexMsg, lenGetIndexMsg
            print 1, buffer, x10
            print 1, dpuntos, lenDpuntos
            print 1, espacio2, lenEspacio2

            LDR x4, =character
            LDRB w7, [x4]

            read 0, character, 2

            LDR x4, =character
            LDRB w2, [x4]
            SUB w2, w2, 65          // Se restan 65 para obtener el índice de la columna (A=0, B=1, ..., Z=25)
            
            STRB w2, [x15], 1
            ADD x17, x17, 1

            CMP w7, 10              // Salto de línea
            BEQ end_header

            LDR x25, =buffer
            MOV x10, 0
            B read_head

        end_header:
            STP x29, x30, [SP, -16]!
            BL readCSV
            LDP x29, x30, [SP], 16

            RET
            

readCSV:
    LDR x10, =num
    LDR x11,  =fileDescriptor
    LDR x11, [x11]
    MOV x21, 0  // contador de filas
    LDR x15, =listIndex // contador de columnas

    rd_num:
        read x11, character, 1
        LDR x4, =character
        LDRB w3, [x4]
        CMP w3, 44              // Coma
        BEQ rd_cv_num

        CMP w3, 10              // Salto de línea
        BEQ rd_cv_num

        MOV x25, x0
        CBZ x0, rd_cv_num

        STRB w3, [x10], 1
        B rd_num

    rd_cv_num:
        LDR x5, =num
        LDR x8, =num

        STP x29, x30, [SP, -16]!

        BL atoi

        LDP x29, x30, [SP], 16

        MOV x5, xzr
        MOV x8, xzr

        LDRB w16, [x15], 1 // obtener la columna

        LDR x20, =arreglo
        MOV x22, 11                          // x22 contiene el número de columnas
        MUL x22, x21, x22                      // x21 contiene la fila actual
        ADD x22, x16, x22                   // x16 contiene la columna actual

        //Se almacena el número en la matriz 
        STR x9, [x20, x22, LSL #3]        // w9 contiene el valor del número, x22 contiene la dirección del slot de la matriz

        LDR x12, =num
        MOV w13, 0
        MOV x14, 0
        
        LDR x20, =listIndex
        SUB x20, x15, x20       // x20 contiene el número de columnas restantes, se resta el índice de la columna actual
        CMP x20, x17            // Se compara el número de columnas restantes con el número de columnas leídas
        // Si no se han leído todas las columnas, se lee la siguiente columna
        // Si se han leído todas las columnas, se lee el siguiente nú
        BNE cls_num
        
        LDR x15, =listIndex
        ADD x21, x21, 1

        cls_num:
            STRB w13, [x12], 1
            ADD x14, x14, 1
            CMP x14, 7          //x14 contiene el número de caracteres en el buffer
            BNE cls_num         // Si no se han leído todos los caracteres, se limpia el buffer y se lee el siguiente número
            LDR x10, =num       // x10 contiene la dirección del buffer
            CBNZ x25, rd_num    // Si el buffer no está vacío, se lee el siguiente número

    rd_end:
        print 1, salto, lenSalto
        print 1, readSuccess, lenReadSuccess
        read 0, character, 2
        RET


openFile:
    // param: x1 => filename
    MOV x0, -100
    MOV x2, 0
    MOV x8, 56
    SVC 0

    CMP x0, 0
    BLE op_f_error
    LDR x9, =fileDescriptor
    STR x0, [x9]
    B op_f_end

    op_f_error:
        print 1, errorOpenFile, lenErrOpenFile
        read 0, character, 2
    
    op_f_end:
        RET
openReport:
    MOV x0, -100        // open
    LDR x1, =filename   // filename address
    MOV x2, 101         // O_WRONLY | O_CREAT
    MOV x3, 0777        // permissions
    MOV x8, 56          // openat
    SVC #0              // syscall

    CMP x0, 0
    BLE op_r_error
    LDR x2, =fileDescriptor
    STR x0, [x2]
    B op_r_end

    op_r_error:
        print 1, errorOpenFile, lenErrOpenFile
        RET

    op_r_end:
        print 1, createSucces, lenCreateSuccess
        RET


closeFile:
    print 1, closeFileSuccess, lenCloseFileSuccess
    LDR x0, =fileDescriptor
    LDR x0, [x0]
    MOV x8, 57
    SVC 0
    RET

proc_export:
    LDR x14, =cmdexp // cargar comando de exportación
    LDR x13, =bufferComando
    exp_loop:
        LDRB w2, [x14], 1
        LDRB w3, [x13], 1

        CBZ w2, exp_from
        CMP w2, w3
        BNE exp_error

        B exp_loop

        exp_error:
            print 1, errorExport, lenErrorExport
            B end_proc_export
    exp_from:
        LDRB w2, [x13], 1   // cargar  primer byte de numero
        CMP w2, '1'
        BLT err_col_lt_1
        CMP w2, '9'
        BGT err_col_lt_1
        LDR x5, =num
        STR xzr, [x5]
        STRB w2, [x5], 1
        LDRB w2, [x13], 1
        CMP w2, ' '
        BEQ convert_num_exp
        CMP w2, '0'
        BLT err_col_lt_1
        CMP w2, '9'
        BGT err_col_lt_1
        STRB w2, [x5], 1
        LDRB w2, [x13], 1
        CMP w2, ' '
        BEQ convert_num_exp

        err_col_lt_1:
            print 1, err_col_lt_1_msg, lenErrColLt1
            B menucomando
    convert_num_exp:
        LDR x5, =num
        LDR x8, =num
        STP x29, x30, [SP, -16]!
        BL atoi
        LDP x29, x30, [SP], 16
        MOV x5, xzr
        MOV x8, xzr
        LDR x14, =cmddesde
        verify_desde:
            LDRB w2, [x14], 1   // comando  Desde
            LDRB w3, [x13], 1   // BUFFER
            CBZ w2, get_second_param_exp

            CMP w2, w3
            BNE err_cmd_sec
            B verify_desde
            
            
    get_second_param_exp:
        

        LDRB w2, [x13], 1   // cargar la letra (columna)

        CMP w2,'K'
        BGT err_col_out_of_range

        CMP w2, 'A'      // A
        BLT err_col_out_of_range

        SUB w17, w2, 65          // Se restan 65 para obtener el índice de la columna (A=0, B=1, ..., Z=25) 
        ADD w8, w17, w9             // x8 = numero de columna + cantidad de columnas a imprimir
        CMP w8, 11
        BGT err_col_out_of_range2
        LDRB w2, [x13], 1   // 
        CMP w2, ' '
        BNE err_col_out_of_range
        LDR x14, =cmdhacia
        verify_hacia:
            LDRB w2, [x14], 1   // comando  Hacia
            LDRB w3, [x13], 1   // BUFFER
            CBZ w2, exp_filename
    
            CMP w2, w3
            BNE err_cmd_sec
            B verify_hacia
    

    exp_filename:
        LDR x4, =filename
        exp_file_loop:
            LDRB w2, [x13], 1
            CBZ w2, cont_exp_file
            CMP w2, '\n'              // espacio
            BEQ cont_exp_file

            STRB w2, [x4], 1        
            B exp_file_loop         // continuar leyendo el nombre del archivo
        
        cont_exp_file:
            STRB wzr, [x4]  
    end_proc_export:
        //Salida x9 = numero de columnas
        //Salida x17 = Columna inicial
        //Salida filename = nombre del archivo
        RET
export_data:
    LDR x1, =filename
    STP x29, x30, [SP, -16]!
    BL openReport
    LDP x29, x30, [SP], 16

    ADR x21, fileDescriptor  // Cargar la dirección de fileDescriptor en x21
    LDR x20, [x21]           // Cargar el valor almacenado en la dirección fileDescriptor en x20
    print x20, html_table_start, len_html_table_start
    //x17 contiene el primer slot a imprimir

    LDR x1, =num
    MOV x0, x9
    STP x29, x30, [SP, -16]!
    BL itoa
    LDP x29, x30, [SP], 16

    MOV x6, 0
    print x20, html_row_start, len_html_row_start
    loop_get_headers:
        print 1, ingresar_encabezado_col_msg, lenIngresarEncabezadoColMsg
        CMP x6, 9
        BLT num_simple
        MOV x1, 10
        ADD x5, x6, 1
        UDIV x0, x5, x1
        MSUB x2, x0, x1, x5
        
        LDR x1, =num
        ADD x0, x0, 48
        STRB w0, [x1], 1
        ADD x2, x2, 48
        STRB w2, [x1], 1
        print 1, num, 2
        B continuacion_getheaders
            num_simple:
                LDR x1, =num
                ADD x0, x6, 49
                STR x0, [x1]
                print 1, num, 1
        continuacion_getheaders:
       
        print 1, dpuntos, lenDpuntos
        print 1, espacio2, lenEspacio2
        print x20, html_cell_start, len_html_cell_start
        read 0, table_header, 20
        MOV x10, 0
        ldr x5, =table_header
        loop_get_header_size:
            LDRB w2, [x5, x10]
            CBZ w2, end_get_headers
            CMP w2, 10  // Salto de línea
            BEQ end_get_headers
            ADD x10, x10, 1
            B loop_get_header_size

        end_get_headers:
        print x20, table_header, x10
        print x20, html_cell_end, len_html_cell_end
        ADD x6, x6, 1
        CMP x6, x9
        BLT loop_get_headers
        print x20, html_row_end, len_html_row_end
        print x20, html_header_end, len_html_header_end


        MOV x16, x17        // x16 contiene la primera columna
        ADD x18, x16, x9        // x18 contiene la última columna
        SUB x18, x18, 1
        //x17 contiene el slot actual
        //x9 contiene el numero de columnas
        ADD x9, x18, 243
        LDR x4, =arreglo
        loop_get_content:
            MOV x23, 11
            UDIV x2, x17, x23
            MSUB x23, x2, x23, x17       // x23 contiene el residuo de la division entre 11
            //x23 contiene la columna actual
            //x2 contiene la fila actual
            CMP x23, x16               // comparar columna con primera columna
            BNE continue_loop_content

            print x20, html_row_start, len_html_row_start

            continue_loop_content:
            CINC x17, x17, LT       // si columna actual es menor que la primera columna, se incrementa el slot
            BLT loop_get_content                // Si columna actual es menor que el numero de la primera columna, se repite el ciclo
            CMP x23, x18            // comparar columna actual con el numero de la ultima columna
            CINC x17, x17, GT       // Si el residuo es mayor que el numero de la ultima columna, se incrementa el slot
            BGT loop_get_content

            print x20, html_cell_start, len_html_cell_start

            LDR x19, [x4, x17, LSL #3]       // Cargar el valor en x19
            MOV x0, x19
            LDR x1, =num
            STP x29, x30, [SP, -16]!
            BL itoa2
            LDP x29, x30, [SP], 16

            print x20, num, x10

            print x20, html_cell_end, len_html_cell_end

            CMP x23, x18
            BNE continue_loop_content2

           print x20, html_row_end, len_html_row_end

            continue_loop_content2:
            ADD x17, x17, 1
            CMP x17, x9
            BLT loop_get_content     

        print x20, html_table_end, len_html_table_end
        STP x29, x30, [SP, -16]!
        BL closeFile
        LDP x29, x30, [SP], 16
        RET
    
        
print_matrix:
    LDR x4, =arreglo    // cargar dirección de la matriz
    MOV x9, 0  // index de slots
    MOV x7, 0 // Contador de filas
    LDR x18, =cols
    LDR x19, =val
    
    printCols:
        LDRB w20, [x18], 1
        STRB w20, [x19]

        print 1, val, 1
        print 1, espacio, lenEspacio
        ADD x7, x7, 1
        CMP x7, 12
        BNE printCols
        print 1, salto, lenSalto

    MOV x7, 0
    LDR x18, =rows
    LDR x19, =val

    loop1:
        LDRB w20, [x18, x7]
        STRB w20, [x19]
        LDRB w0, [x19]
        SUB w0, w0, 48
        LDR x1, =num
        STP x29, x30, [SP, -16]!
        BL itoa
        LDP x29, x30, [SP], 16
        print 1, espacio, lenEspacio

        MOV x13, 0 // Contador de columnas
        loop2:
            MOV x15, 0 
            LDR x15, [x4, x9, LSL #3]   // cargar valor del slot de la matriz

            // Convertir dato del slot a ASCII
            MOV x0, x15
            LDR x1, =num

            STP x29, x30, [SP, -16]!
            BL itoa
            LDP x29, x30, [SP], 16

            print 1, espacio, lenEspacio

            ADD x9, x9, 1 // incrementar index de slots
            ADD x13, x13, 1   // incrementar contador de columnas
            CMP x13, 11
            BNE loop2

        print 1, salto, lenSalto

        ADD x7, x7, 1
        CMP x7, 23
        BNE loop1

        RET

_start:
        print 1, header, lenHeader
        read 0, input_opcion, 3
        mov x13, '\n'
        ldr x5, =input_opcion
        ldrb w5, [x5]
        
        cmp x13, x5
        bne _start
        MOV x28, 0
        
        BL print_matrix         // imprimir matriz vacía
    menucomando:
            print 1, menu_cmd_msg, lenMenuCmdMsg
            read 0, bufferComando, 50   // leer comando de importación
            B findcmd

    exit: 
        MOV x0, 0
        MOV x8, 93
        SVC 0

findcmd:
    LDR x0, =cmdsave
    LDR x1, =bufferComando
    STP x29, x30, [SP, -16]!
    BL findcmd_loop
    LDP x29, x30, [SP], 16
    CMP x2, 1         // Indicador de que el comando coincide
    BEQ fn_saveCMD

    LDR x0, =cmdsum
    LDR x1, =bufferComando
    STP x29, x30, [SP, -16]!
    BL findcmd_loop
    LDP x29, x30, [SP], 16
    CMP x2, 1         // Indicador de que el comando coincide
    MOV X19, 1  // INDICADOR DE OPERACION 1 = SUMA
    BEQ fn_aritmetic_op_cmd

    LDR x0, =cmdres
    LDR x1, =bufferComando
    STP x29, x30, [SP, -16]!
    BL findcmd_loop
    LDP x29, x30, [SP], 16
    CMP x2, 1         // Indicador de que el comando coincide
    MOV X19, 2  // INDICADOR DE OPERACION 2 = RESTA
    BEQ fn_aritmetic_op_cmd

    LDR x0, =cmdmul
    LDR x1, =bufferComando
    STP x29, x30, [SP, -16]!
    BL findcmd_loop
    LDP x29, x30, [SP], 16
    CMP x2, 1         // Indicador de que el comando coincide
    MOV X19, 3  // INDICADOR DE OPERACION 3 = MULTIPLICACION
    BEQ fn_aritmetic_op_cmd

    LDR x0, =cmddiv
    LDR x1, =bufferComando
    STP x29, x30, [SP, -16]!
    BL findcmd_loop
    LDP x29, x30, [SP], 16
    CMP x2, 1         // Indicador de que el comando coincide
    MOV X19, 4  // INDICADOR DE OPERACION 4 = DIVISION
    BEQ fn_aritmetic_op_cmd

    LDR x0, =cmdpot
    LDR x1, =bufferComando
    STP x29, x30, [SP, -16]!
    BL findcmd_loop
    LDP x29, x30, [SP], 16
    CMP x2, 1         // Indicador de que el comando coincide
    MOV X19, 5  // INDICADOR DE OPERACION 5 = POTENCIA
    BEQ fn_aritmetic_op_cmd

    LDR x0, =cmdologico
    LDR x1, =bufferComando
    STP x29, x30, [SP, -16]!
    BL findcmd_loop
    LDP x29, x30, [SP], 16
    CMP x2, 1         // Indicador de que el comando coincide
    MOV X19, 6  // INDICADOR DE OPERACION 6 = OR LOGICO
    BEQ fn_aritmetic_op_cmd

    LDR x0, =cmdylogico
    LDR x1, =bufferComando
    STP x29, x30, [SP, -16]!
    BL findcmd_loop
    LDP x29, x30, [SP], 16
    CMP x2, 1         // Indicador de que el comando coincide
    MOV X19, 7  // INDICADOR DE OPERACION 7 = AND LOGICO
    BEQ fn_aritmetic_op_cmd

    LDR x0, =cmdoxlogico
    LDR x1, =bufferComando
    STP x29, x30, [SP, -16]!
    BL findcmd_loop
    LDP x29, x30, [SP], 16
    CMP x2, 1         // Indicador de que el comando coincide
    MOV X19, 8  // INDICADOR DE OPERACION 8 = XOR LOGICO
    BEQ fn_aritmetic_op_cmd

    LDR x0, =cmdnologico
    LDR x1, =bufferComando
    STP x29, x30, [SP, -16]!
    BL findcmd_loop
    LDP x29, x30, [SP], 16
    CMP x2, 1         // Indicador de que el comando coincide
    MOV X19, 9  // INDICADOR DE OPERACION 9 = NOT LOGICO
    BEQ fn_aritmetic_op_cmd

    LDR x0, =cmdprom
    LDR x1, =bufferComando
    STP x29, x30, [SP, -16]!
    BL findcmd_loop
    LDP x29, x30, [SP], 16
    CMP x2, 1         // Indicador de que el comando coincide
    MOV x19, 10
    BEQ fn_promCMD

    LDR x0, =cmdmin
    LDR x1, =bufferComando
    STP x29, x30, [SP, -16]!
    BL findcmd_loop
    LDP x29, x30, [SP], 16
    CMP x2, 1         // Indicador de que el comando coincide
    MOV x19, 11
    BEQ fn_promCMD

    LDR x0, =cmdmax
    LDR x1, =bufferComando
    STP x29, x30, [SP, -16]!
    BL findcmd_loop
    LDP x29, x30, [SP], 16
    CMP x2, 1         // Indicador de que el comando coincide
    MOV x19, 12
    BEQ fn_promCMD

    LDR x0, =cmdllenar
    LDR x1, =bufferComando
    STP x29, x30, [SP, -16]!
    BL findcmd_loop
    LDP x29, x30, [SP], 16
    CMP x2, 1         // Indicador de que el comando coincide
    MOV x19, 13
    BEQ fn_llenarCMD

    LDR x0, =cmdimp
    LDR x1, =bufferComando
    STP x29, x30, [SP, -16]!
    BL findcmd_loop
    LDP x29, x30, [SP], 16
    CMP x2, 1         // Indicador de que el comando coincide
    BEQ fn_importCMD

    LDR x0, =cmdexp
    LDR x1, =bufferComando
    STP x29, x30, [SP, -16]!
    BL findcmd_loop
    LDP x29, x30, [SP], 16
    CMP x2, 1         // Indicador de que el comando coincide
    BEQ fn_exportCMD

    B fn_errorCMD

fn_saveCMD:
    BL proc_save

    BL print_matrix         // imprimir matriz con datos
    B menucomando

fn_aritmetic_op_cmd:
    BL proc_op
    print 1, resultado_suma_msg, lenResultadoSumaMsg
    MOV x0, x28
    LDR x1, =num
    STP x29, x30, [SP, -16]!
    BL itoa
    LDP x29, x30, [SP], 16
    print 1, salto, lenSalto
    B menucomando

fn_promCMD:
    BL proc_prom
    MOV x0, x28
    LDR x1, =num
    STP x29, x30, [SP, -16]!
    BL itoa
    LDP x29, x30, [SP], 16
    print 1, salto, lenSalto
    B menucomando

fn_llenarCMD:
    BL proc_prom
    BL print_matrix         // imprimir matriz con datos
    B menucomando

fn_importCMD:
    BL proc_import          // procesar comando de importación, con nombre de archivo y separación

    BL import_data          // importar datos del archivo

    BL print_matrix         // imprimir matriz con datos
    B menucomando

fn_exportCMD:
    BL proc_export
    BL export_data          // exportar datos del archivo
    B menucomando

findcmd_loop:
        LDRB w2, [x0], 1
        LDRB w3, [x1], 1

        CBZ w2, return_equal

        CMP w2, w3
        BNE return_not_equal

        B findcmd_loop
        
        return_not_equal:
            MOV x2, 0
            RET
        
        return_equal:
            MOV x2, 1
            RET
fn_errorCMD:
    print 1, errorCmd, lenErrorCmd
    B menucomando

err_col_out_of_range:
    print 1, cell_row, 2
    print 1, errorColOutOfRange, lenErrColOutOfRange
    B menucomando

err_col_out_of_range2:
    print 1, errorColOutOfRange2, lenErrColOutOfRange2
    B menucomando

err_row_out_of_range:
    print 1, cell_row, 2
    print 1, errorRowOutOfRange, lenErrRowOutOfRange
    B menucomando

err_row_not_found:
    print 1, cell_row, 2
    print 1, errorRowNotFound, lenErrorRowNotFound
    B menucomando
