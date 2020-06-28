local Append L1 L2 in
   Append = fun {$ L1 L2}
	       case L1 of H1|T1 then
		  H1|{Append T1 L2}
	       else
		  case L2 of H2|T2 then
		     H2|{Append nil T2}
		  else
		     nil
		  end
	       end
	    end
   
   L1 = [1 2 3 4 5]
   L2 = [5 6 7 8 9]

   {Browse {Append L1 L2}}
end