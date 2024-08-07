Proceso Proyecto1BP
	//Definici�n de variables.
	Definir producto, cupon, region Como Caracter
	Definir precio, cantidad, i Como Entero
	Definir DescuentoCupon, PrecioDescuento, DescuentoCantidad, peso Como Real
	
	//Definici�n de constantes.
	Definir IVA Como Real
	IVA <- 0.19
	Definir COSTOKG Como Entero
	COSTOKG <- 500
	
	//Ingreso de producto.
	Escribir "Ingrese el nombre del producto: "
	Leer producto
	//Validaci�n para que el usuario ingrese una respuesta.
	Mientras producto = "" Hacer
		Escribir "Debe ingresar el nombre del producto."
		Leer producto
	FinMientras
	
	//Ingreso de precio.
	Escribir "Ingrese el precio del producto: "
	Leer precio
	//Validaci�n para que el usuario ingrese una respuesta.
	Mientras precio = 0 Hacer
		Escribir "Debe ingresar un precio v�lido."
		Leer precio
	FinMientras
	
	//Ingreso de cupon, en caso de haber.
	Escribir "�Aplica cup�n de descuento? (Si/No)"
	Leer cupon
	//Validaci�n para que el usuario ingrese una respuesta.
	Mientras cupon = "" Hacer
		Escribir "Debe ingresar una respuesta."
		Leer cupon
	FinMientras
	
	//Primera condicional: Se aplica el descuento que corresponda seg�n cup�n (en caso de no haber = 0).
	Si cupon = "Si" O cupon = "si" Entonces
		Escribir "Ingrese descuento en decimal: "
		Leer DescuentoCupon
		//Validaci�n para que el usuario ingrese una respuesta.
		Mientras DescuentoCupon = 0 Hacer
			Escribir "Debe ingresar una respuesta (decimal)"
			Leer DescuentoCupon
		FinMientras
		PrecioDescuento <- precio - precio * DescuentoCupon
		Escribir "Precio con descuento: $", PrecioDescuento
	SiNo
		Escribir "No aplica descuento."
		DescuentoCupon <- 0
		PrecioDescuento <- precio - precio * DescuentoCupon
		Escribir "Precio actual: $", PrecioDescuento
	FinSi

	//Aplicaci�n de IVA.
	PrecioIVA <- PrecioDescuento + PrecioDescuento * IVA
	Escribir "Precio actual m�s IVA: $", PrecioIVA
	
	//Ingreso de cantidad de productos.
	Escribir "Ingrese cantidad de productos: "
	Leer cantidad
	//Validaci�n para que el usuario ingrese una respuesta.
	Mientras cantidad <= 0 Hacer
		Escribir "Debe ingresar un n�mero mayor a cero"
		Leer cantidad
	FinMientras
	
	//Condicional que determina el nivel de descuento con respecto a la cantidad de productos que lleva.
	Si cantidad <= 2 Entonces
		Escribir "No aplica descuento."
		DescuentoCantidad <- 0
	SiNo
		si	cantidad > 2 Y cantidad <= 10 Entonces
			DescuentoCantidad <- 0.1
		SiNo
			si cantidad > 10 Y cantidad <= 20 Entonces
				DescuentoCantidad <- 0.2
			SiNo
				DescuentoCantidad <- 0.3
			FinSi
		FinSi
		Si cantidad > 2 Entonces
			Escribir "Por llevar ", cantidad, " art�culos, obtiene un ", DescuentoCantidad * 100, "% de descuento."
		FinSi
	FinSi
	
	//Se muestra el precio unitario con descuento aplicado.
	PrecioCantidad <- PrecioIVA - PrecioIVA * DescuentoCantidad
	Escribir "Precio actual por producto: $", PrecioCantidad
	
	//Definici�n de arreglo. Se asignan las regiones con su abreviatura correspondiente.
	//Para el calculo del costo de env�o, se asume que los productos ser�n enviados desde Santiago.
	//Se alternan las regiones desde la Regi�n Metropolitana [1] hacia los extremos del pa�s.
	Definir Regiones Como Caracter
	Dimension Regiones[17]
	Regiones[1] <- "RM"
	Regiones[2] <- "VA"
	Regiones[3] <- "LI"
	Regiones[4] <- "ML"
	Regiones[5] <- "CO"
	Regiones[6] <- "NB"
	Regiones[7] <- "AT"
	Regiones[8] <- "BI"
	Regiones[9] <- "AR"
	Regiones[10] <- "AN"
	Regiones[11] <- "LR"
	Regiones[12] <- "LL"
	Regiones[13] <- "TA"
	Regiones[14] <- "AI"
	Regiones[15] <- "AP"
	Regiones[16] <- "MA"
	
	//Ingreso de regi�n para env�o.
	Escribir "Ingrese regi�n de env�o en su abreviatura nacional: (Ej. Regi�n Metropolitana = RM)"
	Leer region
	
	//Validaci�n para que el usuario ingrese una respuesta.
	Mientras region = ""
		Escribir "Debe ingresar una regi�n (abreviatura nacional)"
		Leer region
	FinMientras
	
	//Bucle condicional que permite determinar el costo de env�o seg�n regi�n.
	Para i <- 1 Hasta 16 Hacer
		Si region = Regiones[i] Entonces
			Si i <= 4 Entonces
				costo <- 1500
			SiNo
				si i > 4 Y i <= 8 Entonces
					costo <- 2500
				SiNo
					si i > 8 Y i <= 12 Entonces
						costo <- 3500
					SiNo
						si i > 12 Y i <= 16 Entonces
							costo <- 4500							
						FinSi
					FinSi
				FinSi
			FinSi
		FinSi
	FinPara

	//Ingreso del peso producto.
	Escribir "Ingrese el peso del producto (kilos):"
	Leer peso
	//Validaci�n para que el usuario ingrese una respuesta.
	Mientras peso = 0 Hacer
		Escribir "Ingrese un peso v�lido (kilos)"
		Leer peso
	FinMientras
	
	//Calculo del costo total de env�o
	CostoEnvio <- cantidad * (peso * COSTOKG) + costo
	
	//Se borra todo para mostrar el total de la compra y su desglose
	Limpiar Pantalla
	
	//Desglose de componentes del costo final de la compra.
	Escribir "..."
	Escribir "DESGLOSE DE LA COMPRA"
	Escribir ""
	Escribir "Producto: ", producto
	Escribir "Precio unitario: ", precio
	Escribir "Cup�n de descuento: ", cupon, ". Descuento cup�n: ",DescuentoCupon * 100, "% ($", precio * DescuentoCupon, ")"
	Escribir "IVA de la compra: ", IVA * 100, "% ($", PrecioDescuento * IVA, ")"
	Escribir "Cantidad de productos: ", cantidad
	Escribir "Descuento (por cantidad) aplicado por producto: ", DescuentoCantidad * 100, "% ($", PrecioIVA * DescuentoCantidad, ")"
	Escribir "Precio final por producto: $", PrecioCantidad
	Escribir "Costo extra por destino (", region, "): $", costo
	//Muestra el costo extra por peso ya considerando la cantidad de productos.
	Escribir "Costo extra por peso: $", cantidad * (peso * COSTOKG)
	//Muestra el resultado total del costo de env�o (costo por peso m�s costo de env�o).
	Escribir "Total costo de env�o: $", CostoEnvio
	Escribir ""
	//Se muestra el total de la compra.
	Escribir "Total de la compra: $", (cantidad * PrecioCantidad) + CostoEnvio
	Escribir "..."
FinProceso
