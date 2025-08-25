pragma solidity >=0.4.0 <0.7.0;

contract Comida {

    struct plato {
        string nombre;
        string ingredientes;
        uint tiempo;
    }

    //Array finamico de platos
    plato [] platos;

    //Relacionamos en un mapping el nombre del plato con sus ingredientes
    mapping(string => string) ingredientes;

    //Funcion que permite crear un plato
    function nuevoPlato(string memory _nombre, string memory _ingredientes, uint _tiempo) internal {
        platos.push(plato(_nombre, _ingredientes, _tiempo));
        ingredientes[_nombre] = _ingredientes;
    }

    function verIngredientesComida(string memory nombre) internal view returns(string memory) {
        return ingredientes[nombre];
    }
}

contract Sandwich is Comida {

    function crearSandwich(string calldata _ingredientes, uint _tiempo) external {
        nuevoPlato("Sandwich", _ingredientes, _tiempo);
    }

    function verIngredientes(string calldata _nombre) external view returns(string memory) {
        return verIngredientesComida(_nombre);
    }
}