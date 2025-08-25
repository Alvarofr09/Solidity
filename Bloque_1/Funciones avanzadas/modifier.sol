pragma solidity >=0.4.0 <0.7.0;

contract Modifer {

    // Ejemplo solo el propietario del contrato puede jecutar una funcion
    address public owner;
    
    constructor() public {
        owner = msg.sender;
    }

    modifier soloPropietario() {
        require(msg.sender == owner, "No tienes permisos parta ejecutar la funcion");
        _; // Ejecuta la funcion que esta abajo del modifer
    }

    function ejemplo1() public soloPropietario() {
        //Codigo de la funcion para propietario
    }

    struct cliente {
        address direccion;
        string nombre;
    }

    mapping (string => address) clientes;

    function altaCliente(string memory _nombre) public {
        clientes[_nombre] = msg.sender;
    }

    modifier soloClientes(string memory _nombre) {
        require(clientes[_nombre] == msg.sender, "No tienes permisos para ejecutar la funcion");
        _;
    }

    function ejemplo2(string memory _nombre) public soloClientes(_nombre) {
        //Logica de la funcion
    }

    modifier MayorEdad(uint _edadMinima, uint _edadUsuario) {
        require(_edadUsuario >= _edadMinima, "No tienes la edad minima para ejecutar la funcion");
        _;
    }

    function ejemplo3(uint _edad) public MayorEdad(18, _edad) {
        //Logica de la funcion
    }
}