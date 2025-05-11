//
//  HomeViewModelTests.swift
//  OcadoTestTests
//
//  Created by Vladyslav Dikhtiaruk on 11/05/2025.
//

import XCTest
@testable import OcadoTest

final class HomeViewModelTests: XCTestCase {
    var viewModel: HomeViewModel!
    var mockItemManager: MockItemManager!
    
    override func setUp() {
        super.setUp()
        mockItemManager = MockItemManager()
        viewModel = HomeViewModel(itemManager: mockItemManager)
    }
    
    override func tearDown() {
        viewModel = nil
        mockItemManager = nil
        super.tearDown()
    }
    
    func test_HomeViewModel_updateQuantity_quantityIncreased_checkoutAndTotalUpdated() throws {
        // given
        viewModel.products = try mockItemManager.parseItems(from: Data())
        
        // when
        let expectation = XCTestExpectation(description: "Wait for async update")
        viewModel.updateQuantity(for: "mock-1", with: 2)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            // then
            XCTAssertEqual(self.viewModel.checkoutItems.count, 1)
            XCTAssertEqual(self.viewModel.checkoutItems.first?.productId, "mock-1")
            XCTAssertEqual(self.viewModel.checkoutItems.first?.quantity, 2)
            XCTAssertEqual(self.viewModel.totalValue, 31.98)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_HomeViewModel_updateQuantity_zeroQuantity_checkoutEmptied() throws {
        // given
        viewModel.products = try mockItemManager.parseItems(from: Data())
        viewModel.updateQuantity(for: "mock-1", with: 2)
        
        // when
        viewModel.updateQuantity(for: "mock-1", with: 0)
        
        // then
        XCTAssertTrue(viewModel.checkoutItems.isEmpty)
        XCTAssertEqual(viewModel.totalValue, 0)
    }
}

