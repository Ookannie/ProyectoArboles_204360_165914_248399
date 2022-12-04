function menor = menorPrecedencia(operador1, operador2)
    menor = 1;
    if((operador2 ~= '(') || (operador2 ~= '[') || (operador2 ~= '{'))
        menor = getPrecedence(operador1) <= getPrecedence(operador2);
    end
end