//
//  HorizontalImagesViewControllerTests.swift
//  MovieAppTests
//
//  Created by Franklin Samboni on 23/02/21.
//

import Foundation
import XCTest
@testable import MovieApp

class HorizontalImagesViewControllerTests: XCTestCase {
    
    func testNumberOfSections_IsEqualToOne() {
        //given
        let vc = getSut(images: [])
        //then
        XCTAssertEqual(vc.collectionView.dataSource?.numberOfSections?(in: vc.collectionView), 1)
    }

    func testNumberOfItemsInSection_IsEqualToNumerOfImages() {
        let images: [String] = ["image1", "imagen2"]
        let vc = getSut(images: images)

        //then
        XCTAssertEqual(vc.collectionView.dataSource?.collectionView(vc.collectionView, numberOfItemsInSection: 0), images.count)
    }
    
    func testCellImage_IsCorrectlySetup() {
        let images: [String] = ["testImage", "imagen2"]
        let vc = getSut(images: images)
        
        //then
        let position = IndexPath(item: 0, section: 0)
        let cell = vc.collectionView.dataSource?.collectionView(vc.collectionView, cellForItemAt: position) as! ImageCellCollectionViewCell
        
        XCTAssertEqual(cell.image.image, UIImage(named: images[0]))
    }
    
    func testDidTap_IsDetected() {
        let images: [String] = ["testImage"]
        var count = 0
        
        let vc = getSut(images: images) {
            count += 1
        }
        
        //then
        vc.collectionView.delegate?.collectionView?(vc.collectionView, didSelectItemAt: IndexPath(row:0, section: 0))
        XCTAssertEqual(count, 1)
    }
    
    //MARK: Helpers
    func getSut(images: [String], onItemTap: (() -> Void)? = nil) -> HorizontalImagesViewController {
        var vc: HorizontalImagesViewController!
        
        if onItemTap != nil {
            vc = HorizontalImagesViewController(images: images, onItemTap: onItemTap!)
        } else {
            vc = HorizontalImagesViewController(images: images) {}
        }

        let _ = vc.view
        
        return vc
    }
}
