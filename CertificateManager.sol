pragma solidity ^0.7.0;

contract CertificateManager {
    // Declaración de variables
    struct Certificate {
        bytes32 student; // Nombre del estudiante
        bytes32 course; // Nombre del curso
        uint grade; // Calificación obtenida
        bool verified; // Verificación del certificado
    }

    mapping(bytes32 => Certificate) public certificates; // Mapeo de certificados por nombre del estudiante

    // Constructor para inicializar el contrato
    constructor() public {
        // Inicialización de algunos certificados de ejemplo
        certificates["Juan Pérez"] = Certificate("Juan Pérez", "Curso de programación", 90, true);
        certificates["Ana Martínez"] = Certificate("Ana Martínez", "Curso de matemáticas", 80, true);
    }

    // Método para crear un certificado
    function createCertificate(bytes32 _student, bytes32 _course, uint _grade) public {
        // Verificación de que no existe un certificado para el estudiante
        require(certificates[_student].student == bytes32(0), "Ya existe un certificado para este estudiante");

        // Creación del certificado
        certificates[_student] = Certificate(_student, _course, _grade, false);
    }

    // Método para verificar un certificado
    function verifyCertificate(bytes32 _student) public {
        // Verificación de que existe un certificado para el estudiante
        require(certificates[_student].student != bytes32(0), "No existe un certificado para este estudiante");

        // Verificación del certificado
        certificates[_student].verified = true;
    }

    // Método para obtener la información de un certificado
    function getCertificate(bytes32 _student) public view returns (bytes32, bytes32, uint, bool) {
        // Verificación de que existe un certificado para el estudiante
        require(certificates[_student].student != bytes32(0), "No existe un certificado para este estudiante");

        // Devolución de la información del certificado
        return (certificates[_student].student, certificates[_student].course, certificates[_student].grade, certificates[_student].verified);
    }
}
