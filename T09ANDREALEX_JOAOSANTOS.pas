Program Pzim;

uses bibliont;

const x:array[1..6] of integer=(5,9,13,17,21,25);  // constante com posicoes das notas
const disc: array[1..6] of string[14] = ('L.E.M.', 'Matemática', 'Lógica', 'Espec.do cargo',  'Informática', 'Atualidades'); // constante das discciplinas

var
//arquivos
arq:file of regis;
reg:regis;
notas:text;
//outras
vet:vetor;
a,b,c,posiv,np,ii,tot,tc,tt,i,e,sum:integer;
mediag : real;
numa,num:string[4];
disc1, disc2, disc3, disc4, disc5, disc6 : string[3];
all:string[28];
notasS:array [1..6] of string[4]; // notas string
notasI:array [1..6] of integer;   // notas integer
notasD: array [1..6] of integer; // notas por disciplina

Begin
  
  assign(arq,'CAND.IND');
  assign(notas,'NOTAS.TXT');
  reset(arq);
  reset(notas);
  
  repeat
    
    read(arq,reg);
    ii:=a+1;          //ii=indice do vetor
    vet[ii].pf:=a;    //a=posicao fisica do registro no arquivo
    str(reg.num,num);
    tc:=length(num);
    for b:=1 to 4-tc do
    insert('0',num,1);  //insere zeros a esquerda para ficar compativel com o numero lido em faltas
    vet[ii].cc:=num;
    a:=a+1;
    
  until(eof(arq));
  //fim da montagem
  
  tot:=ii;
  
  writeln(' Inicio da ordenacao do vetor');
  
  ordem(vet,ii); // ordena o vetor com os numeros de inscr de cand.ind
  
  writeln(' Fim da ordenação ');
  
  writeln(' Enter para continuar ');
  readln;
  
  writeln('Inicio do registro de notas ');
  
  repeat
    
    tt:=tt+1;
    readln(notas,all);          {le cada linha de notas.txt e atribui a variavel all, copia os num de inscr de all e atribui a numa}
    numa:=copy(all,1,4);
    
    disc1 := copy(all, 7, 10);
    val(disc1, sum, e);
    notasD[1] := notasD[1] + sum;
    disc2 := copy(all, 11, 14);
    val(disc2, sum, e);
    notasD[2] := notasD[2] + sum;
    disc3 := copy(all, 15, 17);
    val(disc3, sum, e);
    notasD[3] := notasD[3] + sum;
    disc4 := copy(all, 18, 21);
    val(disc4, sum, e);
    notasD[4] := notasD[4] + sum;
    disc5 := copy(all, 19, 22);
    val(disc5, sum, e);
    notasD[5] := notasD[5] + sum;
    disc6 := copy(all, 23, 26);
    val(disc6, sum, e);
    notasD[6] := notasD[6] + sum;
    
    
    pebin1(vet,numa,tot,posiv);
    
    seek(arq,vet[posiv].pf);
    read(arq,reg);
    
    for i:=1 to 6 do
    begin
      notasS[i]:=copy(all,x[i],4);        {copia a nota string, converte em inteiro e atribui a reg}
      val (notasS[i],notasI[i],e);
      reg.notas[i]:=notasI[i];
    end;
    
    reg.som:=0;
    
    for i:=1 to 6 do
    reg.som:=reg.som+notasI[i];
    seek(arq,vet[posiv].pf);
    write(arq,reg);
    
  until eof(notas);
  
  writeln();
  
  writeln('Fim do registro, use LISTAINDDIR.PAS para verificar o resultado');
  writeln('Foram lidos ',tt:6,' registros ');
 
  
  writeln();
  
  writeln('    DISCIPLINA            MEDIA');                                                    
  
  writeln();
  
  for i:= 1 to 6 do
  	writeln(disc[i]:15, '         ', notasD[i] / 5000:6:2 );
  	
  writeln();
  termine;
  
  close(notas);
  close(arq);
  
End.