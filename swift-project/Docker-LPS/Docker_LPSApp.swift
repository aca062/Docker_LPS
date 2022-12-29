//
//  Docker_LPSApp.swift
//  Docker-LPS
//
//  Created by Aula11 on 14/12/22.
//

import SwiftUI

@main
struct Docker_LPSApp: App {
    @State var login : Bool = false
    @State var sectionedArray : [[Nota]] = [[Nota]]()
    @State var tipo : String = ""
    
    var body: some Scene {
        WindowGroup {
            if (!login) {
                Login(tipo: $tipo, login: $login, sectionedArray: $sectionedArray)
            }else {
                Notas(array: $sectionedArray, tipo: $tipo, login: $login)
            }
        }
    }
}

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}
