function inorder = inorderAlgorithm(node)
    if(isempty(node))
        return
    end
    
    inorderAlgorithm(node.leftNode);
    inorder = node.value;
    inorderAlgorithm(node.rightNode);
end