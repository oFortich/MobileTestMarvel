//
//  GetMarvelCharacterDetailsUseCase.swift
//  MarvelMobileTest
//
//  Created by M1 Mac on 5/07/22.
//

import Foundation

// This class acts as an intermediate between the Data and App layers
final class GetMarvelCharacterDetailsUseCase {
    
    let marvelService: MarvelCharactersAPIServiceProtocol
    
    required init() {
        self.marvelService = MarvelHeroesAPI()
    }
    
}

extension GetMarvelCharacterDetailsUseCase: GetMarvelCharacterDetailsUseCaseProtocol {
    
    func getCharacterDetails(serviceState: MarvelService, completion: @escaping MarvelAPIResponseCompletion) {
        self.marvelService.getCharacterDetails(serviceState: serviceState, completion: completion)
    }
    
}
