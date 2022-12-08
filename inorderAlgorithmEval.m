function result = inorderAlgorithmEval(node)
    if(isempty(node))
        result = 0;
        return
    end
    
    if(isempty(node.leftNode) && isempty(node.rightNode))
        result = str2num(node.value);
        return
    end
   
    resultLeft = inorderAlgorithmEval(node.leftNode);
    
    resultRight = inorderAlgorithmEval(node.rightNode);
    
    result = evaluateOperation(node.value, resultLeft, resultRight);
    return
end

function result = evaluateOperation(operator, leftValue, rightValue)
    switch operator
        case {'+'}
            result = leftValue + rightValue;
        case {'-'}
            result = leftValue - rightValue;
        case {'/'}
            result = leftValue / rightValue;
        case {'*'}
            result = leftValue * rightValue;
        case {'\','%'}
            result = mod(leftValue, rightValue);
        case {'^'}
            result = leftValue ^ rightValue;
    end
end

