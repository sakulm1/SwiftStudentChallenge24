//
//  CaesarView.swift
//  Encrytion
//
//  Created by Lukas Maile on 09.11.23.
//

import Foundation
import SwiftUI

@available(iOS 17.0, *)
struct CaesarView: View {
    @EnvironmentObject var settings: Settings
    let encrypter = Caesar()
    @State var disk = Disk()
    @State var text: String
    @State var encrypted: String?
    var body: some View {
        VStack {
            VStack{
                Text(String(settings.CaesersShift == 26 ? 0 : settings.CaesersShift))
                    .font(.title)
                    .onChange(of: settings.CaesersShift){
                        encrypted = encrypter.encrypt(text: text, shift: settings.CaesersShift)
                    }
                Text("Caesar Cipher")
                    .font(.largeTitle)
                disk
            }
            .onAppear(){
                encrypted = encrypter.encrypt(text: text, shift: settings.CaesersShift)
            }
            
            Spacer()
            HStack{
                Text("Encryptet text: ")
                    .controlSize(.large)
                Text(encrypted ?? "")
                    .foregroundStyle(.blue)
                    .controlSize(.large)
            }
            HStack{
                TextField("Input", text: $text)
                    .disableAutocorrection(true)
                    .border(.secondary)
                    .onSubmit {
                        encrypted = encrypter.encrypt(text: text, shift: settings.CaesersShift)
                    }
            }.padding(50)
            Spacer()
        }
    }
}


