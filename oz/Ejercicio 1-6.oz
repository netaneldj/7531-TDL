local Position L X in
   Position = fun {$ L X}
		 case L of H|T then
		    if H == X then
		       1                   % Considerando que el array empieza en 1, si empieza en 0, va 0.
		    else
		       1 + {Position T X}
		    end
		 end
	      end

   L = [10 20 30 40 50]
   X = 30

   {Browse {Position L X}}
end