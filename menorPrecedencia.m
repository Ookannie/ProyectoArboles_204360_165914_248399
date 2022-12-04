function menor = menorPrecedencia(operador1, operador2)
    menor = 0;
    menor = getPrecedence(operador1) <= getPrecedence(operador2);
end