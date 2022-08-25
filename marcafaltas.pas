Program marcafaltas ;
//
//luiz antonio profe
//executar antes de executar o programa que irá atualizar os campos de nota e soma das notas
//usará o arquivo faltas.txt que contem o numero de quem faltou na prova
//
uses bibliont;
var
//arquivos
 arq:file of regis;
 reg:regis;
 falta:text;
//outras
 vet:vetor;
 a,b,c,posiv,np,ii,tot,tc,tt:integer;
 numa,num:string[4];
Begin
 assign(arq,'cand.ind');
 assign(falta,'faltas.txt');
 reset(arq);
 reset(falta);
//o arquivo falta soh possui o num de inscr, logo o acesso serah por num
//monta o vetor pelo num de insc
 repeat
  read(arq,reg);
  ii:=a+1;          //ii=indice do vetor
	vet[ii].pf:=a;    //a=posicao fisica do registro no arquivo
	str(reg.num,num);
	tc:=length(num);
	for b:=1 to 4-tc do
	 insert('0',num,1);  //insere zeros a esquerda para ficar compativel com o numero lido em faltas
	vet[ii].cc:=num; 
	A:=A+1;
 until(eof(arq));	
//fim da montagem
 tot:=ii;
 WRITELN(' PRIMEIROS 15 ELEMENTOS ANTES DA ORDENACAO. CC E PF');
 for a:=1 to 15 do
  writeln(' ',vet[a].cc,'  ',vet[a].pf:5);
 writeln(' inicio da ordenacao');
 ordem(vet,ii);
 writeln(' fim da ordenação');
 WRITELN(' PRIMEIROS 15 ELEMENTOS DO VETOR DEPOIS DA ORDENACAO. CC E PF');
 for a:=1 to 15 do
  writeln(' ',vet[a].cc,'  ',vet[a].pf:5);
 write(' enter para continuar');
 readln;
 writeln;
//leitura dos faltantes
 writeln(' NUM  NOME                                  CONTEUDO   INDICE     PF NO      REG.');
 WRITELN('                                            DO VETOR   DO VETOR   ARQUIVO    FALTA');
 repeat
  tt:=tt+1;
  readln(falta,numa);
  pebin1(vet,numa,tot,posiv);  //Procura NUMA em VET com TOT elementos - pesq binaria - se achou, devolve o
                               //em qual posicao de VET encontrou ou zero se nao encontrou(POSIV) 
  seek(arq,vet[posiv].pf);//    												         1234567890123456789012345678901234567890
  											  //SUPONDO TAMANHO DO REG=10BITS                 !         !         !         !
                          //SEEK (ARQ,2)     POSICIONA NO BIT 11           A<<<---     APONTADOR
                          //READ (ARQ,REG)   PEGA DO 11 AO 20, para no 21            ..........A<<<---     APONTADOR
  read(arq,reg);
//ATUALIZA O CAMPO REG.SOM (SOMA DAS NOTAS) COM -600 PARA INDICAR QUE O CANDIDATO FALTOU
  REG.FALTA:=1;
  IF(TT MOD 20 = 0)THEN
   BEGIN
    WRITELN(' ENTER PARA CONTINUAR');
    READLN;
    writeln(' NUM  NOME                                  CONTEUDO   INDICE     PF NO      REG.');
    WRITELN('                                            DO VETOR   DO VETOR   ARQUIVO    FALTA');
   END; 
  writeln(reg.num:5,' ',reg.nome,numa:10,posiv:10,vet[posiv].pf:10,REG.FALTA:9);
//  WRITE(ARQ,REG); SE FIZER SOH ISTO GRAVO AS INFORMAÇOES DE REG NA POSICAO DO PRÓXIMO-ERRRRRRO  
//(PASCALZIN >>>NAO GRAVA<<<)
//SEMPRE tem QUE TER O PAR SEEK READ----SEEK WRITE
	SEEK(ARQ,VET[POSIV].PF);//RETORNA APONTADOR PARA INICIO DO REGISTRO
	WRITE(ARQ,REG);
 until eof(falta);
 writeln(' total de faltantes na prova --',tt:5,' candidatos');
 termine; 
CLOSE(FALTA);
CLOSE(ARQ);
End.