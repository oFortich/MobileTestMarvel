//
//  GetMarvelCharactersUseCaseProtocol.swift
//  MarvelMobileTest
//
//  Created by Orlando Luis Fortich Millan on 6/07/22.
//

import Foundation

// protocol implemented so the class have to implement a function getCharacters which belongs to the Data protocols
protocol GetMarvelCharactersUseCaseProtocol {
    func getCharacters(serviceState: MarvelService ,completion: @escaping MarvelAPIResponseCompletion)
}
