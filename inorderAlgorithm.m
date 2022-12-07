function inorder = inorderAlgorithm(node)
    if(isempty(node))
        return
    end
    
    inorderAlgorithm(node.leftNode);
    node.value
    inorderAlgorithm(node.rightNode);
end