pragma solidity >=0.4.0 <0.7.0;

contract Banco {

    // Definimos un tipo de dato completo
    struct cliente {
        string _nombre;
        address direccion;
        uint dinero;
    }

    //mapping que nos relaciona el nombre del cliente cpn el tipo de dato cliente
    mapping (string => cliente) clientes;

    // Funcion para crear nuevo Cliente
    function nuevoCliente(string memory _nombre) public {
        clientes[_nombre] = cliente(_nombre, msg.sender, 0);
    }
}

contract Banco2 {

}

contract Banco3{
    
}