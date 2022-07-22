Program T04ANDREALEX_JOAOSANTOS;

var a,l,e,soma1,resto1,verif1,soma2,resto2,verif2,x:integer;
vet:array[1..11] of integer;
cpf:string[30];

Begin
  
  while (cpf<>'00000000000') do
  
  begin
    
    repeat
      
      writeln('Digite seu CPF sem pontuação ou 00000000000 para encerrar ');
      
      readln(cpf);
      
      l:=length(cpf);
      
      if (l<11) or (l>11) then
      
      writeln('Formato inválido ');
      
    until (l=11);
    
    begin
      
      for a:=1 to 11 do
      
      val(cpf[a],vet[a],e);
      
      soma1:=0;
      
      for a:=1 to 9 do
      
      soma1:=soma1+vet[a]*(11-a);
      
      resto1:=soma1 mod 11;
      
      if (resto1=0) or (resto1=1) then
      
      verif1:=0
      
      else
      
      verif1:=11-resto1;
      
      if (verif1<>vet[10]) then
      
      writeln('CPF inválido, primeiro dígito verificador calculado= ',verif1:2)
      
      else
      
      begin
        
        soma2:=0;
        
        for a:=1 to 10 do
        
        soma2:=soma2+vet[a]*(12-a);
        
        resto2:=soma2 mod 11;
        
        if (resto2=0) or (resto2=1) then
        
        verif2:=0
        
        else
        
        verif2:=11-resto2;
        
        if (verif2<>vet[11]) then
        
        writeln('CPF inválido, segundo dígito verificador calculado= ',verif2:2)
        
        else
        
        writeln('CPF lido válido');
        
      end;
      
    end;
    
  end;
  
  writeln('Pressione qualquer tecla para encerrar');
  readln;
  
End.