local Drop L N R in
   Drop = proc {$ L N R}
	     case L of H|T then
		if N > 0 then
		   {Drop T N-1 R}
		else
		   R = L
		end
	     else
		R = nil
	     end
	  end

   L = [1 2 3 4 5 6 7 8 9 10]
   N = 15
   {Drop L N R}
   {Browse R}
end
