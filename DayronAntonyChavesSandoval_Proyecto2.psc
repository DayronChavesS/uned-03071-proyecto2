// UNIVERSIDAD ESTATAL A DISTANCIA 
// VICERRECTORIA ACADEMICA
// ESCUELA DE LAS CIENCIAS EXACTAS Y NATURALES
// CATEDRA DESARROLLO DE SISTEMAS
// DIPLOMADO EN INFORMATICA
// Codigo:03071
// Logica para Computacion
// Proyecto 2
// Grupo:01
// Estudiante: Dayron Antony Chaves Sandoval
// Cedula: 0305240018
// PRIMER CUATRIMESTRE,2020

//Explicacion: Simulacion de BuscaMinas de Windows en PseInt.
Algoritmo Busca_Minas

///FASE 1: DECLARACION DE VARIABLES
//GUARDAN LAS DESICIONES DEL JUGADOR
Definir decision_principal Como Entero;
Definir decision_dificultad Como Entero;
Definir decision_accion Como Entero;
//CONTROLA LOS CICLOS
Definir salir Como Caracter;
//CONTROLAN LAS COORDENADAS DE CASILLAS PISADAS
Definir pisarX Como Entero;
Definir pisarY Como Entero;
//CONTROLAN LAS COORDENADAS DE CASILLAS MARCADAS
Definir marcarX Como Entero;
Definir marcarY Como Entero;
//CONTROLAN LAS COORDENADAS DE BUSQUEDA DE MINAS CIRCUNDANTES
Definir buscarX Como Entero;
Definir buscarY Como Entero;
//CONTROLAN LAS COORDENADAS DE ASIGNACION DE MINAS AL AZAR
Definir azarX Como Entero;
Definir azarY Como Entero;
//ASISTE EN LA FUNCION DE ASIGNACION DE MINAS AL AZAR
Definir azarZ Como Entero;
//CONTROLA LA CANTIDAD DE MINAS
Definir cantidad_de_minas Como Entero;
//UNA CASILLA FUE PISADA?
Definir casilla_pisada Como Caracter;
//CUANTAS CASILLAS CIRCUNDANTES SE HAN REVISADO?
Definir casillas_revisadas Como Entero;
//GUARDA LA CANTIDAD DE MINAS CIRCUNDANTES A UNA CASILLA PISADA
Definir minas_circundantes Como Entero;
Definir minas_circundantes_caracter Como Caracter;
//CUANTAS CASILLAS QUEDAN SIN PISAR EN LA MATRIZ?
Definir casillas_sin_pisar Como Entero;
//FILAS Y COLUMNAS DE LA MATRIZ
Definir fila Como Entero;
Definir columna Como Entero;
//ASISTE EN LA REVELACION DE MINAS RESTANTES SI HAY UN GAME OVER
Definir ver Como Entero;
//CREAR LA MATRIZ QUE CONTROLA DONDE ESTAN LAS MINAS (INVISIBLE = m0)
Definir m0 Como Caracter;
Dimension m0[9,9];
//CREAR LA MATRIZ DE DESPLIEGUE EN PANTALLA (VISIBLE = m1)
Definir m1 Como Caracter;
Dimension m1[9,9];

