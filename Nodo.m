classdef Nodo
    %{
        Clase encargada de crear objetos de tipo Nodo con las propiedades:
        rightNode, leftNode y value.
    %}
    
    properties
        rightNode;
        leftNode;  
        value;
    end
    
    methods
        function node = Nodo(value)
            %Metodo constructor que recibe como parametro el valor del nodo
            %creado
            node.value = value;
        end
        
        function leftNode = get.leftNode(node)
            %Metodo de acceso para obtener el hijo izquiero del nodo actual
            leftNode = node.leftNode;
        end
        
        function rightNode = get.rightNode(node)
            %Metodo de acceso para obtener el hijo derecho del nodo actual
            rightNode = node.rightNode;
        end
        
        function node = set.value(node, value)
            %Metodo de acceso que asigna lainformacion enviada en el parametro 
            %al valor del nodo actual
            node.value = value;
        end
        
        function node = set.leftNode(node, leftNode)
            %Metodo de acceso que asigna el valor enviado en el parametro
            %al hijo izquierdo del nodo actual
            node.leftNode = leftNode;
        end
        
        function node = set.rightNode(node, rightNode)
            %Metodo de acceso que asigna el valor enviado en el parametro 
            %al hijo izquierdo del nodo actual
            node.rightNode = rightNode;
        end
    end
end

