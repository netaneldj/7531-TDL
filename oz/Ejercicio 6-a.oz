local FoldL FoldR L L1 L2 in

	fun {FoldL L F U}
		case L
			of X|nil then {F X U}
			[] H|T then {FoldL T F {F U H}}
			else nil
		end
	end
	
	fun {FoldR L F U}
		case L
			of X|nil then {F X U}
			[] H|T then {F H {FoldR T F U}}
			else nil
		end
	end
	
	% Ejemplo: Para un vector de números del 1 al 10, sumar los números con un FoldR y multiplicarlos con un FoldL.

	L = [1 2 3 4 5 6 7 8 9 10]

	L1 = {FoldL L {$ X Y} X+Y end 0}
	L2 = {FoldR L {$ X Y} X*Y end 1}

	{Browse L1}
	{Browse L2}

end