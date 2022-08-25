Program CRIATEXTO ;
//LER DO TECLADO ,NUM:4,NOME:35,CPF:11,NASC:8,CARGO:2 (1<->12) , nuM total De 60 caracteres e criar um arquivo
//tipo texto (acesso sequencial - SAI1.TXT), com as informações lidas... num=0, encerra a leitura.
{01-04=NUMERO
 05-39=NOME
 40-50=CPF
 51-58=NASCIMENTO
 59-60=CARGO}
uses BInoite;//<<<<<<<<<<<<<<PARA USAR BIBLIOTECA PARTICULAR --> USES <nome da bi
var regi:string[60];
    num,ano:string[4];
    mes,dia,cargo:string[2];
    cpf:string[11];
    nome:string[35];
    a,b,c,e,tc,DD,MM,AA:integer;
    arq:text; //NOME LOGICO DO ARQUIVO
    CHACPF,CHADATA:BOOLEAN;
Begin
   assign(arq,'sai1.txt');
   append(arq);
   repeat                       //
	  write(' num =>');           //
	  readln(num);                //
	  val(num,a,e);               // substiruir por leia1(' NUM',A);  
	  if(e<>0)then                //
	   writeln(' numero ilegal'); //
	 until (e=0);                 //
	 while( a>0)do                
	  begin
//ANTES, USAR A PROCEDURE STR (VEJA APOSTILA PASCALZIM) PARA TRANSFORMAR O INTEGER DEVOLVIDO POR LEIA1 (A) EM
//UMA VARIÁVEL STRING[4] (NUM)
	   tc:=length(num);     //pega total de caracteres contidos em NUM     9  -> TC=1
	   for b:=1 to 4-tc do  //para inserir '0' na frente     1 ATÉ 3
	    insert('0',num,1);  //de num  B=1 NUM=09;  B=2 NUM=009;   B=3 NUM=0009
     write(' nome=>');
	   readln(nome);
	   nome:=upcase(nome);
	   tc:=length(nome);    //pega total de caracteres contidos em nome
		 for b:=tc+1 to 35 do //completa com espaços ate 35
	    insert(' ',nome,b); //o conteudo de nome  
//validar o cpf USE A FUNCTION DE BIBLIONT PARA VALIDAR CPF;
	   REPEAT
	    CHACPF:=TRUE;
		  write(' cpf=>');
	    readln(cpf);
	    IF(LENGTH(CPF) < 11)THEN
	     CHACPF:=FALSE
	    ELSE
	     CHACPF:=VALIDACPF(CPF);
	    IF(NOT CHACPF)THEN
	     WRITELN('    CPF ILEGAL');
	   UNTIL CHACPF;
//validar a data USE A FUNCTION DE BIBLIONT PARA VALIDAR A DATA
     REPEAT 
      CHADATA:=TRUE;                                        //
		  write(' dia=>');                                      //
      readln(dia);                                          //
      VAL(DIA,DD,E);                                        //
      IF(E<>0)THEN                                          //
       CHADATA:=FALSE                                       //
      ELSE                                                  //
       BEGIN                                                //
        if(length(dia)<2)then //para inserir '0' na frente  //
         insert('0',dia,1);   //de dia                      //
        write(' mes=>');                                    //
        readln(mes);                                        //
        VAL(MES,MM,E);                                      //
        IF(E<>0)THEN                                        //  SUBSTITUIR TODAS AS INSTRUÇOES
         CHADATA:=FALSE                                     //  PELA SOLUCAO DO TRABALHO 03
        ELSE                                                // REPEAT
         BEGIN                                              //  LEIA1(' DIA',DD);
				  if (length(mes)<2)then//para inserir '0' na frente//  LEIA1(' MES',MM);
          insert('0',mes,1);    //de mes                    //  LEIA1(' ANO',AA);
          write(' ano=>');                                  // UNTIL(VALIDATA(DD,MM,AA)
          readln(aNO);                                      // TRANSFORMAR DD,MM EM VARIAVEIS STRIN[2]
          VAL(ANO,AA,E);                                    // TRANSFORMAR AA EM VARIÁVEL STRING[4]
          IF(E<>0)THEN                                      // INSERIR ZERO NA FRENTE DO DIA OU DO MES, SE NECESSARIO
           CHADATA:=FALSE                                   //
          ELSE                                              //
           CHADATA:=VALIDATA(DD,MM,AA);                     //
         END;                                               //
       END;                                                 //
      IF( NOT CHADATA) THEN                                 //
       WRITELN('   DATA ILEGAL');                           //
     UNTIL CHADATA;                                         //
//VALIDAR O CARGO
     repeat
      WRITE(' cargo=>');                                     //
      READLN(CARGO);                                         //
      val(cargo,b,e);  //transf cargo string em integer (b)  //
      if((e<>0) or (b<1) or (b>12))then                      // SUBSTITUIR POR LEIA1(' CARGO',B)
       writeln('    cargo ilegal');                          //
     until ((e=0) and (b>0) and (b<13));                     //
//ANTES, TRANSFORMAR O INTEGER EM UM STRING[2] (CARGO)
     if(length(cargo)<2) then  //para inserir '0' na frente 
      insert('0',cargo,1);      //de cargo
//MONTAR O REGISTRO COLOCANDO OS CAMPOS LIDOS EM REGIS, fica mais facil,
//MANDar INSERIR DE TRAZ PARA FRENTE, uma vez que todos as informações lida, o total de caracteres
//que a variavel declarada indica (cargo-2,ano-4, etc....)
{
05 - CARGO
199905 - ANO
07199905 - MES
2507199905 - DIA
111111111112507199905 - CPF
MARIA DA SILVA PEREIRA             111111111112507199905 - NOME
0038MARIA DA SIVA PEREIRA              111111111112507199905 - NUM
}
     INSERT(CARGO,REGI,1);   
     INSERT(ANO,REGI,1);   
     INSERT(MES,REGI,1);   
     INSERT(DIA,REGI,1);   
     INSERT(CPF,REGI,1);   
     INSERT(NOME,REGI,1);   
     INSERT(NUM,REGI,1);
		 WRITELN(ARQ,REGI);   //<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
     repeat                 //
	    write(' num =>');     //
	    readln(num);          //
	    val(num,a,e);         // substiruir por leia1(' NUM',A);
	    if(e<>0)then          //
	     writeln(' ilegal');  //
	   until (e=0);           //
	END;
	TERMINE;
	CLOSE(ARQ);	 
End.