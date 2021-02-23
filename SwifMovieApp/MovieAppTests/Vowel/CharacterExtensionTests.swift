//
//  CharacterExtensionTests.swift
//  MovieAppTests
//
//  Created by Franklin Samboni on 19/02/21.
//

import Foundation
import XCTest
@testable import MovieApp

class CharacterExtensionTests: XCTestCase {
    
    func testIsVowel_ReturnFalse_WhenIsNotVowel() {
        XCTAssertEqual(Character("s").isVowel, false)
    }
    
    func testIsVowel_ReturnTrue_WhenIsLowecaseVowel() {
        XCTAssertEqual(Character("a").isVowel, true)
    }
    
    func testIsVowel_ReturnTrue_WhenIsUppercaseVowel() {
        XCTAssertEqual(Character("A").isVowel, true)
    }
    
    func testIsVowelFuntion_IsCorrectlySetup() {
        XCTAssertEqual(Character("s").isVowel, false)
        XCTAssertEqual(Character("a").isVowel, true)
        XCTAssertEqual(Character("A").isVowel, true)
    }
    
}
