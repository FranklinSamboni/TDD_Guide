//
//  Vowel.swift
//  MovieApp
//
//  Created by Franklin Samboni on 19/02/21.
//

import Foundation

class VowelCount {
    
    let InvalidSizeError = NSError(domain: "Longitud máxima de 10 caracteres", code: 0, userInfo: nil)
    
    public func count(input: String) throws -> Int {
        var count = 0
        input.forEach { $0.isVowel ? count += 1 : () }
        
        if input.count > 10 {
            throw InvalidSizeError
        }
        
        return count
    }
    
}
