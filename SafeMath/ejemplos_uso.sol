pragma solidity >=0.4.0 <0.7.0;
import "./SafeMath_comentada.sol";

contract ejemplos {
    
    //Debemos declarar para que datos usaremos la libreria
    using SafeMath for uint;

    // Funcion suma
    function suma(uint _a, uint _b) public pure returns(uint) {
        return _a.add(_b);
    }

    // Funcion resta
    function resta(uint _a, uint _b) public pure returns(uint) {
        return _a.sub(_b);
    }

    // Funcion multiplicacion
    function multiplicacion(uint _a, uint _b) public pure returns(uint) {
        return _a.mul(_b);
    }

}