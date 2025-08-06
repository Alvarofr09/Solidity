pragma solidity >=0.4.0 <0.7.0;

contract tiempo {
    // Unidades de tiempo

    // Tiempo actual del programa en milisegundos
    uint public tiempo_actual = now;
    // 1 Segundo
    uint public un_segundo = 1 seconds;
    // Cuantos segundos hay en X minutos
    uint public un_minuto = 1 minutes;
    // Cuantos segundos hay en X horas
    uint public dos_horas = 2 hours;
    // Cuantos segundos hay en X dias
    uint public cincuenta_dias = 50 days;
    // Cuantos segundos hay en X semanas
    uint public una_semana = 1 weeks;

    function MasSegundos() public view returns(uint){
        return now + 50 seconds;
    }

    function MasHoras() public view returns(uint){
        return now + 1 hours;
    }
}