local Take L N R in
   Take = proc {$ L N R}
	     case L of H|T then
		if N > 0 then
		   local X in
		      R = H|X
		      {Take T N-1 X}
		   end
		else
		   R = nil
		end
	     else
		R = nil
	     end
	  end

   L = [1 2 3 4 5 6 7 8 9 10]
   N = 7
   {Take L N R}
   {Browse R}
end