//
//  CharacterExtension.swift
//  MovieApp
//
//  Created by Franklin Samboni on 19/02/21.
//

import Foundation

extension Character {
    
    var isVowel: Bool {
        let vowels = ["a","e","i","o","u"]
        return vowels.contains(String(self).lowercased())
    }
    
}
