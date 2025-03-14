//
//  vista_mode_basico.swift
//  BocetosIOS
//
//  Created by alumno on 3/14/25.
//

import Foundation

@Observable
class VistaModeloBasico{
    var series_registradas: Array<InformacionSerie> = []
    
    func agregar_serie() -> Void{
        print("Hola mundo desde el controlador")
        series_registradas.append(InformacionSerie(nombre: "Pureba", tipo: "Prueba", fecha_estreno: 2025, sinopsis: "Aqui va una sinopsis descriptiva", caratula: "imagen_fake_1"))
    }
}
