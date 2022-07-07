//
//  MarvelCharactersAPIServiceProtocol.swift
//  MarvelMobileTest
//
//  Created by M1 Mac on 5/07/22.
//

import Foundation

// This protocol have the function of connect the Data with the Domain

protocol MarvelCharactersAPIServiceProtocol {
    func getCharacters(serviceState: MarvelService ,completion: @escaping MarvelAPIResponseCompletion)
    func getCharacterDetails(serviceState: MarvelService ,completion: @escaping MarvelAPIResponseCompletion)
}
