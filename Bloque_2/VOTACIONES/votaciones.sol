// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.7.0;
pragma experimental ABIEncoderV2;

// -----------------------------------
//  CANDIDATO   |   EDAD   |      ID
// -----------------------------------
//  Toni        |    20    |    12345X
//  Alberto     |    23    |    54321T
//  Joan        |    21    |    98765P
//  Javier      |    19    |    56789W

contract votacion {
    // Direccion del propietario del contrato
    address owner;

    // Contructor
    constructor() public {
        owner = msg.sender;
    }

    // Relacion entre el nombre del candidato y el hash de sus datos
    mapping (string => bytes32) ID_Candidato;

    // Relacion entre el nombre y el numero de votos
    mapping (string => uint) votos_candidato;

    // Lista de los candidatos
    string[] candidatos;

    // Lista de los hashes de la identidad de los votantes
    bytes32[] votantes;

    // Funcion para representarse a las oposiciones
    function Representar(string memory _nombre, uint _edad, string memory _id) public {
        // hash de los datos del candidato
        bytes32 hash = keccak256(abi.encodePacked(_nombre, _edad, _id));
        // Almacenar el hash de los datos del candidato ligados a su nombre
        ID_Candidato[_nombre] = hash;
        // Añadir el candidato a la lista de candidatos
        candidatos.push(_nombre);
    }

    // Funcion que permite visualizar las personas que se han presentado como candidatos
    function VerCandidatos() public view returns(string[] memory) {
        // Devuelve la lista de los candidatos
        return candidatos;
    }

    function Votar(string memory _nombre) public {
        // Hash de la direccion de la persona que va a votar
        bytes32 hash_votante = keccak256(abi.encodePacked(msg.sender));
        // Verificar si el votante ya ha votado
        for (uint i = 0; i < votantes.length; i++) {
            require(votantes[i] != hash_votante, "Ya has votado previamente");
        }
        // Añadir el votante a la lista de votantes
        votantes.push(hash_votante);
        // Aumentar el numero de votos del candidatos en 1
        votos_candidato[_nombre]++;
    }

    // Dado el nombre de un candidato nos devuelve el numero que tiene
    function VerVotos(string memory _nombre) public view returns(uint) {
        return votos_candidato[_nombre];
    }

    //Funcion auxiliar que transforma un uint a un string
    function uint2str(uint _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len - 1;
        while (_i != 0) {
            bstr[k--] = byte(uint8(48 + _i % 10));
            _i /= 10;
        }
        return string(bstr);
    }

    // Ver los votos de cada candidato
    function VerResultados() public view returns(string memory) {
        string memory resultados;
        for (uint i = 0; i < candidatos.length; i++) {
            // Actualizamos el string de resultados
            resultados = string(abi.encodePacked(resultados, "(",candidatos[i], ",", uint2str(VerVotos(candidatos[i])), ")----"));
        }

        // Devolvemos los resultados
        return resultados;
    }

    // Proporcionar el nombre del candidato ganador
    function Ganador() public view returns(string memory) {
        string memory ganador = candidatos[0];
        // Variable para la situacion de empate
        bool flag;

        // Recorrer el aray de candidatos para determinador el candidato con mas votos
        for (uint i = 0; i < candidatos.length; i++) {
            // Comparamos sui nu estro ganador ha sido superado por otro
            if (votos_candidato[ganador] < VerVotos(candidatos[i])) {
                ganador = candidatos[i];
                flag = false;
            } else {
                // Miramos si hay empate entre los candidatos
                if (votos_candidato[ganador] == VerVotos(candidatos[i])) {
                    flag = true;
                } 
            }
        }

        // Comprobamos si ha habido un empate
        if (flag == true) {
            ganador = "Hay un empate entre los candidatos";
        }

        return ganador;
    }
}