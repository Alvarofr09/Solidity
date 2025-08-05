pragma solidity >=0.4.0 <0.7.0;
pragma experimental ABIEncoderV2;

contract otras_variables {
    // Tipo string
    string public mi_primer_string = "holaaa";

    // Tipo bool
    bool public mi_primer_booleano = true;
    bool public mi_segundo_booleano = false;

    // Tipo byte
    bytes32 public mi_primer_byte = "holaaa";
    string public nombre = "Alvaro";
    bytes32 public hash = keccak256(abi.encodePacked(nombre));
    bytes4 public identificador;
    function ejemploBytes4() public {
        identificador = msg.sig;
    }

    // Variables address
    address public mi_primera_direccion = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
}