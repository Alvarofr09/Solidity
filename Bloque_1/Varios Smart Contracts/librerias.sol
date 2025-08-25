pragma solidity >=0.4.0 <0.7.0;


library Operaciones {
    function Division(uint256 a, uint256 b) public pure returns(uint){
        require(b > 0, "No se puede dividir entre 0");
        return a/b;
    }

    function Multiplicacion(uint256 a, uint256 b) public pure returns(uint){
        if ((a == 0) || (b == 0)) {
            return 0;
        } else {
            return a*b;
        }
    }
}

contract Calculadora {
    using Operaciones for uint;

    function calculos(uint a, uint b) public pure returns(uint, uint) {
        uint q = a.Division(b);
        uint m = a.Multiplicacion(b);
        return (q, m);
    }
}