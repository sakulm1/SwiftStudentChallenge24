//
//  Caesar.swift
//  Encrytion
//
//  Created by Lukas Maile on 09.11.23.
//

import Foundation
import SwiftUI


struct Caesar{
    let alphabet = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    
    func encrypt(text: String, shift: Int) -> String{
        var encryptedText = ""
        for char in text.uppercased() {
            if let index = alphabet.firstIndex(of: char) {
                let shiftedIndex = (index + shift) % 26
                encryptedText += String(alphabet[shiftedIndex])
            } else {
                encryptedText += String(char)
            }
        }
        return encryptedText
    }
    
    func decrypt(text: String, shift: Int) -> String{
        var decryptedText = ""
        for char in text.uppercased() {
            if let index = alphabet.firstIndex(of: char) {
                let shiftedIndex = (index - shift + 26) % 26
                decryptedText += String(alphabet[shiftedIndex])
            } else {
                decryptedText += String(char)
            }
        }
        
        return decryptedText
    }
}

