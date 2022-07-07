//
//  DetailPresenterTests.swift
//  MarvelMobileTestTests
//
//  Created by M1 Mac on 30/06/22.
//

import XCTest
@testable import MarvelMobileTest

class DetailPresenterTests: XCTestCase {
    
    var sut: DetailPresenter!
    var idHeroToTest: String!

    override func setUp() {
        sut = DetailPresenter()
        idHeroToTest = "1011334"
        sut.setIdHero(idHero: idHeroToTest)
    }

    override func tearDown() {
        sut = nil
        idHeroToTest = nil
    }
    
    func test_Get_Details_From_Hero_Id() {
        
        let exp = self.expectation(description: "Waiting for blocking")
        
        sut.getMarvelCharacterDetailsUseCase.getCharacterDetails(serviceState: .characterDetail(id: idHeroToTest)) { response in
            switch response {
            case .success(let hero):
                XCTAssertEqual(hero.first?.name, "3-D Man")
                exp.fulfill()
            case .failure(_):
                XCTFail()
            }
        }
        
        self.waitForExpectations(timeout: 10)
    }

}
