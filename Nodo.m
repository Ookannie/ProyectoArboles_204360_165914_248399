classdef Nodo
    %NODE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        isRoot;
        rightNode;
        leftNode;  
        value;
    end
    
    methods
        function node = Nodo(value)
            %NODE Construct an instance of this class
            %   Detailed explanation goes here
            node.value = value;
        end
        
        function leftNode = get.leftNode(node)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            leftNode = node.leftNode;
        end
        
        function rightNode = get.rightNode(node)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            rightNode = node.rightNode;
        end
        
        function node = set.value(node, value)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            node.value = value;
        end
        
        function node = set.leftNode(node, leftNode)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            node.leftNode = leftNode;
        end
        
        function node = set.rightNode(node, rightNode)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            node.rightNode = rightNode;
        end
    end
end

