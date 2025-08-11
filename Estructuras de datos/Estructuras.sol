pragma solidity >=0.4.0 <0.7.0;

contract Estructuras {

    // Cliente de una pagina wen
    struct Cliente {
        uint id;
        string nombre;
        string dni;
        string mail;
        uint phone_number;
        uint credit_number;
        uint secret_number;
    }

    // Declaracion de avriable de tipo Cliente
    Cliente cliente_1 = Cliente(1, "Alvaro", "12345678D","alvaro@gmail.com", 123456789, 1234, 111);

    // Amazon (o cualquier pagina similar)
    struct Producto {
        string nombre;
        uint precio;
    }

    Producto producto_1 = Producto("Coche", 10000);

    // Proyecto coop de ONG
    struct ONG {
        address ong;
        string nombre;

    }

    ONG ong_1 = ONG(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, "Caritas");

    struct Causa {
        uint id;
        string nombre;
        uint precio_objetivo;
    }

    Causa causa_1 = Causa(1, "Causa 1", 10000);
}