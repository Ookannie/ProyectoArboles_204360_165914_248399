function precedencia = getPrecedence(operador)
    switch operador
        case {'+','-'}
            precedencia = 1;
        case {'/','*'}
            precedencia = 2;
        case {'\','%'}
            precedencia = 3;
        case '^'
            precedencia = 4;
        case '('
            precedencia = 0;
        case ')'
            precedencia = 0;
    end
end