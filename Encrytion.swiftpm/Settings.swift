//
//  Settings.swift
//  Encrytion
//
//  Created by Lukas Maile on 09.11.23.
//

import Foundation

class Settings: ObservableObject{
    @Published var CaesersShift: Int
    @Published var CaesersAlphabet: Array<Any>
    
    init(CaesersShift: Int, CaesersAlphabet: Array<Any>) {
        self.CaesersShift = CaesersShift
        self.CaesersAlphabet = CaesersAlphabet
    }
}


