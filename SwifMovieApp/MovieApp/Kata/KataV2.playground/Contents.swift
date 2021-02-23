import UIKit
import XCTest

// Realizar una función que cuente las vocales de un String de maximo 10 caracteres

// Escenarios:
// String vacio 0
// Numero de vocales
// Validar que con un string de mas de 10 caracteres retorne una excepción

class Vowel {
    
    let InvalidSizeError = NSError(domain: "Longitud máxima de 10 caracteres", code: 0, userInfo: nil)
    
    public func count(input: String) throws -> Int {
        
        if input.count > 10 {
            throw InvalidSizeError
        }
        
        var count = 0
        input.forEach { isVowel(character: $0) ? count += 1 : () }
        return count
    }
    
    private func isVowel(character: Character) -> Bool {
        let vowels = ["a","e","i","o","u"]
        return vowels.contains(String(character))
    }
}


class VowelTest: XCTestCase {
    
    func testVowelCount_ReturnZero_WhenEmptyInput() {
        //given
        let empty = ""
        
        //when
        let count = try! Vowel().count(input: empty)
        
        //then
        XCTAssertEqual(count, 0)
    }
    
    func testVowelCount_ReturnCorrectNumberOfVowels() {
        //give
        let string = "Hola mundo"
        
        //when
        let count = try! Vowel().count(input: string)
        
        //then
        XCTAssertEqual(count, 4)
    }
    
    func testVowelCount_ReturnExceptionWhenInputSizeIsMoreThan10Characters() {
        //given
        let string = "Una frase muy larga"
        
        //then
        XCTAssertThrowsError(try Vowel().count(input: string), "Debe lanzar una excepción")
    }
    
}

VowelTest.defaultTestSuite.run()
