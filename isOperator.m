function isOperator = isOperator(char)
    isOperator = ~isstrprop(char, 'alphanum');
end