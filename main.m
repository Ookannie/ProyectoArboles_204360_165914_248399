clear all; clc; close all;
%Proyecto de arboles para la materia de Matematicas discretas.
%Recibe una expresion matematica como cadena y genera un arbol
%de expresion para resolverla utilizando notacion postfix.
%En caso de utilizar una expresion algebraica solo se muestra la
%expresion postfix obtenida.

%% Ingresar expresion a generar
expressionRaw = input('Ingresar expresion matematica: ', "s");

%% Adecuar expresion y verificar que no contenga errores
expresionAdecuada = ajustaExpresion(expressionRaw);
integridadExpresion(expresionAdecuada);

%% Conversion de infix a postfix
expressionPostfix = infixToPostfix(expresionAdecuada);

%% Tipo de expresion ingresada
if(sum(isstrprop(expressionRaw,'alpha')))
    disp('Expresion algebraica ingresada.');
else
    expressionTree = createExpressionTree(expressionPostfix);
    resultado = inorderAlgorithmEval(expressionTree);
    fprintf('%s = %f \n\n', expresionAdecuada, resultado);
end

%% Despliegue de notacion Postfix
disp('Mostrando expresion en notacion Postfix: ');
disp(expressionPostfix);