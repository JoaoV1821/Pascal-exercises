Program T07ANDREALEX_JOAOSANTOS ;

  uses BIBLIONT;

    var arql1,arql2:text;
            reg1:string[64];
            reg2:string[28];
            notas,questoes:array[1..6] of integer;
            nn,num:string[4];
            chave:boolean;
            gaba:string[60];
            i,a:integer;

Begin

 assign(arql1,'prova.TXT');
 
 assign(arql2,'NOTAS.TXT');
 
 reset(arql1);
 
 rewrite(arql2);
 
     begin {gabarito}

         repeat
 
             chave:=true;

             writeln('digite o gabarito ');

             readln(gaba);

             gaba:=upcase(gaba);

             i:=1;

             repeat

                 if ((gaba[i]<'A') or (gaba[i]>'E')) then

                     chave:=false;

                     i:=i+1;

             until ((i>60) or (not chave));

         until (chave);

     end; {gabarito}

     repeat

         a:=a+1;

         readln(arql1,reg1);

         num:=copy(reg1,1,4);

         insert(num,reg2,1);
		until(a = 1)

End.