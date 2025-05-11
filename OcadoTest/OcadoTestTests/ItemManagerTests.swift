//
//  ItemManagerTests.swift
//  OcadoTestTests
//
//  Created by Vladyslav Dikhtiaruk on 11/05/2025.
//

import XCTest
@testable import OcadoTest

final class ItemManagerTests: XCTestCase {
    var manager: ItemManager!
    
    override func setUpWithError() throws {
        manager = ItemManager()
    }
    
    override func tearDownWithError() throws {
        manager = nil
    }
    
    func test_ItemManager_parseItems_validJSON_returnsParsedItems() throws {
        // Given
        let jsonString = """
           {
               "items": [
                   {
                       "productId": "1",
                       "description": "Apple Juice",
                       "price": "2.99 £",
                       "promotions": [],
                       "isFavorite": false,
                       "inStock": 20,
                       "image": "applejuice",
                       "quantity": 0
                   },
                   {
                       "productId": "2",
                       "description": "Orange Juice",
                       "price": "3.49 £",
                       "promotions": [],
                       "isFavorite": true,
                       "inStock": 15,
                       "image": "orangejuice",
                       "quantity": 7
                   }
               ]
           }
           """
        let jsonData = Data(jsonString.utf8)
        
        // When
        let result = try manager.parseItems(from: jsonData)
        
        // Then
        XCTAssertEqual(result.count, 2)
        XCTAssertEqual(result[0].description, "Apple Juice")
        XCTAssertEqual(result[1].description, "Orange Juice")
        XCTAssertTrue(result[1].isFavorite)
    }
    
    func test_ItemManager_parseItems_invalidJSON_throwsDecodingError() {
        // Given
        let invalidJson = """
           {
               "products": [
                   {
                       "productId": "1",
                       "description": "Broken Item"
                   }
               ]
           }
           """
        let data = Data(invalidJson.utf8)
        
        // When & Then
        XCTAssertThrowsError(try manager.parseItems(from: data)) { error in
            XCTAssertTrue(error is DecodingError)
        }
    }
}
