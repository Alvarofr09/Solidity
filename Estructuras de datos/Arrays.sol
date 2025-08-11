pragma solidity >=0.4.0 <0.7.0;

contract Arrays {
    // Array de enteros de longitud fija 5
    uint[5] public array_enteros = [1,2,3];

    // Array de enteros de 32 bits de longitud fija 7
    uint32[7] public array_enteros_32_bits;

    // Array de string de longitud fija 15
    string [15] public array_strings;

    // Array de enteros de longitud dinámica
    uint [] public array_dinamico_enteros;

    struct Persona {
        string nombre;
        uint edad;
    }

    // Array dinamico de tipo Persona
    Persona [] public array_personas;

    function modificar_array() public {
        // Push solo se puede usar con dinamicos
        //array_dinamico_enteros.push(_numero);
        //array_personas.push(Persona(_nombre, _edad));
        array_enteros[3] = 56;
    }
}