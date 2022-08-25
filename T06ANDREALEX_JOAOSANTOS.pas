Program T06ANDREALEX_JOAOSANTOS ;

//LER DO TECLADO ,NUM:4,NOME:35,CPF:11,NASC:8,CARGO:2 (1<->12) , nuM total De 60 caracteres e criar um arquivo
//tipo texto (acesso sequencial - SAI1.TXT), com as informações lidas... num=0, encerra a leitura.
{01-04=NUMERO
 05-39=NOME
 40-50=CPF
 51-58=NASCIMENTO
 59-60=CARGO}
 
uses BIBLIONT;

var regi:string[60];
    num,ano:string[4];
    mes,dia,cargo:string[2];
    cpf:string[11];
    nome:string[35];
    a,b,c,e,tc,DD,MM,AA:integer;
    arq:text; //NOME LOGICO DO ARQUIVO
    CHACPF,CHADATA:BOOLEAN;
    
Begin

	assign(arq,'sai1.txt');
   
		append(arq);
   
   		repeat
			 
			 LEIA1('Insira num ',a)         	              
		  
	 		until (e=0); 
	                 
	 while (a>0) do
	                 
	  begin
	  
	  	str (a , num);	  

	   		tc:=length(num);     
	   
	   			for b:=1 to 4-tc do  
	   
	    			insert('0',num,1);  
	    
     					write(' nome=>');
     
	   						readln(nome);
	   
	   							nome:=upcase(nome);
	   
	   								tc:=length(nome);    
	   
		 									for b:=tc+1 to 35 do 
		 
	    									insert(' ',nome,b);  
			 
{Valida CPF}

	   repeat
	   
	  		chacpf:=true;
	    
		  		write(' cpf=>');
		  
	    			readln(cpf);
	    
	    				if (length(cpf) < 11) then
	    
	     					chacpf:=false
	     
	    				else
	    
	     					chacpf:=validacpf(cpf);  
	     
	    						if (not chacpf) then
	    
	     							writeln('    CPF ILEGAL ');
	     
	   until chacpf;
	   
  {Valida a data}
	 
	repeat
											 
		leia1(' dia de nascimento ',dd);
											 
			leia1(' mes de nascimento ',mm);
												 
				leia1(' ano de nascimento ',aa);
												 			
					if not (validata(dd,mm,aa)) then
												 				
						writeln('Data ilegal');
												 
	until (validata(dd,mm,aa));
												
		str (dd,dia);
													
			str (mm,mes);
														
				str(aa,ano);
															
					if(length(dia)<2)then   
        
						insert('0',dia,1);                        
               
					if (length(mes)<2)then
				  
						insert('0',mes,1);    
                         
	{Valida cargo}		                                        
			                                        
     		repeat
     		
     			LEIA1(' cargo ',b);
     
      			if((e<>0) or (b<1) or (b>12))then                      
      
       				writeln('    cargo ilegal ');                          
       
     		until ((e=0) and (b>0) and (b<13));                       

					str (b , cargo);

     				if(length(cargo)<2) then  
		  
      				insert('0',cargo,1);      
      
//MONTAR O REGISTRO COLOCANDO OS CAMPOS LIDOS EM REGIS, fica mais facil,
//MANDar INSERIR DE TRAZ PARA FRENTE, uma vez que todos as informações lida, o total de caracteres
//que a variavel declarada indica (cargo-2,ano-4, etc....)
{
05 - CARGO
199905 - ANO
07199905 - MES
2507199905 - DIA
111111111112507199905 - CPF
MARIA DA SILVA PEREIRA             111111111112507199905 - NOME
0038MARIA DA SIVA PEREIRA              111111111112507199905 - NUM
}
     INSERT(CARGO,REGI,1);
		    
     INSERT(ANO,REGI,1);
		    
     INSERT(MES,REGI,1);
		    
     INSERT(DIA,REGI,1);
		    
     INSERT(CPF,REGI,1); 
		   
     INSERT(NOME,REGI,1); 
		   
     INSERT(NUM,REGI,1);
     
		 		WRITELN(ARQ,REGI);   //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
		 
     			repeat                 
     							
							LEIA1(' insira num ',a);     
	    
   			 until (a=0);           
	   
	END;
	
	TERMINE;
	
	CLOSE(ARQ);	
	 
End.