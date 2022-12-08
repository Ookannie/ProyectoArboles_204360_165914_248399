%Funcion para verificar si un operador tiene menor precedencia sobre otro
%Recibe como parametros los operadores a comparar.
%Regresa 1 si el operador1 tiene menor precedencia sobre el operador2
%0 en caso contrario
function menor = menorPrecedencia(operador1, operador2)
    menor = getPrecedence(operador1) <= getPrecedence(operador2);
end