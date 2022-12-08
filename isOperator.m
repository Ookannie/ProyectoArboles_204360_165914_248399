function isOperator = isOperator(char)
    alphanumValue = sum(~isstrprop(char, 'alphanum'));
    decimalNumber = sum(ismember(char, '0123456789.eEdD'));
    
    isOperator = ((alphanumValue > 0) && (decimalNumber <= 0));
    %isOperator = ~isstrprop(char, 'alphanum');
end