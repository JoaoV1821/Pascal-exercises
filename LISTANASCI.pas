Program listanasci ;
{faça um programa que mostre o conteudo dos registros de cand.ind em ordem de data de nascimento.
 usar a saida de listaind.dir como exemplo
 01012001 ->> 20010101 - 01022001 ->>20010201}
USES BIBLIONT;

CONST CARGOS:ARRAY [1..12] OF STRING[22]=
('ENGANADOR DE CHEFE    ','ENROLADOR DE TRABALHO ','PENSADOR              ','ANALISTA DE SISTEMAS  ',
 'DEGUSTADOR DE CERVEJA ','TECNICO EM REDES      ','CONTADOR DE ESTORIAS  ','SAI DA AULA ANTES     ',
 'ACOUGUEIRO LIMPINHO   ','SEGURANCA DE BANHEIRO ','GESTOR DE BORBOLETAS  ','AGENTE LEVA E TRAZ    ' );

VAR ARQ : FILE OF REGIS;
    REG:REGIS;
    A,B,E,IND,CONTLIN,ANTERIOR,tot,posi,x:INTEGER;
    TOTCAR:ARRAY[1..12] OF INTEGER;
//    X:STRING[2];
    vet:vetor;//vetor que contera nascim+pf de todos para depois ordenar
BEGIN
  ASSIGN(ARQ,'CAND.IND'); 
  RESET(ARQ);
//primeiro ligar o campo chave à pf. para isso ler todos os registros e montar o vetor
  repeat
   a:=a+1;//indice
   vet[a].pf:=posi;
   read(arq,reg);
// STR(REG.CAR,X)====>REG.CAR=1====>X=1NULL, OU SEJA '1'
// STR(REG.CAR:2,X)===>REG.CAR=1===X=ESPAÇO1, OU SEJA ' 1'
   vet[a].cc:=reg.data.ano+reg.data.mes+reg.data.dia;//coloca ano,mes,dia no campo cc de vet
   posi:=posi+1; //posicao fisica
  until eof(arq);
  tot:=a;
//fim da montagem do vetor
	for a:= 1 to 20 do//mostra os 20 primeiros do vetor
	 writeln(vet[a].pf:5,' ',vet[a].cc);
//ordena
   writeln('ordenando');
   ordem(vet,tot);
   writeln('fim da ordenação');
//fim da ordenação
  for a:=1 to 20 do
	 writeln(vet[a].pf:5,' ',vet[a].cc);//idem, ordenados
	write('enter para continuar');
	readln;   
	for X:=1 to tot do //PARA LER DO PRIMEIRO AO ULTIMO
	 BEGIN
	  seek(arq,vet[X].pf);     //POSICIONA
	  READ(ARQ,REG);           //LE O REGISTRO - LEVA PARA MP DO ARQ PARA REG
//INSTRUÇOES PARA ALTERAR (ATUALIZAR) E GRAVAR O REGISTRO ATUALIZADO
{	  REG.CPF:='00000000000'; //ALTERA O CAMPO
	  WRITELN(REG.NUM:5,' ',REG.NOME,' ',REG.CPF);
	  SEEK(ARQ,vet[X].pf); 		//REPOSICIONA <<<<<<TEM FAZER SEMPRE (SEEK READ) ATUALIZA (SEEK WRITE)
	  WRITE(ARQ,REG);         //ATUALIZA O REGISTRO
	 END;}
// FIM DA ATUALIZAÇAO  }
	  E:=E+1;
	  IF(REG.CAR>0)THEN
	   TOTCAR[REG.CAR]:=TOTCAR[REG.CAR]+1;//CONTA NUMERO DE INSCRITOS POR CARGO
//ANTES DE MOSTRAR A LINHA COM AS INFORMAÇOES DO REGISTRO VERIFICA AS CONDICOES PARA IMPRESSAO DO CABECALHO
	  IF(CONTLIN MOD 25=0) THEN
//IMPRIME O CABECALHO SE: CONTADOR DE LINHAS = 25 
     BEGIN
	    READLN;
	    CLRSCR;
	    WRITELN;
      write('  ORD  NUM N O M E                             ===C P F=== NASCIMENTO CS  N1');
      
      WRITELN('  N2  N3  N4  N5  N6   SO   CG  CC CV FA');
      CONTLIN:=0;
	   END;
//FIM DA IMPRESSAO DO CABECALHO
//LINHA DETALHE
		WRITE(E:5,REG.NUM:5,' ',REG.NOME,' ',REG.CPF,' ',REG.DATA.DIA,'/',REG.DATA.MES,'/',REG.DATA.ANO,REG.CAR:3);
		FOR A:=1 TO 6 DO
		 WRITE(REG.NOTAS[A]:4);
		WRITELN(REG.SOM:5,REG.CLG:5,REG.CLC:4,REG.CCL:3,REG.FALTA:3);
//FIM DA LINHA DETALHE
		CONTLIN:=CONTLIN+1; 
	 END; 
	CLOSE(ARQ);
	WRITELN;
	WRITELN;
	WRITELN('TOTAL DE INSCRITOS POR CARGO');
	FOR A:=1 TO 12 DO
	 WRITELN(A:3,' -- ',CARGOS[A],' -->',TOTCAR[A]:4);
	writeln('TOTAL DE REGISTROS LIDOS',E:5); 
	TERMINE;	 
End.