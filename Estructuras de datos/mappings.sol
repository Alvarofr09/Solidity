pragma solidity >=0.4.0 <0.7.0;
pragma experimental ABIEncoderV2;

contract Mappings {
    // Declaramos un mapping
    mapping (address => uint) public myMap;

    function elegirNumero(uint _numero) public {
        myMap[msg.sender] = _numero;
    }

    function consultarNumero() public view returns (uint) {
        return myMap[msg.sender];
    }

    // Declaramos un mapping que relaciona el nombre de una persona con su cantidad de dinero
    mapping (string => uint) public cantidadDinero;

    function Dinero(string memory _nombre, uint _cantidad) public {
        cantidadDinero[_nombre] = _cantidad;
    }

    function verDinero(string memory _nombre) public view returns (uint) {
        return cantidadDinero[_nombre];
    }

    // Ejemplo de mapping con un struct
    struct Persona {
        string nombre;
        uint edad;
    }

    mapping(uint => Persona) public personas;

    function crearPersona(uint _dni, string memory _nombre, uint _edad) public {
        personas[_dni] = Persona(_nombre, _edad);
    }

    function visualizarPersona(uint _dni) public view returns (Persona memory) {
        return personas[_dni];
    }
}