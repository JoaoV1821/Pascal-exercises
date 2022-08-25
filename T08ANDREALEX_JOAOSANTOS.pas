Program Pzim ;

uses BIBLIONT;

const cargos:array[1..12] of string[22]= ('ENGANADOR DE CHEFE    ','ENROLADOR DE TRABALHO ','PENSADOR        ','ANALISTA DE SISTEMAS  ',
'DEGUSTADOR DE CERVEJA ','TECNICO EM REDES      ','CONTADOR DE ESTORIAS  ','SAI DA AULA ANTES     ',
'ACOUGUEIRO LIMPINHO   ','SEGURANCA DE BANHEIRO ','GESTOR DE BORBOLETAS  ','AGENTE LEVA E TRAZ    ' );

var arq:file of regis;
    reg:regis;
     cs:string[2];  // cs = cargo string
     ns:string[4];  // ns = num string
    vet:vetor;
 totcar:array[1..12] of integer;
 orde,i,e,clinha,cargant,x,tot,a,posi:integer; // clinha = contador de linha

Begin
  
  assign (arq,'CAND.IND');
  reset (arq);
  
  repeat
  
    writeln('escolha a ordenação: 1=inscricao, 2=alfabetica, 3=cpf ou 4=cargo ');
    leia1('Insira ',orde);
    
    if ((orde<1) or (orde>4)) then
    writeln ('Inválido ');
    
  until ((orde>0) and (orde<5));
  
  a:=0;
  posi:=0;
  
  repeat
    a:=a+1;
    vet[a].pf:=posi;
    read(arq,reg);
    
    if (orde=1) then
    begin
      str(reg.num:4,ns);
      vet[a].cc:=ns;
    end
    else
    
    if(orde=2) then
    vet[a].cc:=reg.nome
    else
    
    if(orde=3) then
    vet[a].cc:=reg.cpf
    else
    
    begin   // opcao 4
      str(reg.car:2,cs);
      vet[a].cc:=cs+reg.nome;
    end;
    
    posi:=posi+1;
    
  until eof(arq);
  
  tot:=a;  
  ordem(vet,tot);
  
  for i:=1 to tot do
  
  begin
    seek(arq,vet[i].pf);
    read(arq,reg);
    e:=e+1;
    
    if (reg.car>0) then    
    totcar[reg.car]:=totcar[reg.car]+1;
    
    if (((clinha mod 25)=0) or (cargant<>reg.car) and (orde=4)) then
    
    begin
      readln();
      clrscr();
      writeln;
      write('  ORD  NUM N O M E                             ===C P F=== NASCIMENTO CS  N1');
      writeln('  N2  N3  N4  N5  N6   SO   CG  CC CV FA');
      clinha:=0;
    end;
    
    write(e:5,reg.num:5,' ',reg.nome,' ',reg.cpf,' ',reg.data.dia,'/',reg.data.mes,'/',reg.data.ano,reg.car:3);
    for x:=1 to 6 do
    write(reg.notas[x]:4);
    writeln(reg.som:5,reg.clg:5,reg.clc:4,reg.ccl:3,reg.falta:3);
    cargant:=reg.car;
    clinha:=clinha+1;
    
  end;
  
  close(arq);
  writeln;
  writeln;
  writeln('TOTAL DE INSCRITOS POR CARGO');
  for i:=1 to 12 do
  writeln(i:3,' -- ',cargos[i],' -->',totcar[i]:4);
  writeln('TOTAL DE REGISTROS LIDOS',E:5);
  
  termine;

End.