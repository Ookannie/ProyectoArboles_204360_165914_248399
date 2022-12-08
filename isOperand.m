%Funcion que verifica si el caracter enviado en el parametro es un operando
%regresa 1 si el caracter es operando, 0 en caso contrario
function isOperand = isOperand(char)
    alphanumValue = sum(isstrprop(char, 'alphanum'));
    decimalNumber = sum(ismember(char, '0123456789.eEdD'));
    
    isOperand = ((alphanumValue > 0) || (decimalNumber) > 0);
end