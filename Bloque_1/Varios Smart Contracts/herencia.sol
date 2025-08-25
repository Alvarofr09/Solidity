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

contract Cliente is Banco {
    function AltaCliente(string memory _nombre) public {
        nuevoCliente(_nombre);
    }

    function IngresarDinero(string memory _nombre, uint dinero) public {
        clientes[_nombre].dinero = clientes[_nombre].dinero + dinero;
    }

    function RetirarDinero(string memory _nombre, uint dinero) public returns(bool) {
        bool flag = true;

        if (int(clientes[_nombre].dinero) - int(dinero) >= 0) {
            clientes[_nombre].dinero = clientes[_nombre].dinero - dinero;
        } else {
            flag = false;
        }

        return flag;
    }

    function COnsultarDinero (string memory _nombre) public view returns (uint) {
        return clientes[_nombre].dinero;
    }
}