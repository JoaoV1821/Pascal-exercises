Program T05ANDREALEX_JOAOSANTOS ;

var nomes : array[1..50] of string;
nomesInvertido : array[1..50] of string;
nome : string[40];
cont, len : integer;

function inverteNome(var nome : string[40]) : string[40];
	var nomeAux, sobreAux, nomeInvertido : string[40];
	
	cont : integer;

	begin 
		for cont := length(nome) downto 1 do
			if nome[cont - 1]  = ' ' then
				sobreAux :=  copy(nome, cont, length(nome));
			nomeAux := copy(nome,length(sobreAux) - 1, length(nome));
		nomeInvertido := concat(sobreAux, nomeAux);
		
		inverteNome := nomeInvertido;
			
	end;

Begin
	cont:= 1;
	
	while (cont <> 50) or (nome <> 'FIM') do
		begin
			write('Digite seu nome e sobrenome');
			readln(nome);
			
			cont := cont = 1;
			
			nomes[cont] := UpCase(nome);
				
		for cont := 1 to 50 do 
			nomesInvertido[cont] := inverteNome(nomes[cont]);
		
		for cont  := 1 to 40 do
			writeln(nomesInvertido[cont]);
			
		write('Digite ENTER para encerrar:');
		readln();
	end
End.