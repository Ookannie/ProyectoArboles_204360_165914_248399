%Funcion que realiza la evaluacion matematica del arbol de expresion creado
%con postfix. Recibe como parametro la raiz del arbol en cuestion.
%Regresa el resultado de la expresion matematica utilizando el recorrido
%Simetrico sobre el arbol.
function result = inorderAlgorithmEval(node)
    
    %Caso base que verifica si el nodo actual es nulo
    if(isempty(node))
        result = 0;
        return
    end
    
    %Caso en el que se verifica si el nodo actual es una hoja del arbol, 
    %de serlo, agrega al resultado el valor numerico del nodo.
    if(isempty(node.leftNode) && isempty(node.rightNode))
        result = str2num(node.value);
        return
    end
   
    %Caso recursivo para llegar a los extremos izquieros del arbol o 
    %subarbol
    resultLeft = inorderAlgorithmEval(node.leftNode);
    
    %Caso recursivo para llegar a los extremos derechos del arbol o 
    %subarbol
    resultRight = inorderAlgorithmEval(node.rightNode);
    
    %Agrega al parametro de salida el resultado de la operacion de los
    %ultimos operandos y operador asociado.
    result = evaluateOperation(node.value, resultLeft, resultRight);
    return
end

%Funcion que evalua el tipo de operacion a realizar,
%recibe como parametro el operador, el valor izquierdo y el derecho.
%Regresa el resultado de la operacion
function result = evaluateOperation(operator, leftValue, rightValue)
    switch operator
        case {'+'}
            result = leftValue + rightValue;
        case {'-'}
            result = leftValue - rightValue;
        case {'/'}
            result = leftValue / rightValue;
        case {'*'}
            result = leftValue * rightValue;
        case {'\','%'}
            result = mod(leftValue, rightValue);
        case {'^'}
            result = leftValue ^ rightValue;
    end
end

