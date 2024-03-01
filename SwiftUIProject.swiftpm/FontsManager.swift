//
//  Fonts.swift
//  SwiftUIProject
//
//  Created by ANNA ALICIA VASCONCELOS MILANI   on 01/03/24.
//

import Foundation
import SwiftUI
 
class FontsManager {
    static let shared = FontsManager()
    
    private init(){}
    
    func registerFont(name: String, withExtension: String) {
        let url = Bundle.main.url(forResource: name, withExtension: withExtension)! as CFURL
        CTFontManagerRegisterFontsForURL(url, CTFontManagerScope.process, nil)
    }
}

extension Font {
    static func customFont(size: CGFloat) -> Font {
        .custom("Rubik Bubbles", size: size)
    }
}
