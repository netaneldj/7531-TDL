local Length L1 L2 L3 L4 in
   Length = fun {$ L}
	       case L of
		  H|T then 1 + {Length T}
	       else
		  0
	       end
	    end

   L1 = [1 2 3 4 5 6 7 8]
   L2 = [0 0 0 0]
   L3 = [1]
   L4 = []
   {Browse {Length L1}}
   {Browse {Length L2}}
   {Browse {Length L3}}
   {Browse {Length L4}}
end
