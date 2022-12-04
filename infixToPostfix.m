function postfix = infixToPostfix(cadena)
    operadores = java.util.Stack(); %Stack para guardar operadores
    postfix = [];
    
    lista = split(cadena);          %Separar los elementos 
    for i = 1:length(lista)
        if ~isstrprop(lista{i}, 'alphanum')
          while (~operadores.isEmpty() && (menorPrecedencia(lista{i}, operadores.peek())))
              if ((lista{i} == ')') || (lista{i} == '}') || (lista{i} ==  ']'))
                  operador = operadores.peek();
                  while((operador ~= '(') || (operador ~=  '{') || (operador ~=  '[') )
                      postfix = [postfix operadores.pop()];
                  end
                  operadores.pop();
              end
              postfix = [postfix operadores.pop()];
          end
          operadores.add(lista{i});
        else
              postfix = [postfix lista{i}];
        end   
    end
    while(~operadores.empty)
         postfix = [postfix operadores.pop()];
    end
end




