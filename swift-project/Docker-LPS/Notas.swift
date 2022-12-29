//
//  Notas.swift
//  Docker-LPS
//
//  Created by Aula11 on 14/12/22.
//

import SwiftUI

struct Notas: View {
    @Binding var array : [[Nota]]
    @Binding var tipo : String
    @Binding var login: Bool
    var body: some View {
        ScrollView {
            VStack {
                if (tipo == "profesores") {
                    Text("")
                    Text("")
                    Text("")
                    Text("Hola, " + array.first!.first!.nombre_profesor).font(.headline)
                    Text("Estas son las notas de los alumnos de " + array.first!.first!.asignatura).multilineTextAlignment(.center)
                    Divider()
                    ForEach(array, id: \.self) { arr in
                        ForEach(arr, id: \.self) { nota in
                            Divider()
                            Text("Alumno: \(nota.nombre_alumno)").font(.headline)
                            Text("Primer parcial: \(nota.parcial_1)")
                            Text("Segundo parcial: \(nota.parcial_2)")
                            Text("Final: \(nota.final)")
                            Divider()
                        }
                    }
                    Divider()
                } else if (tipo == "alumnos") {
                    Text("")
                    Text("")
                    Text("")
                    Text("Hola, " + array.first!.first!.nombre_alumno).font(.headline)
                    Text("Estas son tus notas").multilineTextAlignment(.center)
                    Divider()
                    ForEach(array, id: \.self) { arr in
                        ForEach(arr, id: \.self) { nota in
                            Divider()
                            Text("Asignatura: \(nota.asignatura)").font(.headline)
                            Text("Profesor: \(nota.nombre_profesor)")
                            Text("Primer parcial: \(nota.parcial_1)")
                            Text("Segundo parcial: \(nota.parcial_2)")
                            Text("Final: \(nota.final)")
                            Divider()
                        }
                    }
                    Divider()
                }
                Button() {
                    login = false
                } label: {
                    Text("Cerrar sesión")
                }.buttonStyle(BlueButton())
            }
        }.onDisappear() {
            array = [[Nota]]()
        }
    }
}
