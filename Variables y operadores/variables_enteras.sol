pragma solidity >=0.4.0 <0.7.0;

// Enteros
// Numeros negativos y positivos - int

// Especificar numero de bits de los enteros
// uint<x> (x = 8 - 256(en multiples de 8))
// int<x> (x = 8 - 256(en multiples de 8))

contract enteros {
    // Enteros sin signo
    uint mi_primer_entero = 3;

    // Enteros sin signo con numero de bits
    uint8 entero_8_bits = 255; // Maximo valor posible para un entero de 8 bits
    // uint = uint256

    // Enteros con signo
    int mi_primer_entero_con_signo = -32;
    int mi_numero2 = 65;

    // Enteros con signo con numero de bits
    int8 entero_con_signo_8_bits = 127; // Maximo valor posible para un entero de 8 bits con signo
    int72 entero_con_signo_72_bits;
}