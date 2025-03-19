//
//  vista_mode_basico.swift
//  BocetosIOS
//
//  Created by alumno on 3/14/25.
//

import Foundation

@Observable
class VistaModeloBasico{
    var estado_actual_de_la_aplicacion: EstadosDeLaAplicacion = .mostrando_serie
    var series_registradas: Array<InformacionSerie> = []
    
    func agregar_serie(serie: InformacionSerie? = nil) -> Bool{
        if let serie_nueva = serie{
            if serie_nueva.nombre == ""{
                return false
            }
            
            series_registradas.append(serie_nueva)
        }
        else{
            series_registradas.append(InformacionSerie(nombre: "Pureba", tipo: "Prueba", fecha_estreno: 2025, sinopsis: "Aqui va una sinopsis descriptiva", caratula: "imagen_fake_1"))
        }
        
        return true
    }
}
