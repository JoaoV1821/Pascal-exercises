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
procedure leia1 (var msg: string[30]; inte: integer);
	var dm : string[20];
		 	e: integer;
	begin
		write(msg, '=> ');
		readln(dm);	
		val(dm, inte, e);
	end;
// =================================================

// Programa principal	
Begin // 1
	qtdNotas := 0;
	soma := 0;
	
	while (nota >= 0) do
		begin
			msg := 'Digite a nota: ';
			leia1(msg, nota);
			
			repeat
				write('ilegal');
				leia1(msg, nota);
			until (nota > 100);
			
			soma := soma + nota;
			qtdNotas := qtdNotas + 1;
		end;
	
	if (qtdNotas <> 0) then
		begin
			mediaInt := soma DIV qtdNotas;
			mediaReal := soma / qtdNotas;
		end
		
	else 
		begin
			mediaInt := 0;
			mediaReal := 0;
		end;
		
	writeln('Média inteira: ', mediaInt:2, 'Média real:', mediaReal:2 );
End.