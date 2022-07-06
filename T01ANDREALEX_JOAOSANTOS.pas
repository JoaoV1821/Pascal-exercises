Program T01ANDREALEX_JOAOSANTOS ;


	var a,b,c,d,e,f,g,h,i,j:integer; 


Begin

	Writeln('Insira o dia de hoje '); 
	Readln(a);
	Write('Insira o mês atual ')  ; Read(b);
	Write('Insira o ano atual ')  ; Read(c);

	Write('Insira o dia do seu nascimento '); Read(d);
	Write('Insira o mês do seu nascimento '); Read(e);
	Write('Insira o ano do seu nascimento '); Read(f);
	

	Begin//1
	
	  g:=a-d; //  G diferen?a de dias
	  h:=b-e; //  H diferen?a de meses
		i:=c-f; //  I diferen?a de anos
		
		if  (c mod 4 = 0)  and (c mod 100 <> 0) or (c mod 400 = 0) then
			  g := g + 1;
		
	End;//1
	
	Begin//2
		    
			If (g<0) Then

	  			Begin//3
	  				j:=b-1;                                         // teste do mes anterior
				  	If (j=4) or (j=6) or (j=9) or (j=11) Then
					 		Begin 
					 			g:=g+30;
					 			h:=h-1
					 		End
						Else
							If (j=2) Then                      // fevereiro (sem contar bissexto)
								Begin
									g:=g+28;
									h:=h-1;
								End
							Else
							
						Begin
							g:=g+31;
							h:=h-1;
						End;
						
						
					End//3
			Else
	  
	End;//2
	

			If h<0 Then
				Begin
		 			i:=i-1;
		 			h:=h+12;
				End;
				  
	Writeln( i:2,' anos ',h:2, ' meses ', g:2, ' dias mais perto de sua morte');
	Writeln('Enter para morrer');
	Readln;
	
End.