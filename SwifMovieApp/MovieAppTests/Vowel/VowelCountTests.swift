//
//  VowelTests.swift
//  MovieAppTests
//
//  Created by Franklin Samboni on 19/02/21.
//

import Foundation
import XCTest
@testable import MovieApp

class VowelCountTests: XCTestCase {
    
    func testVowelCount_ReturnZero_WhenEmptyInput() {
        //given
        let empty = ""
        
        //when
        let count = try! VowelCount().count(input: empty)
        
        //then
        XCTAssertEqual(count, 0)
    }
    
    func testVowelCount_ReturnCorrectNumberOfVowels() {
        //give
        let string = "Hola mundo"
        
        //when
        let count = try! VowelCount().count(input: string)
        
        //then
        XCTAssertEqual(count, 4)
    }
    
    func testVowelCount_ReturnExceptionWhenInputSizeIsMoreThan10Characters() {
        //given
        let string = "Una frase muy larga"
        
        //then
        XCTAssertThrowsError(try VowelCount().count(input: string), "Debe lanzar una excepción")
    }
    
}
