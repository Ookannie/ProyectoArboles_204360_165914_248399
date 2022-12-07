function postfix = infixToPostfix(expresion)
    operadores = java.util.Stack(); %Stack para guardar operadores
    postfix = java.util.ArrayList();
    
    chars = split(expresion);
    
    for i = 1:length(chars)
        
        if(chars{i} == '(')
            operadores.add(chars{i});
            
        elseif(chars{i} == ')')
            while (~operadores.isEmpty() && (operadores.peek() ~= '('))
                 postfix.add(operadores.pop());
            end
            operadores.pop();
        
        elseif(isOperator(chars{i}))
            while((~operadores.isEmpty() && (menorPrecedencia(chars{i}, operadores.peek()))))
                 postfix.add(operadores.pop());
            end
            operadores.add(chars{i});
        end
        
        if(isOperand(chars{i}))
            postfix.add(chars{i});
        end
        
    end
    
    while(~operadores.isEmpty())
        postfix.add(operadores.pop());
    end
    
end


