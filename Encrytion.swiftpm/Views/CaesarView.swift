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
                Text(String(settings.CaesersShift))
                    .font(.title)
                Text("Caesar Cipher")
                    .font(.largeTitle)
                disk
            }
            
            Spacer()
            Text("Hello, world! This is the CaesarView")
                .controlSize(.large)
            Text(encrypted ?? "")
            HStack{
                TextField("Input", text: $text)
                    .disableAutocorrection(true)
                    .border(.secondary)
                    .onChange(of: encrypted){ newValue in
                        encrypted = encrypter.encrypt(text: text, shift: settings.CaesersShift)
                        }
                Button("Encrypt"){
                    encrypted = encrypter.encrypt(text: text, shift: settings.CaesersShift)
                }
            }.padding(50)
            Spacer()
            
        }
    }
}
