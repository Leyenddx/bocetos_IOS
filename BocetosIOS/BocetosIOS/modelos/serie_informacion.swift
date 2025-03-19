//
//  aqui_guarda_sus_modelos.swift
//  BocetosIOS
//
//  Created by alumno on 3/14/25.
//
import Foundation

struct Temporada: Identifiable{
    var id = UUID()
    
    var nombre_temporada: String
    var cantidad_capotulos: Int
}

struct Plataforma: Identifiable{
    var id = UUID()
    
    var nombre_plataforma: String
    var icono: String
}

struct InformacionSerie: Identifiable{
    var id = UUID()
    
    var nombre:String
    var tipo:String
    var plataformas: [Plataforma] = [] // Aqui hay una deuda tecnica para indicar otras plataformas de forma mas facil.
    var fecha_estreno: Int
    var sinopsis: String
    var temporadas: [Temporada] = []
    var caratula: String
}
