pragma solidity >=0.4.0 <0.7.0;

contract casteo {
    // Ejemplos de casteo

    uint8 entero_8_bytes = 42;
    uint64 entero_64_bytes = 60000;
    uint entero_256_bytes = 1000000;
    int16 entero_16_bytes = 156;
    int120 entero_120_bytes = 900000;
    int entero = 5000000;

    // Caste de variables
    uint64 public casteo_1 = uint64(entero_8_bytes);
    uint64 public casteo_2 = uint64(entero_256_bytes);
    uint8 public casteo_3 = uint8(entero_16_bytes);
    int public casteo_4 = int(entero_120_bytes);
    int public casteo_5 = int(entero_256_bytes);

    function convertir(uint8 _k) public pure returns(uint64) {
        return uint64(_k);
    }
}