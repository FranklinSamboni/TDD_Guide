import UIKit
import XCTest

// Realizar una función que cuente las vocales de un String de maximo 10 caracteres

// Escenarios:
// String vacion 0
// Numero de vocales
// Validar que con un string de mas de 10 caracteres retorne una excepción

class Vowel {
    
    let InvalidSizeError = NSError(domain: "Longitud invalida", code: 0, userInfo: nil)
    
    public func count(input: String) throws -> Int {
        
        if input.count > 10 {
            throw InvalidSizeError
        }
        
        var count = 0
        input.forEach { isVowel(letter: $0) ? count += 1 : ()  }
        return count
    }
    
    private func isVowel(letter: Character) -> Bool {
        let vowels = ["a","e","i","o","u"]
        return vowels.contains(String(letter).lowercased())
    }
}

class VowelTest: XCTestCase {
    
    func testVowelCount_IsZero_WhenEmptyInput() {
        //given
        let empty = ""
        
        //when
        let count = try! Vowel().count(input: empty)
        
        //then
        XCTAssertEqual(count, 0)
    }
    
    func testVowelCount_IsCountCorrectly() {
        // given
        let string = "Hola mundo"
        
        //when
        let count = try! Vowel().count(input: string)
        
        //then
        XCTAssertEqual(count, 4)
    }
    
    func testVowelCount_ReturnExceptionWhenStringSizeIsMoreThan10Characters() {
        //given
        let string = "una frase demasiado larga"
        
        //when
        XCTAssertThrowsError(try Vowel().count(input: string), "Deberia mostrar una excepcion")
    }
}


VowelTest.defaultTestSuite.run()

/*
public func countVowel(input: String) -> Int {
    return 0
}

class VowelTest: XCTestCase {
    
    override class func setUp() {
        super.setUp()
    }
    
    func testCountVowel_IsZeroWhenEmptyInput() {
        //Given
        let input = ""
        
        //when
        let count = countVowel(input: input)
        
        //then
        XCTAssertEqual(count, 0)
    }
}


*/
