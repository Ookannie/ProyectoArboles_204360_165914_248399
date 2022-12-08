%Funcion que genera el arbol de expresion asociado a la expresion postfix
%enviada en el parametro, regresa el arbol de expresion
function expressionTree = createExpressionTree(postfixExpression)
    nodes = []; %stack para los nodos entrantes
    postfix = toArray(postfixExpression);
    
    for i = 1:length(postfix)
        %Se verifica si el nodo actual es un operando, de ser asi se agrega
        %a la pila
        if(~isOperator(postfix(i)))
            operand = Nodo(postfix(i));
            nodes = [nodes operand];
            
        else
            %Si el nodo actual es un operador, se crea un objeto de tipo
            %Nodo
            operator = Nodo(postfix(i));
            
            %Se crea un objeto tipo Nodo que almacena el nodo que se
            %encuentra en la cima de la pila y este se asocia al hijo
            %derecho del nodo operador
            operandRight = nodes(end);
            operator.rightNode = operandRight;
            nodes(end) = [];
            
            %Se crea un objeto tipo Nodo que almacena el nodo que se
            %encuentra en la cima de la pila y este se asocia al hijo
            %izquierdo del nodo operador
            operandLeft = nodes(end);
            operator.leftNode = operandLeft;
            nodes(end) = [];
            
            %El nodo operador con las referencias izquierda y derecha se
            %agrega a la pila
            nodes = [nodes operator];
        end
    end
    
    expressionTree = nodes(end);
end