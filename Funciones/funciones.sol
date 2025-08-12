pragma solidity >=0.4.0 <0.7.0;
pragma experimental ABIEncoderV2;

contract funciones {
    // Añadir dentro de un array de direcciones, la direccion de la persona que llame a la funcion
    address[] public direcciones;

    function nuevaDireccion() public {
        direcciones.push(msg.sender);
    }

    // Com,putar el hash de los dattos proporcionados como parametro
    bytes32 public hash;

    function Hash(string memory _datos) public {
        hash = keccak256(abi.encodePacked(_datos));
    }

    struct comida {
        string nombre;
        string ingredientes;
    }

    comida public hamburguesa;

    function Hamburguesas(string memory _ingredientes) public {
        hamburguesa = comida("hamburguesa", _ingredientes);
    }

    struct alumno {
        string nombre;
        address direccione;
        uint edad;
    }

    bytes32 public hash_Id_Alumno;

    function hash_Alumno(string memory _nombre, address _direccion, uint _edad) private {
        hash_Id_Alumno = keccak256(abi.encodePacked(_nombre, _direccion, _edad));
    }

    alumno[] public lista;
    mapping (string => bytes32) alumnos;

    function nuevoAlumno(string memory _nombre, uint _edad) public {
        lista.push(alumno(_nombre, msg.sender, _edad));
        hash_Alumno(_nombre, msg.sender, _edad);
        alumnos[_nombre] = hash_Id_Alumno;
    }
}