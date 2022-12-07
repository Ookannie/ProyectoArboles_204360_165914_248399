function expressionTree = createExpressionTree(postfixExpression)
    nodes = [];
    postfix = toArray(postfixExpression);
    
    for i = 1:length(postfix)
        if(~isOperator(postfix(i)))
            operand = Nodo(postfix(i));
            nodes(end+1) = postfix(i);
        else
            operator = Nodo(postfix(i));
            
            operandLeft = nodes(end);
            nodes(end) = []
            
            operandRight = nodes(end);
            nodes(end) = []
            
            operator.leftNode = operandLeft;
            operator.rightNode = operandRight;
            
           nodes = [nodes operator];
        end
    end
    
    expressionTree = nodes(end);
end