Program T01ANDREALEX_JOAOSANTOS ;
		   // André Alex Jankoski
		   // João Vitor Araújo dos Santos

	var diaAtual,mesAtual,anoAtual,diaNasc,mesNasc,anoNasc,diferencaDias,diferencaMeses,diferencaAnos,diferencaMesAtual:integer; 


Begin

	Write('Insira o dia de hoje '); Read(diaAtual);
	Write('Insira o mês atual ')  ; Read(mesAtual);
	Write('Insira o ano atual ')  ; Read(anoAtual);

	Write('Insira o dia do seu nascimento '); Read(diaNasc);
	Write('Insira o mês do seu nascimento '); Read(mesNasc);
	Write('Insira o ano do seu nascimento '); Read(anoNasc);
	

	Begin //1
	
	  diferencaDias := diaAtual - diaNasc; 
	  diferencaMeses:= mesAtual - mesNasc; 
		diferencaAnos := anoAtual - anoNasc; 
		
		if  (anoAtual mod 4 = 0)  and (anoAtual mod 100 <> 0) or (anoAtual mod 400 = 0) then
			  diferencaDias := diferencaDias + 1;
		
	End;//1
	
	Begin//2
		    
			If (diferencaDias<0) Then // teste do mes anterior

	  			Begin//3
	  				diferencaMesAtual:= mesAtual-1;  
				  	If (diferencaMesAtual=4) or (diferencaMesAtual=6) or (diferencaMesAtual=9) or (diferencaMesAtual=11) Then
					 		Begin 
					 			diferencaDias:= diferencaDias+30;
					 			diferencaMeses:=diferencaMeses-1
					 		End
						Else
							If (diferencaMesAtual=2) Then  // fevereiro (sem contar bissexto)
								Begin
									diferencaDias :=  diferencaDias+28;
									diferencaMeses:= diferencaMeses-1;
								End
							Else
							
						Begin
							diferencaDias := diferencaDias+31;
							diferencaMeses:= diferencaMeses-1;
						End;
						
						
					End//3
			Else
	  
	End;//2
	

			If diferencaMeses<0 Then
				Begin
		 			diferencaAnos:=diferencaAnos-1;
		 			diferencaMeses:=diferencaMeses+12;
				End;
				  
	Writeln( diferencaAnos:2,' anos ',diferencaMeses:2, ' meses ', diferencaDias:2, ' dias mais perto de sua morte');
	Writeln('Enter para morrer');
	Readln;
	
End.