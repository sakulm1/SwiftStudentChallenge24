//
//  Disk.swift
//  Encrytion
//
//  Created by Lukas Maile on 09.11.23.
//

import Foundation
import SwiftUI

@available(iOS 17.0, *)
struct Disk: View {
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    @State private var angle = Angle(degrees: 0.0)
    @EnvironmentObject var settings: Settings


    var body: some View {
        ZStack{
            caesarDisk(offset: -350, cOffset: 50, turning: false) // Generiert den Äußeren Kreis
            caesarDisk(offset: -290, cOffset: 100, turning: true) // Generiert den Inneren Kreis
                .shadow(radius: 10)
        }
    }
    
    @available(iOS 17.0, *)
    var rotation: some Gesture {
            RotateGesture()
                .onChanged { value in
                    let currentChar = value.rotation / 13.8461538
                    settings.CaesersShift = Int(currentChar.degrees).signum() == 1 ? Int(currentChar.degrees) : Int(currentChar.degrees) + 26
                    angle = Angle(degrees: Double(Int(currentChar.degrees)) * 13.8461538)
                }
        }
    
    
    @available(iOS 17.0, *)
    func caesarDisk(offset: Int, cOffset: CGFloat, turning: Bool) -> some View{
        return AnyView(
            ZStack{
                Circle()
                    .strokeBorder(Color.black, lineWidth: 3)
                    .padding(cOffset)
                           
                ForEach(0..<26) { index in
                    let angle = Angle(degrees: Double(index) * (360 / Double(alphabet.count)))
                    let character = String(alphabet[alphabet.index(alphabet.startIndex, offsetBy: index)])
                    Text(character)
                        .rotationEffect(-angle) // Dreht den Buchstaben zurück, damit er aufrecht steht
                        .offset(y: CGFloat(offset)) // Positioniert den Buchstaben auf dem Rand des Kreises
                        .rotationEffect(angle) // Rotiert den Buchstaben um den Kreis
                }
//                Circle()
//                    .padding(410)
            }
                .rotationEffect(turning == true ? angle : Angle(degrees: 0.0))
                .gesture(rotation)
        )
    }
}


