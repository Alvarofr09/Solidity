pragma solidity >=0.4.0 <0.7.0;
pragma experimental ABIEncoderV2;

contract SmartContract1 {

    //Almacenamento de la informacion del factory
    mapping (address => address) public  MiContratoPersonal;

    function factory() public {
        address direccion_nuevo_contrato = address (new SmartContract2(msg.sender));
        MiContratoPersonal[msg.sender] = direccion_nuevo_contrato;
    }
}

contract SmartContract2 {
    address public owner;
    constructor(address _direccion) public {
        owner = _direccion;
    }
}