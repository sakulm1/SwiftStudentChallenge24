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
            caesarDisk(offset: -350, turning: false, radius: 770) // Generiert den Äußeren Kreis
            caesarDisk(offset: -290, turning: true, radius: 646) // Generiert den Inneren Kreis
        }
    }
    
    @available(iOS 17.0, *)
    var rotation: some Gesture {
            RotateGesture()
                .onChanged { value in
                    //angle = value.rotation
                    let currentChar = value.rotation / 13.8461538

                    print(Int(currentChar.degrees))
                    
                    settings.CaesersShift = Int(currentChar.degrees).signum() == 1 ? Int(currentChar.degrees) : Int(currentChar.degrees) + 26

                    angle = Angle(degrees: Double(Int(currentChar.degrees)) * 13.8461538)
                }
        }
    
    
    @available(iOS 17.0, *)
    func caesarDisk(offset: Int, turning: Bool, radius: CGFloat) -> some View{
        return AnyView(
            ZStack{
                Circle()
                    .strokeBorder(Color.black, lineWidth: 3)
                    //.padding(cOffset)
                    .frame(width: radius, height: radius)
                    .rotationEffect(turning == true ? angle : Angle(degrees: 0.0))
                    .gesture(rotation)
                Circle()
                    .fill(.white)
                    .frame(width: radius - 250, height: radius - 250)
                    .opacity(turning ? 0 : 1)
                
                CurvedLine(from: CGPoint(x: 50, y: 50),
                                       to: CGPoint(x: 300, y: 300),
                                       control: CGPoint(x: 50, y: 300))
                                .stroke(Color.blue, lineWidth: 4)
                    
                           
                ForEach(0..<26) { index in
                    let angle = Angle(degrees: Double(index) * (360 / Double(alphabet.count)))
                    let character = String(alphabet[alphabet.index(alphabet.startIndex, offsetBy: index)])
                    Text(character)
                        .rotationEffect(-angle) // Dreht den Buchstaben zurück, damit er aufrecht steht
                        .offset(y: CGFloat(offset)) // Positioniert den Buchstaben auf dem Rand des Kreises
                        .rotationEffect(angle) // Rotiert den Buchstaben um den Kreis
                }
            }
                .rotationEffect(turning == true ? angle : Angle(degrees: 0.0))
                .gesture(rotation)
        )
    }
}

struct CurvedLine: Shape {
    let from: CGPoint
    let to: CGPoint
    var control: CGPoint
    
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get {
            AnimatablePair(control.x, control.y)
        }
        set {
            control = CGPoint(x: newValue.first, y: newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: from)
        path.addQuadCurve(to: to, control: control)
        
        let angle = atan2(to.y - control.y, to.x - control.x)
        let arrowLength: CGFloat = 15
        let arrowPoint1 = CGPoint(x: to.x - arrowLength * cos(angle - .pi / 6), y: to.y - arrowLength * sin(angle - .pi / 6))
        let arrowPoint2 = CGPoint(x: to.x - arrowLength * cos(angle + .pi / 6), y: to.y - arrowLength * sin(angle + .pi / 6))
        
        path.move(to: to)
        path.addLine(to: arrowPoint1)
        path.move(to: to)
        path.addLine(to: arrowPoint2)
        
        return path
    }
}

