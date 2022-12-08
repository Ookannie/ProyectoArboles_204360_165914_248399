function integridadExpresion(expresionAdecuada)
%Funcion que comprueba que la funcion ingresada no contenga errores

operadores = ['+','-','*','/','\','%','^','(',')'];
expresion = split(expresionAdecuada);   %Crea lista de elementos
contab=0;                               %Contador de parentesis de apertura
contce=0;                               %Contador de parentesis de cierre
longitudExpresion = length(expresion);  %Longitud de la expresion
expresion{longitudExpresion + 1} = [];  %Agrega elemento al final para evitar conflictos en for

%comprobar que no existan mas de 2 puntos en un elemento 
for i=1:longitudExpresion
      vpunto = expresion{i} == '.';     %Numero de puntos en un elemento
      %Contadores de parentesis
      contab= sum(expresion{i} == '(') + contab; 
      contce= sum(expresion{i} == ')') + contce;
      
      %Parentesis de cierre antes de uno de apertura
      if(contce > contab)
          error('Expresion no valida: Mal uso de parentesis.');
      end
      
     valphan= isstrprop(expresion{i}, 'alphanum');
     voperadores= ismember(expresion{i}, operadores);
     vValida = ( vpunto | valphan | voperadores );
     voperadores2 =ismember(expresion{i+1}, operadores);
     
     %Dos operadores seguidos
     if(sum(voperadores) && sum(voperadores2))
         if(((expresion{i} == '(') && (~vectorOperatorViable(expresion{i+1}))) || ((expresion{i} == ')') && (expresion{i+1} == '(')))
            error('Expresion no valida: Mal uso de operadores.'); 
        end
     end
     if(sum(~vValida) > 0)
         error('Expresion no valida: Elementos desconocidos en la expresion.');
     end
     if(sum(vpunto) >= 2)
         error('Expresion no valida: Mal uso de puntos decimales.');
     end
end
  
  %Numeros de parentesis no coinciden
  if (contab ~= contce)
    error('Expresion no valida: Mal uso de parentesis');
  end
  
  %Operador no valido al final de expresion
  if(ismember(expresion{longitudExpresion}, operadores ) && expresion{longitudExpresion} ~= ')')
    error('Expresion no valida: Operador mal colocado al final de expresion.');
  end
  
  %Operador no valido al inicio de expresion
  if(~vectorOpViables(expresion{i}))
    error('Expresion no valida: Operador mal colocado al inicio de expresion.');
  end
  
  disp('Integridad correcta de la expresion');
end

function vectorOpViables = vectorOperatorViable(char)
%Funcion que detecta si un operador es viable como inicio de expresion
    vectorOpViables = (char == '+');
    vectorOpViables = vectorOpViables | char == '-';
    vectorOpViables = vectorOpViables | char == '(';
end