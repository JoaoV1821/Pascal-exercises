Program T03ANDREALEX_JOAOSANTOS;
{
André Alex Jankoski
João Vitor Araújo dos Santos
}

var dias ,mes, ano : integer;

procedure leia1 (msg: string[30]; var inter:integer);

	var dm: string[20];
	e: integer ;
	
	begin
	  repeat
	    writeln(msg, '=>');
	    readln(dm);
	    val(dm, inter, e);
	    
	    if(e > 0) then
	    writeln('Valor ilegal');
	  until (e=0);
	end;

function validaDias(mes, ano : integer):integer;
var dias : integer;

begin
  if ((mes = 4) or (mes = 5) or (mes = 9) or (mes = 11) ) then
  dias := 30
  else
  dias := 31;
  
  if (mes = 2) then
  begin
    if (ano MOD 4 = 0) then
    dias := 29
    else
    dias := 28;
  end;
  
  validaDias := dias;
end;

function validaData(dia, mes, ano : integer) : boolean;
var chave : boolean;
var dias : integer;

begin
  chave := true;
  
  if((ano < 1950) or (ano > 3000)) then
  chave := false
  else
  if ((mes < 1) or (mes > 12))then
  chave := false
  
  else
  begin
    dias := validaDias(mes, ano);
    
    if((dia > dias) or (dia < 1)) then
    chave := false
  end;
  
  validaData := chave;
  
end;

Begin
  
  leia1('Digite o dia', dias);
  leia1('Digite o mes', mes);
  leia1('Digite o ano', ano);
  
  if (validaData(dias, mes, ano)) then
  begin
    writeln(dias : 1, '/', mes:1, '/', ano:1);
    writeln('Data válida')
  end
  
  else
  begin
    writeln(dias : 1, '/', mes:1, '/', ano:1);
    writeln('Data inválida');
  end;
  
  write('Digite ENTER para sair');
  readln();
End.