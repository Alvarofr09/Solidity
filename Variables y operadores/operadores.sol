pragma solidity >=0.4.0 <0.7.0;

contract operadores {

    // Operadores matematicos
    uint num_1 = 32;
    uint num_2 = 4;

    uint public suma = num_1 + num_2;
    uint public resta = num_1 - num_2;
    uint public division = num_1 / num_2;
    uint public multiplicacion = num_1 * num_2;
    uint public modulo = num_1 % num_2;
    uint public exponente = num_1 ** num_2;

    // Comparar enteros
    uint num_3 = 3;
    uint num_4 = 3;

    bool public mayor = num_1 > num_2;
    bool public menor = num_1 < num_2;
    bool public igual = num_1 == num_2;
    bool public igual_t = num_3 == num_4;
    bool public diferente = num_1 != num_2;
    bool public mayor_igual = num_1 >= num_2;

    // Operadores boolenaos

    // Criterio de divisibilidad entre 5: si el numero termina en 0 o en 5

    function divisibilidad(uint _i) public pure returns(bool) {
        uint ultima_cifra = _i%10;

        if (ultima_cifra == 0 || ultima_cifra == 5) {
            return true;
        } else {
            return false;
        }
    }

    // Criterio de divisibilidad entre 5: si el numero no termina ni en 0 ni en 5

    function divisibilidadV2(uint _i) public pure returns(bool) {
        uint ultima_cifra = _i%10;

        if (ultima_cifra != 0 && ultima_cifra != 5) {
            return true;
        } else {
            return false;
        }
    }
}