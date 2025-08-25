pragma solidity >=0.4.0 <0.7.0;
pragma experimental ABIEncoderV2;

contract view_pure_payable {
    // Modificador view (Solo permite leer datos, NO modificar)
    string[] list_alumnos;
    
    function add_Alumno(string memory _nombre) public {
        list_alumnos.push(_nombre);
    }

    function ver_Alumno(uint _index) public view returns(string memory) {
        return list_alumnos[_index];
    }

    uint x = 10;
    function sumarAx(uint _num) public view returns(uint) {
        return x + _num;
    }

    // Modificador pure 
    function exponenciar(uint _num1, uint _num2) public pure returns (uint) {
        return _num1 ** _num2;
    }

    // Modificador payable (Nos permiten recibir ether

    mapping (address => cartera) public cartera_usuarios;

    struct cartera {
        string nombre;
        address direccion;
        uint dinero;
    }

    function Pagar(string memory _nombrePersona, uint _cantidad) public payable {
        cartera memory mi_cartera;
        mi_cartera = cartera(_nombrePersona, msg.sender, _cantidad);
        cartera_usuarios[msg.sender] = mi_cartera;
    }

    function verSaldo() public view returns(cartera memory) {
        return cartera_usuarios[msg.sender];
    }


}