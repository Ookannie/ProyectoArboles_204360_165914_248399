function integridadExpresion(expresionAdecuada)
%Funcion que comprueba que la funcion ingresada no contenga errores
operadores = ['+','-','*','/','\','%','^','(',')'];
expresion = split(expresionAdecuada);
contab=0;
contce=0;
longExp = length(expresion);
expresion{longExp + 1} = [];

%comprobar que no existan mas de 2 puntos en un elemento%  
for i=1:longExp
      vpunto = expresion{i} == '.';
      contab= sum(expresion{i} == '(')+ contab;
      contce= sum(expresion{i} == ')')+ contce;
      
      if(contce > contab)
          error('expresion no valida');
      end
      
     valphan= isstrprop(expresion{i}, 'alphanum');
     voperadores= ismember(expresion{i}, operadores);
     vValida = ( vpunto | valphan | voperadores );
     
     voperadores2 =ismember(expresion{i+1}, operadores);
     
     if(sum(voperadores) && sum(voperadores2))
         
      if(expresion{i+1} ~= '(')
         error('expresion no valida'); 
      end
      
     end
     
     if(sum(~vValida) > 0)
         error('expresion no valida');
     end
     
     if(sum(vpunto) >= 2)
         error('expresion no valida');

     end
end

  if (contab ~= contce)
  
      error('expresion no valida')

  end
         
  if(ismember(expresion{longExp}, operadores ) && expresion{longExp} ~= ')' )
  error('expresion no valida')
  end
end