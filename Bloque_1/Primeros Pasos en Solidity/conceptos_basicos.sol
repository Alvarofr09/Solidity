// Indicamos la version 
pragma solidity >=0.4.0 <0.7.0;
// Importar archivo ERC20.sol que esta en nuestra carpeta
import "./ERC20.sol";

// Nuestro primer contrato
contract PrimerContrato {

    // En esta variable se ecnuentra la direccion de la persona que despliega el contrato
    address owner;
    ERC20Basic token;

    /*
    Guardamos en la variable owner la direccion de la persona que despliega el contrato
    Inicializamos el numero de tokens
    */
    constructor() public {
        owner = msg.sender;
        token = new ERC20Basic(1000);
    }
}