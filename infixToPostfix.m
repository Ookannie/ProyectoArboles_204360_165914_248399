function postfix = infixToPostfix(cadena)
    operadores = java.util.Stack(); %Stack para guardar operadores
    postfix = java.util.ArrayList();
    
    lista = split(cadena);          %Separar los elementos 
    for i = 1:length(lista)
        if ~isstrprop(lista{i}, 'alphanum')
          while (~operadores.isEmpty() && (menorPrecedencia(lista{i}, operadores.peek())))
              postfix.add(operadores.pop())
          end
          operadores.add(lista{i});
        else
             postfix.add(lista{i});
        end   
    end
    while(~operadores.empty)
         postfix.add(operadores.pop());
    end
end


