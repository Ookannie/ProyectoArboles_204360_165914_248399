function expressionTree = createExpressionTree(postfixExpression)
    nodes = [];
    postfix = toArray(postfixExpression);
    
    for i = 1:length(postfix)
        if(~isOperator(postfix(i)))
            operand = Nodo(postfix(i));
            nodes = [nodes operand];
            
        else
            operator = Nodo(postfix(i));
            
            operandRight = nodes(end);
            operator.rightNode = operandRight;
            nodes(end) = [];
            
            operandLeft = nodes(end);
            operator.leftNode = operandLeft;
            nodes(end) = [];
            
            nodes = [nodes operator];
        end
    end
    
    expressionTree = nodes(end);
end