program Exemplo1;
var
aDATA : string;
dia,mes,ano : String;
NomeMes : array[1..12] of String;
xdia, xmes, xano, CODE : integer;
bis : Boolean;
ultimos : array[1..12] of string;
begin

   ClrScr;   // pra limpar a tela
   writeln('Digite uma Data: 99/99/9999: ');
   readln (aData);

   //  todos os últimos dias dos meses do ano
   ultimos[1] := '31';
   ultimos[2] := '28';
   ultimos[3] := '31';
   ultimos[4] := '30';
   ultimos[5] := '31';
   ultimos[6] := '30';
   ultimos[7] := '31';
   ultimos[8] := '31';
   ultimos[9] := '30';
   ultimos[10] := '31';
   ultimos[11] := '30';
   ultimos[12] := '31';

   // todos os nomes dos meses do ano
   NomeMes[1]  := 'Janeiro';
   NomeMes[2]  := 'Fevereiro';
   NomeMes[3]  := 'Março';
   NomeMes[4]  := 'Abril';
   NomeMes[5]  := 'Maio';
   NomeMes[6]  := 'Junho';
   NomeMes[7]  := 'Julho';
   NomeMes[8]  := 'Agosto';
   NomeMes[9]  := 'Setembro';
   NomeMes[10] := 'Outubro';
   NomeMes[11] := 'Novembro';
   NomeMes[12] := 'Dezembro';
   
   if (LENGTH(aData)=10) then begin
      bis      := false;
     // { desmonta a data separando em dia, mês e ano}
      dia   := copy(aData,1,2);
      mes   := copy(aData,4,2);
      ano   := copy(aData,7,4);

         // { transforma textos em números}
      VAL(DIA, xDIA, CODE);
      VAL(MES, xMES, CODE);
      VAL(ANO, xANO, CODE);

		 // testar o ano desta data 
      bis := ((xANO mod 4 )=0 );   // SE FOR MULTIPLO DE 4 RETORNA TRUE
      if  bis Then
	     WriteLn('Ano Bissexto');
 	 else
         WriteLn('Ano normal');
		 
     if bis   and   xMES = 2 ultimo[2] := 29;

	 if (xmes < 1) or (xmes > 12)  then
		    WriteLn('Mês digitado errado!')
		else	 
		     WriteLn('O nome do mês é : '+ NomeMes[xmes]);
        
	if (xdia > 0) and (xdia <= Ultimo[xmes]) then 
		     WriteLn('Data correta !')
		Else	 
		     WriteLn('Data incorreta !');
end;
		 
end.
