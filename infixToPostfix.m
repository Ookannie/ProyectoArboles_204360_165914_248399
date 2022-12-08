%Funcion que convierte la expresion infix del parametro en una postfix
%Recibe como parametro la expresion a evaluar
%Regresa la expresion postfix
function postfix = infixToPostfix(expresion)
    operadores = java.util.Stack(); %Stack para guardar operadores
    postfix = java.util.ArrayList();
    
    %Separar la expresion por espacios vacios
    chars = split(expresion);
    
    for i = 1:length(chars)
        
        %En caso de encontrar un parentesis que abre, este se agrega
        %directamente a la pila de operadores
        if(chars{i} == '(')
            operadores.add(chars{i});
        
        %En caso de encontrar un parentesis que cierra, se agregara a la
        %expresion postfix todos los operadores que se encuentren en la
        %pila hasta topar con un parentesis que abre
        elseif(chars{i} == ')')
            while (~operadores.isEmpty() && (operadores.peek() ~= '('))
                 postfix.add(operadores.pop());
            end
            %sacar de la cola el parentesis que abre
            operadores.pop();
        %Si el caracter actual es un operador, se verifica si tiene menor
        %precedencia que el que se encuentra en la cima de la pila, de ser
        %asi, se saca la cima y se agrega a postfix, de lo contrario se
        %agrega a la pila
        elseif(isOperator(chars{i}))
            while((~operadores.isEmpty() && (menorPrecedencia(chars{i}, operadores.peek()))))
                 postfix.add(operadores.pop());
            end
            operadores.add(chars{i});
        end
        %Si el caracter actual es un operando, se agrega directamente a
        %postfix
        if(isOperand(chars{i}))
            postfix.add(chars{i});
        end
        
    end
    
    %Ciclo que vacia la pila de operadores agregandolos a postfix
    while(~operadores.isEmpty())
        postfix.add(operadores.pop());
    end
    
end


