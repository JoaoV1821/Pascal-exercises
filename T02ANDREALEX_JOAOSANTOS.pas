Program T02ANDREALEX_JOAOSANTOS ;
// André Alex Jankoski
// João Vitor Araújo dos Santos

var nota, soma, mediaInt, qtdNotas : integer;
var mediaReal : real;
var msg: string;

{ LEIA1 eH um procedimento que informa o que deve ser digitado (oque) e faz a leitura de informações do
teclado como caractere (max 30- - string[30]) e devolve o valor como inteiro (int) }


// Construção da procedure leia1

// ================================================
{procedure leia1 (var msg: string[30]; inte: integer);
	var dm : string[20];
		 	e: integer;
	begin
	repeat
		write(msg, '=> ');
		readln(dm);	
		val(dm, inte, e);
		if (e>0) then
			writeln(msg, 'ilegal');
		until(e=0);
	end;}
// =================================================

// Programa principal	
Begin // 1
	qtdNotas := 0;
	soma := 0;
	
	msg := 'Digite a nota: ';
			
	while(nota >= 0) do
		begin //2
		
			writeln('Digite a nota: ');
			readln(nota);
					
			if (nota > 100) then
				repeat
					writeln('ilegal');
					writeln('Digite a nota');
					readln(nota)
				until (nota <= 100)
						
			else
				if(nota >= 0) then
					begin // 3 
						soma := soma + nota;
						qtdNotas := qtdNotas + 1;
					end  // 3
					
			end; //2
	
	if (qtdNotas <> 0) then
		begin //4
		
			mediaInt := soma DIV qtdNotas;
			mediaReal := soma / qtdNotas;
			
		end  //4
		
	else 
		begin //5
		
			mediaInt := 0;
		 	mediaReal := 0;
		 	
		end; //5
		
	writeln('Média inteira: ', mediaInt:2, 'Média real: ', mediaReal:2 );
	writeln('Pressione ENTER para sair');
	readln();
	
End.