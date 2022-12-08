

function isOperand = isOperand(char)
    alphanumValue = sum(isstrprop(char, 'alphanum'));
    decimalNumber = sum(ismember(char, '0123456789.eEdD'));
    
    isOperand = ((alphanumValue > 0) || (decimalNumber) > 0);
end