%Funcion que verifica si el caracter enviado en el parametro es un operador
%regresa 1 si el caracter es operador, 0 en caso contrario
function isOperator = isOperator(char)
    alphanumValue = sum(~isstrprop(char, 'alphanum'));
    decimalNumber = sum(ismember(char, '0123456789.eEdD'));
    
    isOperator = ((alphanumValue > 0) && (decimalNumber <= 0));
end