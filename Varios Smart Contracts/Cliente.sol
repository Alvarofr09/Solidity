pragma solidity >=0.4.0 <0.7.0;
//import "./Banco.sol"; Importar todos los contratos
import {Banco} from "./Banco.sol"; // Importar los contratos que queramos del archivo

contract Cliente is Banco {
    function AltaCliente(string memory _nombre) public {
        nuevoCliente(_nombre);
    }

    function IngresarDinero(string memory _nombre, uint dinero) public {
        clientes[_nombre].dinero = clientes[_nombre].dinero + dinero;
    }

    function RetirarDinero(string memory _nombre, uint dinero) public returns(bool) {
        bool flag = true;

        if (int(clientes[_nombre].dinero) - int(dinero) >= 0) {
            clientes[_nombre].dinero = clientes[_nombre].dinero - dinero;
        } else {
            flag = false;
        }

        return flag;
    }

    function COnsultarDinero (string memory _nombre) public view returns (uint) {
        return clientes[_nombre].dinero;
    }
}