// Versión de solidity del Smart Contract
// SPDX-License-Identifier: UNLICENSED

pragma solidity >= 0.8.0;

// Información del Smart Contract
// Nombre: Certificate Manager
// Logica: Crea y administra certificados académicos

contract CertificateManager {

    // ------------------------- Variables (datos) -------------------------------
    // Información del certificado
    
    //Entidad emisora
    string public entity; 
    
    // Nombre titulación
    string public course; 
    
    // Nombre y apellidos estudiante
    string public student; 
    
    // Calificación obtenida
    uint public grade; 
    
    // Año de obtención
    uint public year;
   };
    
