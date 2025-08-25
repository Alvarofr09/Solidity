// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.7.0;
pragma experimental ABIEncoderV2;

// -----------------------------------
//  ALUMNO   |    ID    |      NOTA
// -----------------------------------
//  Marcos |    77755N    |      5
//  Joan   |    12345X    |      9
//  Maria  |    02468T    |      2
//  Marta  |    13579U    |      3
//  Alba   |    98765Z    |      5

contract notas {
    // Direccion del profesor
    address public profesor;

    // Constructor
    constructor () public {
        profesor = msg.sender;
    }

    // Mapping para relacionar hash del ID del alumno con su nota del examen
    mapping (bytes32 => uint) Notas;

    // Array de alumnos que pide¡an revision
    string [] revisiones;

    // Eventos
    event alumno_evaluado(bytes32, uint);
    event evento_revision(string);

    // Funcion de evaluar alumnos
    function Evaluar(string memory _idAlumno, uint _nota) public UnicamenteProfesor(msg.sender) {
        // Hash del ID del Alumno
        bytes32 hash_idAlumno = keccak256(abi.encodePacked(_idAlumno));
        //Relacion entre el hash del alumno y su nota;
        Notas[hash_idAlumno] = _nota;
        // Emision del evento
        emit alumno_evaluado(hash_idAlumno, _nota);
    }

    modifier UnicamenteProfesor (address _direccion) {
        // Requiere que la direccion por parametro sea igual al owner del contrato
        require(_direccion == profesor, "No tienes permisos para ejecutar la funcion.");
        _;
    }

    // Funcion para ver las notas
    function VerNotas(string memory _idAlumno) public view returns(uint) {
        //Hash del ID del Alumno
        bytes32 hash = keccak256(abi.encodePacked(_idAlumno));
        //Nota asociada al hash del alumno
        return Notas[hash];
    }

    // Funcion para pedir revision
    function Revision(string memory _idAlumno) public {
        // Almacenamiento del ID del alumno
        revisiones.push(_idAlumno);
        // Emision del evento
        emit evento_revision(_idAlumno);
    }

    // Funcion para ver las revisiones
    function VerRevisiones() public view UnicamenteProfesor(msg.sender) returns(string[] memory) {
        // Devolver el array de revisiones
        return revisiones;
    }
}