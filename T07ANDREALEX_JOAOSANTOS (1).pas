Program Pzim ;

uses BIBLIONT;
// Arrays
const iniq:array [1..6] of integer=(5,10,20,30,50,60);
fimq:array [1..6] of integer=(9,19,29,49,59,64);
peso:array[1..6] of integer=(20,10,10,5,10,20);
// Arrays

var arql1,arql2:text; // arquivos
reg1:string[64]; // registro 1
reg2:string[28]; // registro 2
notas:array[1..6] of integer;   // array de notas
num:string[4]; // numero em string
nn:array[1..6] of string[4];
chave:boolean; // chave
gaba:string[64]; // gabarito
i,a,n,x,test,l:integer;   // variaveis de controle

Begin
  
  assign(arql1,'prova.txt'); // associa arqul1 a prova
  
  assign(arql2,'NOTAS.TXT'); // associa arqu12 a notas
  
  reset(arql1); // abre o arquivo em forma de leitura
  
  rewrite(arql2); //  abre o arquivo em forma de escrita
  
  begin {gabarito}
    
    repeat  // loop de entrada
      
      chave:=true;   // chave de controle
      
      writeln('digite o gabarito ');
      
      readln(gaba); // le a entrada para a atribuicao do gabarito
      
      gaba:=upcase(gaba); // passa as letras minusculas para maiuscula
        
        l:=length(gaba); // recebe o tamanho do gabarito
        
        i:=1; // variavel contadora
        
        repeat // loop de validacao
          
          if ((l<60) or (l>60)) then  // verifica se o gabarito esta no tamanho correto
          
          chave:=false; // se estiver errado a chave torna-se falsa e encerra a repeticao  e retorna ao primeiro loop
          
          if ((gaba[i]<'A') or (gaba[i]>'E')) then  // Verifica se a alternativa esta no intervalo alfabetico correto
          
          chave:=false;  // se estiver errado a chave torna-se falsa e encerra a repeticao  e retorna ao primeiro loop
          
          i:=i+1; // contador que verifica o tamanho da string digitada na validacao
          
        until ((i>60) or (not chave));  // condicao de parada
        
      until (chave); // condicao de parada
      
    end; {gabarito}
    
    {insercao no arquivo}
    repeat
      
      n:=n+1;  // variavel contadora
      
      readln(arql1,reg1); // le o arqul1 e atribui a reg1
      
      num:=copy(reg1,1,4);// copia o numero de inscricao e atribui a num
      
      insert(num,reg2,1); // insere no reg2 a inscricao na posicao 1
      
      test:=5;
      
      for a:=1 to 6 do
      
      {calculo da nota}
      begin
        
        notas[a]:=0;
        
        for x:=iniq[a] to fimq[a] do
        
        if (reg1[x]=gaba[x-4]) then
        
        notas[a]:=notas[a]+1;
        
        notas[a]:=notas[a]*peso[a];
        
        str(notas[a]:4,nn[a]);
        
        insert(nn[a],reg2,test);
        
        test:=test+4;
        
      end;
      {calculo da nota}
      writeln(arql2,reg2);
      
    until eof(arql1);
    
    {insercao no arquivo}
    
    writeln('registros lidos= ',n:7);
    
    close (arql1);
    
    close (arql2);
    
  End.