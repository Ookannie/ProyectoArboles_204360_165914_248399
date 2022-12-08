clear all; clc; close all;
%Proyecto de arboles para la materia de Matematicas discretas.
%Recibe una expresion matematica como cadena y genera un arbol
%de expresion para resolverla utilizando notacion postfix.
%En caso de utilizar una expresion algebraica solo se muestra la
%expresion postfix obtenida.

%% Ingresar expresion a generar
expressionRaw = input('Ingresar expresion matematica: ', "s");

expresionAdecuada = ajustaExpresion(expressionRaw);
integridadExpresion(expresionAdecuada);

expressionPostfix = infixToPostfix(expresionAdecuada);
if(sum(isstrprop(expressionRaw,'alpha')))
    disp('Expresion algebraica ingresada: mostrando expresion en notacion Postfix:');
    disp(expressionPostfix);
else
    expressionTree = createExpressionTree(expressionPostfix);
    resultado = inorderAlgorithmEval(expressionTree);
    fprintf('%s = %d \n\n', expresionAdecuada, resultado);
end
