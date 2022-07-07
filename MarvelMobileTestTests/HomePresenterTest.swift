//
//  DetailPresenterTest.swift
//  MarvelMobileTestTests
//
//  Created by M1 Mac on 5/07/22.
//

import XCTest
@testable import MarvelMobileTest

class HomePresenterTests: XCTestCase {
    
    var sut: HomePresenter!
    
    override func setUp() {
        sut = HomePresenter()
        sut.loadData()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_Get_Heroes_List() {
        
        let exp = self.expectation(description: "Waiting for blocking")
        
        sut.getMarvelCharactersUseCase.getCharacters(serviceState: .characters) { response in
            switch response {
            case .success(let heroes):
                XCTAssertEqual(heroes.count, 100)
                exp.fulfill()
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 10)
    }
    
    func test_Get_Hero_At() {
        
        sut.loadData()
        
        let exp = expectation(description: "Test after 5 seconds")
        let result = XCTWaiter.wait(for: [exp], timeout: 5.0)
        
        if result == XCTWaiter.Result.timedOut {
            
            let heroTest = sut.getHeroAt(index: 0)
            XCTAssertEqual(heroTest.name, "3-D Man")
            
         } else {
             
             XCTFail("Delay interrupted")
             
         }
        
    }
    
}
