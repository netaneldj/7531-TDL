local Map L L1 in

	Map = fun {$ L F}
			case L of H|T
				F{H}|{Map T F}
			else
				nil
			end
		end

	% Ejemplo: Dado un array de números del 1 al 10, calcular los cuadrados de cada uno.

	L = [1 2 3 4 5 6 7 8 9 10]

	L1 = {Map L {$ X} X*X end }

	{Browse L1}

end