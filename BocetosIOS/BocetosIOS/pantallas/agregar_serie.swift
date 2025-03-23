//
//  agregar_serie.swift
//  BocetosIOS
//
//  Created by alumno on 3/19/25.
//

import SwiftUI

struct AgregarSerie: View {
    @Environment(VistaModeloBasico.self) private var controlador
    
    
    @State var nombre_de_la_serie: String = ""
    @State var tipo_de_la_serie: String = ""
    @State var plataformas: [Plataforma] = [
        Plataforma(nombre_plataforma: "Hulu", icono: "Icono plus"),
    ]
    @State var indicar_problemas: Bool = false
    @State var mostrar_agregar_plataformas: Bool = false
    
    var body: some View {
        Text("Agregar serie")
        TextField("El nombre de la serie", text: $nombre_de_la_serie)
        if indicar_problemas{
            Text("Hay un problema con tu serie. No tiene nombre")
        }
        
        TextField("Tipo", text: $tipo_de_la_serie)
        
        Spacer()
        
        Text("Plataformas")
        ScrollView(.horizontal){
            HStack{
                ForEach(plataformas_agregadas){ plataforma in
                    Text(plataforma.nombre)
                }
            }
        }
        .sheet(isPresented: $mostrar_agregar_plataformas) {
            Text("Por favor agrega una plataforma")
            
            TextField("Nombre de la plataforma", text: $nombre_plataforma)
            TextField("Indica la imagen", text: $imagen_plataforma)
            
            ScrollView{
                VStack{
                    ForEach(plataformas){plataforma in
                        Text(plataforma.nombre).onTapGesture {
                            //plataforma_seleccionada = plataforma
                        }
                    }
                }
            }
            
            Button("Agregar plataforma"){
                if !nombre_plataforma.isEmpty && !imagen_plataforma.isEmpty {
                    let plataforma_nueva = Plataforma(nombre: nombre_plataforma, imagen: imagen_plataforma)
                    
                    //plataformas_agregadas.append(plataforma_seleccionada)
                    plataformas_agregadas.append(plataforma_nueva)
                    
                    nombre_plataforma = ""
                    imagen_plataforma = ""
                    
                    mostrar_agregar_plataformas.toggle()
                    
                }
            }
        }.presentationDetents([.medium, .large])
        
        
        Spacer()
        

        Button("Agregar Plataforam"){
            mostrar_agregar_plataformas = true
        }
        
        Spacer()
        
        Button("Agregar serie"){
            var serie_nueva = InformacionSerie(nombre: nombre_de_la_serie, tipo: tipo_de_la_serie, plataformas: plataformas_agregadas, fecha_estreno: 1, sinopsis: "¨Pues una aleatoria", caratula: "Foto chuchi piruchi" )
            
            indicar_problemas = !controlador.agregar_serie(serie: serie_nueva)
        }
        
        Spacer()
        Spacer()
    }
}



#Preview {
    AgregarSerie()
        .environment(VistaModeloBasico())
}
