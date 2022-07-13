Program T02ANDREALEX_JOAOSANTOS ;
// André Alex Jankoski
// João Vitor Araújo dos Santos

var nota, soma, mediaInt, qtdNotas : integer;
var mediaReal : real;
var msg: string;

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

// Programa principal
Begin // 1
  qtdNotas := 0;
  soma := 0;
  
  msg := 'Digite a nota: ';
  
  while(nota >= 0) do
  begin //2
    
    leia1('Digite a nota', nota);
    
    if (nota > 100) then
    repeat
      writeln('ilegal');
      leia1('Digite a nota', nota)
    until (nota <= 100);
    
    if (nota >= 0) then
    begin //3
      soma := soma + nota;
      qtdNotas := qtdNotas + 1;
    end  //3
    
    
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
  
  writeln('Média inteira: ', mediaInt:2, ' Média real: ', mediaReal:2, ' Quantidade de notas lidas: ', qtdNotas );
  writeln('Pressione ENTER para sair');
  readln();
  
End.