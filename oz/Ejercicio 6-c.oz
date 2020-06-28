local Filter L L1 in

	Filter = fun {$ L F}
				case L of H|T then
					if {F H} then
						H|{Filter T F}
					else
						{Filter T F}
					end
				else
					nil
			end

	% Ejemplo: Dada una lista de números del 1 al 10, devolver sólo los pares.

	L = [1 2 3 4 5 6 7 8 9 10]

	L1 = {Filter L {$ X} X mod 2 == 0 end}

	{Browse L1}

end