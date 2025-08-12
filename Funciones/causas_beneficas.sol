pragma solidity >=0.4.0 <0.7.0;

contract causas_beneficas {
    struct Causa {
        uint ID;
        string nombre;
        uint precio_objetivo;
        uint cantidad_recaudada;
    }

    uint contador_causas = 0;
    mapping (string => Causa) causas;

    // Funcion que permite dar de alta una nueva causa
    function nuevaCausa(string memory _nombre, uint _precio_objetivo) public {
        //Causa memory newCausa = Causa(contador_causas, _nombre, _precio_objetivo, 0);
        // causas[_nombre] = newCausa;
        causas[_nombre] = Causa(contador_causas, _nombre, _precio_objetivo, 0);
        contador_causas = contador_causas++;
    }

    // Esta funcion nos devuelve true en el caso que podamos donar a una causa
    function objetivoCumplido(string memory _nombre, uint _donar) private view returns(bool) {
        bool flag = false;
        Causa memory causa = causas[_nombre];
        if(causa.precio_objetivo >= (causa.cantidad_recaudada + _donar)) {
            flag = true;
        }
        return flag;
    }

    // Esta funcion nos permite donar a una causa
    function donar (string memory _nombre, uint _dinero) public payable returns(bool) {
        bool aceptar_donacion = true;

        if(objetivoCumplido(_nombre, _dinero)) {
            causas[_nombre].cantidad_recaudada += _dinero;
        } else {
            aceptar_donacion = false;
        }

        return aceptar_donacion;
    }

    // Esta funcion nos dice si hemos llegado al precio objetivo
    function comprobar_causa(string memory _nombre) public view returns(bool, uint) {
        bool limite_alcanzado = false;
        Causa memory causa = causas[_nombre];
        if (causa.cantidad_recaudada >= causa.precio_objetivo) {
            limite_alcanzado = true;
        }

        return (limite_alcanzado, causa.cantidad_recaudada);
    }
}