//EL ALGORITMO ENTRA EN CICLO
Repetir
	///FASE 2: INICIALIZACION DE VARIABLES
	//LAS INICIALIZACIONES DEBEN EMPEZAR DENTRO DEL CICLO PARA PODER JUGAR UNA NUEVA PARTIDA CORRECTAMENTE
	decision_principal = 0;
	decision_dificultad = 0;
	decision_accion = 0;
	salir = "N";
	pisarX = 0;
	pisarY = 0;
	marcarX = 0;
	marcarY = 0;
	buscarX = 0;
	buscarY = 0;
	azarX = 0;
	azarY = 0;
	azarZ = 0;
	cantidad_de_minas = 0;
	casilla_pisada = "";
	casillas_revisadas = 0;
	minas_circundantes = 0;
	minas_circundantes_caracter = "";
	casillas_sin_pisar = 0;
	fila = 0;
	columna = 0;
	ver = 0;
	
	//SE INICIALIZA LA MATRIZ INSVISIBLE
	Para fila = 0 Hasta 7 Con Paso 1 Hacer
		Para columna = 0 Hasta 7 Con Paso 1 Hacer
			m0[fila,columna] = "-";
		FinPara
	FinPara
	
	//SE INICIALIZA LA MATRIZ VISIBLE
	Para fila = 0 Hasta 7 Con Paso 1 Hacer
		Para columna = 0 Hasta 7 Con Paso 1 Hacer
			m1[fila,columna] = "-";
		FinPara
	FinPara
	
	///FASE 3: LECTURA DE DATOS
	//MENU PRINCIPAL
	Limpiar Pantalla;
	Escribir "**************	BUSCA MINAS	**************";	
	Escribir "**************	1. JUEGO NUEVO  **************";
	Escribir "**************	2. SALIR        **************";
	Leer decision_principal;
	
	Segun decision_principal Hacer
	1:
		Repetir
			//MENU DE DIFICULTAD
			Limpiar Pantalla;
			Escribir "**************	NIVEL				**************";
			Escribir "**************	1. FACIL [5 Minas]		**************";
			Escribir "**************	2. INTERMEDIO [10 Minas]	**************";
			Escribir "**************	3. DIFICIL  [15 Minas]		**************";
			Leer decision_dificultad;
			
			Segun decision_dificultad Hacer
				1: cantidad_de_minas = 5;
				2: cantidad_de_minas = 10;
				3: cantidad_de_minas = 15;
				//VALIDAR ESTA DESICION
				De Otro Modo
					Escribir "Opcion Invalida, por favor digite un numero entre 1 y 3.";
					Esperar Tecla;
			FinSegun
		Hasta Que decision_dificultad >= 1 Y decision_dificultad <= 3
		
		//SEGUN LA DIFICULTAD ELEGIDA, SE COLOCARAN LAS MINAS EN LA MATRIZ MEDIANTE LA FUNCION AZAR.
		Para azarZ=1 Hasta cantidad_de_minas Con Paso 1 Hacer
			azarX = azar(6)+1;
			azarY = azar(6)+1;
			Si m0[azarX,azarY]="-" Entonces
			   m0[azarX,azarY]="X";
			SiNo 
			   azarZ = azarZ-1;
			FinSi
		FinPara
		
		//SE INICIA UN SEGUNDO CICLO PARA DIBUJAR LA MATRIZ UNA Y OTRA VEZ HASTA QUE SE GANE O PIERDA
		Repetir
			Limpiar Pantalla;
			//Dibujar Matriz en Pantalla
			Escribir "       1   2   3   4   5   6    ";
			Escribir 1,"    | ",m1[1,1]," | ",m1[1,2]," | ",m1[1,3]," | ",m1[1,4]," | ",m1[1,5]," | ",m1[1,6]," | ";
			Escribir 2,"    | ",m1[2,1]," | ",m1[2,2]," | ",m1[2,3]," | ",m1[2,4]," | ",m1[2,5]," | ",m1[2,6]," |      *Marcar Mina Presione [10]";
			Escribir 3,"    | ",m1[3,1]," | ",m1[3,2]," | ",m1[3,3]," | ",m1[3,4]," | ",m1[3,5]," | ",m1[3,6]," |        Despues tecla [enter]";
			Escribir 4,"    | ",m1[4,1]," | ",m1[4,2]," | ",m1[4,3]," | ",m1[4,4]," | ",m1[4,5]," | ",m1[4,6]," |      *Retirada presione [11]";
			Escribir 5,"    | ",m1[5,1]," | ",m1[5,2]," | ",m1[5,3]," | ",m1[5,4]," | ",m1[5,5]," | ",m1[5,6]," |        Despues tecla [enter]";
			Escribir 6,"    | ",m1[6,1]," | ",m1[6,2]," | ",m1[6,3]," | ",m1[6,4]," | ",m1[6,5]," | ",m1[6,6]," | ";
			
			//SOLICITAR COORDENADAS AL USUARIO
			Escribir "Coordenada en X";
			Leer pisarX;
			Escribir "Coordenada en Y";
			Leer pisarY;
			
			//SI HA DIGITADO 11 EN CUALQUIERA DE LAS COORDENADAS SE ENTIENDE QUE QUIERE RETIRARSE
			Si pisarX=11 O pisarY=11 Entonces
				Escribir "¿Desea retirarse? (S/N)";
				leer salir;
			FinSi
			
			//SI HA DIGITADO 10 EN CUALQUIERA DE LAS COORDENADAS SE ENTIENDE QUE QUIERE MARCAR UNA CASILLA
			Si pisarX=10 O pisarY=10 Entonces
				Escribir "[MODO MARCA] Coordenada en X";
				Leer marcarX;
				Escribir "[MODO MARCA] Coordenada en Y";
				Leer marcarY;
				m1[marcarY,marcarX] = "?";
			FinSi
			
			///FASE 4: PROCESAMIENTO DE DATOS
			//SI HA DIGITADO UN NUMERO ENTRE 1 Y 6 ENTONCES SE PISA LA CASILLA SELECCIONADA
			Si pisarX>=1 Y pisarY>=1 Y pisarX<=6 Y pisarY<=6 Entonces
				casilla_pisada <- m0[pisarY,pisarX];
				//ṔASO 1: SI LA CASILLA NO TENIA MINAS, SE BUSCAN MINAS ALREDEDOR DE ESA CASILLA
				Si casilla_pisada <> "X" Entonces
					Repetir					
						buscarX = pisarX;
						buscarY = pisarY;
						Segun casillas_revisadas Hacer
							1: buscarX = buscarX - 1;
							2: buscarX = buscarX - 1; 
							   buscarY = buscarY - 1;
							3: buscarY = buscarY - 1;
							4: buscarX = buscarX + 1; 
							   buscarY = buscarY - 1;
							5: buscarX = buscarX + 1;
							6: buscarX = buscarX + 1; 
							   buscarY = buscarY + 1;
							7: buscarY = buscarY + 1;
							8: buscarX = buscarX - 1; 
							   buscarY = buscarY + 1;
						FinSegun
						casillas_revisadas = casillas_revisadas+1;
						Si m0[buscarY,buscarX] = 'X' Entonces
							minas_circundantes = minas_circundantes+1;
						FinSi
					Hasta Que casillas_revisadas = 9
					
					//SE REALIZA UNA CONVERSION DE DATOS PARA MOSTRAR EL RESULTADO OBTENIDO EN LA MATRIZ DE DESPLIEGUE.
					minas_circundantes_caracter <- ConvertirATexto(minas_circundantes);
					m1[pisarY,pisarX] <- minas_circundantes_caracter;
					
					//SE VUELVE A ASIGNAR A ESTAS VARIABLES VALORES NEUTROS PARA PODER VOLVER A USARLAS DESPUES.
					minas_circundantes = 0;
					casillas_revisadas = 0; 
				FinSi
				
				//PASO 2: VERIFICAR SI AUN HAY CASILLAS SIN PISAR.
				
				Para fila = 1 Hasta 6 Con Paso 1 Hacer
					Para columna = 1 Hasta 6 Con Paso 1 Hacer
						Si m1[fila,columna]= "-" Entonces
							casillas_sin_pisar = 1;
							SiNo
							casillas_sin_pisar = 0;
						FinSi
					FinPara
				FinPara
				
				///FASE 5: MOSTRAR RESULTADOS
				//CASO 1: GAME OVER
				//SI LA CASILLA PISADA REALMENTE SI TENIA MINAS, ENTONCES PIERDES.
				Si casilla_pisada = "X" Entonces						
					LimpiarPantalla;
					//SE REESCRIBE LA MATRIZ DE DESPLIEGUE Y SE REVELAN LAS MINAS RESTANTES
					Escribir "       1   2   3   4   5   6    ";
					Para ver = 1 Hasta 6 Con Paso 1 Hacer
						Escribir ver, "    | ",m0[ver,1]," | ",m0[ver,2]," | ",m0[ver,3]," | ",m0[ver,4]," | ",m0[ver,5]," | ",m0[ver,6]," | ";
					FinPara
					Escribir "HAS PISADO UNA MINA!!";
					Escribir "GAME OVER";
					Escribir "Has Perdido";
					Esperar Tecla;
					salir = "S";
				FinSi
					
				//CASO 2: VICTORY
				//SE GANA SI EL PROCESO DE VERIFICACION DE CASILLAS SIN PISAR DA COMO RESULTADO CERO.
				Si casillas_sin_pisar = 0 Entonces
					Escribir "HAS ENCONTRADO TODAS LAS MINAS!!";
					Escribir "VICTORY"; 
					Escribir "Has Ganado"; 
					Esperar Tecla;
					salir = "S";
				FinSi
			FinSi
		Hasta Que salir = "S"
		
	2:
		Limpiar Pantalla;
		Escribir "Que tenga un buen dia!";
		
	De Otro Modo:
		Escribir "Seleccione una opcion del menu escribiendo su respectivo numero.";
		Esperar Tecla;
	FinSegun

Hasta Que decision_principal = 2
FinAlgoritmo