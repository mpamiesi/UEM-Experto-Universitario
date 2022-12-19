// Versión de solidity del Smart Contract
// SPDX-License-Identifier: UNLICENSED

pragma solidity >= 0.8.0;

// Información del Smart Contract
// Nombre: Certificate Manager
// Logica: Crea y administra certificados académicos

contract CertificateManager {

    // ------------------------------------ Variables (datos) ------------------------------------
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
    
    // Aprobado
    bool public pass;
    
    // ------------------------------------ Mapeo de certificados por nombre del estudiante ------------------------------------
    mapping (string => Certificate) public certificates;
    
    // ------------------------------------ Constructor ------------------------------------
    // Uso: Inicializa el Smart Contract -> CertificateManager con: entidad emisora, titulación, alumno, calificación y año de obtención
    constructor() public {
    
    // Inicialización de algunos certificados de ejemplo
    certificates["Vitalik Butherin"] = Certificate("Universidad Europea de Madrid", "Vitalik Butherin", "Experto universitario en blockchain", 70, 2015, true);
    certificates["Elon Musk"] = Certificates("Universidad Europea de Madrid", "Elon Musk", "Ingeniería aeronáutica", 45, 2019, false);
   };
    
    
