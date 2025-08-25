pragma solidity >=0.4.0 <0.7.0;

contract valoresRetorno {
    // funcion que nos devuelva un saludo
    function saludar() public pure returns(string memory) {
        return "Hola, soy un saludo";
    }

    // Funcion que calcula el resultado de una multiplicacion de 2 numeros
    function multiplicacion(uint _n1, uint _n2) public pure returns(uint) {
        return _n1 * _n2;   
    }

    // Este funcion devuelve true si el numero es par y false si es impar
    function par_impar(uint _num) public pure returns(bool) {
        bool flag;
        
        if (_num % 2 == 0) {
            flag = true;
        } else {
            flag = false;
        }
        return flag;
    }

    // Funcion que devuelve el cociente, el resto de una division y un bool que indica si el resto es 0
    function division(uint _num1, uint _num2) public pure returns(uint, uint, bool) {
        uint cociente = _num1 / _num2;
        uint resto = _num1 % _num2;
        bool flag = false;

        if (resto == 0) {
            flag = true;
        }
        return (cociente, resto, flag);
    }

    // Practica para el manejo de los valores devueltos
    function numeros() public pure returns(uint, uint, uint,uint, uint, uint) {
        return (1,2,3,4,5,6);
    }

    // Asignacion multiple
    function todos_los_valores() public pure {
        // (uint a, uint b, uint c, uint d, uint e, uint f) = numeros();
        uint a;
        uint b;
        uint c;
        uint d;
        uint e;
        uint f;

        (a,b,c,d,e,f) = numeros();
    }

    function ultimo_valor() public pure {
        (,,,,,uint f) = numeros();
    }
}