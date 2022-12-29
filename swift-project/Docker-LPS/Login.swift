//
//  ContentView.swift
//  Prueba
//
//  Created by Aula11 on 4/11/22.
//

import SwiftUI

struct Login: View {
    @State var user : String = ""
    @State var password : String = ""
    @State var fallo : Bool = false
    @Binding var tipo : String
    @Binding var login : Bool
    @Binding var sectionedArray : [[Nota]]
    
    var body: some View {
        Image("umu").resizable().frame(width: 220.0, height: 220.0)
        Text("UM - Sistema de notas").font(.largeTitle).bold().multilineTextAlignment(.center)
        TextField("Usuario", text: $user).autocapitalization(.none).padding().textFieldStyle(.roundedBorder).disableAutocorrection(true)
        SecureField("Contraseña", text: $password).autocapitalization(.none).padding().textFieldStyle(.roundedBorder)
        if (fallo) {
            Text("El usuario o contraseña introducidos son incorrectos").padding().foregroundColor(.red).font(.system(size: 10)).multilineTextAlignment(.center)
        }
        Button() {
            login(user: user, password: password)
        } label: {
            Text("Iniciar sesión")
        }.buttonStyle(BlueButton()).padding()
    }
    
    private func getTipo() -> String {
        let myURLString = "http://34.140.126.51"
        guard let myURL = URL(string: myURLString) else {
            return "Error: \(myURLString) doesn't seem to be a valid URL"
        }
        do {
            let myHTMLString = try String(contentsOf: myURL, encoding: .ascii)
            if (myHTMLString.contains("profesores")) {
                return "profesores";
            }else {
                return "alumnos";
            }
        } catch let error {
            return "Error: \(error)"
        }
    }
    
    private func login(user : String, password : String){
        fallo = false
        guard let url = URL(string: "http://34.140.126.51/login?usuario=\(user)&contrasena=\(password)") else {
            fallo = true
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                fallo = true
                return
            }
            let decodedData = try! JSONDecoder().decode([Nota].self, from: data)
            if (getTipo() == "profesores") {
                let sections = Set<String>(decodedData.map { $0.nombre_alumno })
                for section in sections {
                    let nota = decodedData.filter { $0.nombre_alumno == section }
                    sectionedArray.append(nota)
                }
            }else if (getTipo() == "alumnos") {
                let sections = Set<String>(decodedData.map { $0.asignatura })
                for section in sections {
                    let nota = decodedData.filter { $0.asignatura == section }
                    sectionedArray.append(nota)
                }
            }
            if (sectionedArray.isEmpty) {
                fallo = true
            } else {
                tipo = getTipo()
                login = true
            }
        }.resume()
    }
}

struct Nota : Decodable, Hashable {
    var id : String = UUID().uuidString
    var asignatura: String
    var parcial_1: Int
    var parcial_2: Int
    var final: Int
    var nombre_alumno: String
    var nombre_profesor: String
    
    enum CodingKeys: String, CodingKey {
        case asignatura
        case parcial_1
        case parcial_2
        case final
        case nombre_alumno
        case nombre_profesor
    }
}
