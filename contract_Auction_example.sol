// Versión de solidity del Smart Contract
// SPDX-License-Identifier: UNLICENSED

pragma solidity >= 0.8.0;

// Información del Smart Contract
// Nombre: Auction Example
// Logica: Implementa subasta de productos entre varios participantes

//Declaración del Smart Contract - Auction Example
contract AuctionExample {

        // ------------ Variables (datos) ---------------
        // Información de la subasta
        string public description;
        uint public basePrice;
        uint256 private secondToEnd;
        uint256 public createdTime;
        
        // Antiguo/nuevo dueño de subasta
        address payable public originalOwner;
        address public newOwner;
        
        // Puja más alta
        address payable public highestBidder;
        uint public highestPrice;
        
        // Estado de la subasta
        bool public activeContract;
        
        // ------------------ Eventos (pueden ser emitidos por el Smart Contract) --------------------------
        event Status(string _message);
        event Result(string _message, address winner);
        
        // Constructor
        // Uso: Inicializa el Smart Contract - Auction Example con: description, precio y tiempo
        constructor() public {
       
                // Inicializa el valor a las variables (datos)
                description = "En esta subasta se ofrece un coche. Se trata de un Benz Truck negro mate";
                basePrice = 0.01 ether;
                secondToEnd = 86400;
                activeContract = true;
                createdTime = block.timestamp;
                originalOwner = payable(msg.sender);
                
                // Se emite un Evento
                emit Status("Subasta creada");
                }
                
                
    // --------------------- Funciones que modifican datos (set) ------------------------------------
    
    // Funcion
    // Nombre: bid
    // Uso: Permite a cualquier postor hacer una oferta de dinero para la subasta
    //      El dinero es almacenado en el contrato, junto con el nombre del postor
    //      El postor cuya oferta ha sido superada recibe de vuelta el dinero pujado
    function bid() public payable {
        if(block.timestamp > (createdTime + secondToEnd) && activeContract == true){
                checkIfAuctionEnded();
       } else {
            if (msg.value > highestPrice && msg.value > basePrice){
            // Devuelve el dinero al ANTIGUO máximo postor
            highestBidder.transfer(highestPrice);
            
            // Actualiza el nombre y precio al NUEVO máximo postor
            highestBidder = payable(msg.sender);
            highestPrice = msg.value;
            
            // Se emite un evento
            emit Status("Nueva puja mas alta, el ultimo postor tiene su dinero de vuelta");
      } else {
            // Se emite un evento
            emit Status("La puja no es posible, no es lo suficientemente alta");
            revert();
            }
           }
}
                
// Funcion
// Nombre: checkIfAuctionEnded
// Uso: Comprueba si la puja ha terminado, y en ese caso,
//      transfiere el balance del contrato al propietario de la subasta
function checkIfAuctionEnded() public{
        if (block.timestamp > (createdTime + secondToEnd)){
                // Finaliza la subasta
                activeContract = false;
                
        // Transfiere dinero (maxima puja) al propietario original de la subasta
        newOwner = highestBidder;
        originalOwner.transfer(highestPrice);
        
        // Se emiten varios eventos
        emit Status("La subasta ha finalizado");
        emit Result("El ganador de la subasta ha sido:", highestBidder);
  } else{
  revert();
  }
}

// -------------------------- Funciones de panico/emergencia ----------------------------------------------

// Funcion
// Nombre: stopAuction
// Uso: Para la subasta y devuelve el dinero al maximo postor
function stopAuction() public{
        require(msg.sender == originalOwner);
        // Finaliza la subasta
        activeContract = false;
        //Devuelve el dinero almaximo postor
        highestBidder.transfer(highestPrice);
        
        // Se emite un evento
        emit Status("La subasta se ha parado");
     }
     
// ------------------------- Funciones que consultan datos (get) ------------------------------------------

// Funcion
// Nombre: getAuctionInfo
// Logica: Consulta la description, y la fecha de creacion de la subasta
function getAuctionInfo() public view returns (string memory, uint){
        return (description, createdTime);
        }
        
 // Funcion
 // Nombre: getHighestPrice
 // Logica: Consulta el precio de la maxima puja
 function getHighestPrice() public view returns (uint){
 return (highestPrice);
 }
  // Funcion
    // Nombre: getHighestBidder
    // Logica: Consulta el maximo pujador de la subasta
    function getHighestBidder() public view returns (address){
        return (highestBidder);
    }

    // Funcion
    // Nombre: getDescription
    // Logica: Consulta la descripcion de la subasta
    function getDescription() public view returns (string memory){
        return (description);
    }

    // Funcion
    // Nombre: getBasePrice
    // Logica: Consulta el precio inicial de la subasta
    function getBasePrice() public view returns (uint256){
        return (basePrice);
    }

    // Funcion
    // Nombre: getActiveContract
    // Logica: Consulta si la subasta esta activa o no
    function isActive() public view returns (bool){
        return (activeContract);
    }
}
