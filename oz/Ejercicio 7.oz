% Se conoce como Currying al concepto de generar funciones que sólo reciban un parámetro. Para esto, se utilizan implementaciones similares a los modelos de Factory o 'fábrica de funciones', con la cual en primer lugar se debe generar la función que recibirá ese único parámetro. En el siguiente ejemplo, mediante la utilización de un código con Currying, se duplicarán los valores de distintas variables con una única función que duplique, y a su vez con la misma 'fábrica' de esta función, se podrán obtener métodos que calculen el triple, el cuádruple y así sucesivamente.

local MultFact Double Triple A B C in

	MultFact = fun {$ X}
				fun {$ Y}
					X*Y
				end
			end

	Double = {MultFact 2}
	Triple = {MultFact 3}

	A = 2
	B = 3
	C = 4

	% Duplicamos
	{Browse 'A = '#A#'A*2 = '#{Double A}}
	{Browse 'B = '#B#'B*2 = '#{Double B}}
	{Browse 'C = '#C#'C*2 = '#{Double C}}

	% Triplicamos
	{Browse 'A = '#A#'A*3 = '#{Triple A}}
	{Browse 'B = '#B#'B*3 = '#{Triple B}}
	{Browse 'C = '#C#'C*3 = '#{Triple C}}

end