function expresionAdecuada = ajustaExpresion(expresionRaw)
%Funcion que toma la expresion ingresada al programa y 
%la adecúa para realizar la conversion infix a postfix

%Eliminar espacios al inicio y final de la expresion
vectorEspacios = vectorSpace(expresionRaw);
if vectorEspacios(1) == 1       %Verificar primer elemento
    vectorEspacios(1) = [];
    expresionRaw(1) = [];
end
if vectorEspacios(end) == 1     %Verificar último elemento
    vectorEspacios(end) =[];
    expresionRaw(end) = [];
end
%Eliminar espacios repetidos
for i = length(vectorEspacios):-1:2
    if (vectorEspacios(i) && vectorEspacios(i-1))   
        vectorEspacios(i) = [];
        expresionRaw(i) = [];
    end
end

%Separar operadores
vectorOperadores = vectorOperator(expresionRaw);
for i = length(expresionRaw):-1:2
    if vectorOperadores(i) && vectorOperadores(i-1)
        vectorOperadores = [vectorOperadores(1:i-1), false, vectorOperadores(i:end)];
        expresionRaw = [expresionRaw(1:i-1), ' ', expresionRaw(i:end)];
    end
end

%Separar operadores y operandos
vectorOperandos = vectorOperand(expresionRaw);
vectorOperadores = vectorOperator(expresionRaw);
for i = length(expresionRaw):-1:2
    %Separa caracteres con un espacio si hay un operando delante de un operador
    if (vectorOperandos(i) && vectorOperadores(i-1)) || (vectorOperadores(i) && vectorOperandos(i-1))
        vectorOperandos = [vectorOperandos(1:i-1), false, vectorOperandos(i:end)];
        vectorOperadores = [vectorOperadores(1:i-1), false, vectorOperandos(i:end)];
        expresionRaw = [expresionRaw(1:i-1), ' ', expresionRaw(i:end)];
    end
end
expresionAdecuada = expresionRaw;    %Devolver expresion ajustada
end

function vectorOperator = vectorOperator(char)
%Devuelve un vector con un 1 en las posiciones donde hay un operador
%Caso contrario devuelve 0 en esas posiciones
    vectorOperator = ~isstrprop(char, 'alphanum') & ~isstrprop(char, 'wspace');
    vectorOperator = xor(vectorOperator, char == '.');  %elimina '.' como operador
end

function vectorOperand = vectorOperand(char)
%Devuelve un vector con un 1 en las posiciones que hay un numero y/o letra
%Caso contrario devuelve un cero en dichas posiciones
    vectorAlphanum = isstrprop(char, 'alphanum') | isstrprop(char, 'punct');
    vectorAlphanum = vectorAlphanum & ~vectorOperator(char);
    vectorOperand = vectorAlphanum;
end

function vectorSpace = vectorSpace(char)
%Devuelve un vector con un 1 en las posiciones que hay espacios
    vectorSpace = isstrprop(char, 'wspace');
end