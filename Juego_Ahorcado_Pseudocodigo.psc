Algoritmo Juego_Ahorcado_Sin_Error_279
    // ==============================================
    // DECLARACIÓN DE VARIABLES
    // ==============================================
    Definir lista_palabras Como Caracter
    Dimension lista_palabras[5]
    Definir palabra_secreta, letra, visual Como Caracter
    Definir longitud_palabra, intentos_fallidos, i, indice, tam_estado Como Entero
    Definir encontrada, ganador Como Logico
    Definir MAX_INTENTOS Como Entero
    MAX_INTENTOS <- 6
	
    // ==============================================
    // CARGAR PALABRAS
    // ==============================================
    lista_palabras[1] <- "escuela"
    lista_palabras[2] <- "programacion"
    lista_palabras[3] <- "ecuador"
    lista_palabras[4] <- "computadora"
    lista_palabras[5] <- "libro"
	
    // ==============================================
    // ? LÍNEA CORREGIDA: ERROR 279 SOLUCIONADO
    // ==============================================
    indice <- Azar(5)         // 1 argumento ? ? devuelve 0 a 4
	indice <- 1 + Azar(5)     // ? ? devuelve 1 a 5 (lo que necesitabas) 
    palabra_secreta <- lista_palabras[indice]
    longitud_palabra <- Longitud(palabra_secreta)
	
    // ==============================================
    // INICIALIZAR ESTADO
    // ==============================================
    Dimension estado_juego[longitud_palabra]
    tam_estado <- longitud_palabra
    Para i <- 1 Hasta tam_estado Hacer
        estado_juego[i] <- "_"
    FinPara
	
    // VALORES INICIALES
    intentos_fallidos <- 0
    ganador <- Falso
	
    // ==============================================
    // BUCLE PRINCIPAL
    // ==============================================
    Repetir
        LimpiarPantalla
		
        // MOSTRAR ESTADO
        visual <- ""
        Para i <- 1 Hasta tam_estado Hacer
            visual <- visual + " " + estado_juego[i]
        FinPara
        Escribir "PALABRA: ", visual
        Escribir "INTENTOS FALLIDOS: ", intentos_fallidos, " DE ", MAX_INTENTOS
        Escribir "-----------------------------------------"
		
        // PEDIR LETRA
        Escribir "INGRESA UNA LETRA: "
        Leer letra
        letra <- Minusculas(Subcadena(letra, 1, 1))
		
        // BUSCAR LETRA EN LA PALABRA
        encontrada <- Falso
        Para i <- 1 Hasta longitud_palabra Hacer
            Si Subcadena(palabra_secreta, i, 1) = letra Entonces
                estado_juego[i] <- letra
                encontrada <- Verdadero
            FinSi
        FinPara
		
        // COMPROBAR SI GANÓ O PERDIÓ
        Si encontrada Entonces
            ganador <- Verdadero
            Para i <- 1 Hasta tam_estado Hacer
                Si estado_juego[i] = "_" Entonces
                    ganador <- Falso
                FinSi
            FinPara
            
            Si ganador Entonces
                Escribir "====================================="
                Escribir "¡FELICIDADES! GANASTE EL JUEGO"
                Escribir "LA PALABRA ERA: ", palabra_secreta
                Escribir "====================================="
            FinSi
        SiNo
            intentos_fallidos <- intentos_fallidos + 1
            Si intentos_fallidos >= MAX_INTENTOS Entonces
                Escribir "====================================="
                Escribir "¡PERDISTE! SE TERMINARON LOS INTENTOS"
                Escribir "LA PALABRA ERA: ", palabra_secreta
                Escribir "====================================="
            FinSi
        FinSi
		
    Hasta Que ganador O intentos_fallidos >= MAX_INTENTOS
    
FinAlgoritmo
