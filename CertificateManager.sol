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
    mapping(string => Certificate) public certificates;
    
    // ------------------------------------ Constructor ------------------------------------
    // Uso: Inicializa el Smart Contract -> CertificateManager con: entidad emisora, titulación, alumno, calificación y año de obtención
    constructor() public {
    
    // Inicialización de algunos certificados de ejemplo
    certificates["Vitalik Butherin"] = Certificate("Universidad Europea de Madrid", "Vitalik Butherin", "Experto universitario en blockchain", 70, 2015, true);
    certificates["Elon Musk"] = Certificates("Universidad Europea de Madrid", "Elon Musk", "Ingenieria aeronautica", 45, 2019, false);
  }
    
    // Función para crear un ceertificado
    function createCertificate(string, string, string, uint, uint, bool) public {
    
    //Verificación de que no existe un certificado para el estudiante
    require(certificates[_student].student == string(0), "Ya existe un certificado para este curso y estudiante");
    
    //Creación del certificado
    certificates[_student] = Certificate(_entity, _course, _student, _grade, _year, false);
  }
  
  // Método para verificar un certificado
  function verifyCertificate(string _student) public {
    //Verficiación de que existe un certificado para el estudiante
    require(certificates[_student].student != string(0), "No existe un certificado para este estudiante");
    
    //Verificación del certificado 
    certificates[_student].verified = true;
    }
    
    // Método para obtener la información de un certificado
    function getCertificate(string _student) public view returns (string, string, string, uint, uint, bool) {
        // Verificación de que existe un certificado para el estudiante
        require(certificates[_student].student != bytes32(0), "No existe un certificado para este estudiante");

        // Devolución de la información del certificado
        return (certificates[_student].student, certificates[_student].course, certificates[_student].grade, certificates[_student].verified);
    }
}

