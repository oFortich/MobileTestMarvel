//
//  GetMarvelCharactersUseCase.swift
//  MarvelMobileTest
//
//  Created by M1 Mac on 5/07/22.
//

import Foundation

// This class acts as an intermediate between the Data and App layers
final class GetMarvelCharactersUseCase {
    
    let marvelService: MarvelCharactersAPIServiceProtocol
    
    required init() {
        self.marvelService = MarvelHeroesAPI()
    }
    
}

extension GetMarvelCharactersUseCase: GetMarvelCharactersUseCaseProtocol {
    
    func getCharacters(serviceState: MarvelService, completion: @escaping MarvelAPIResponseCompletion) {
        self.marvelService.getCharacters(serviceState: serviceState, completion: completion)
    }
    
}
