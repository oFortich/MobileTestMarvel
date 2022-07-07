//
//  MarvelHeroesAPI.swift
//  MarvelTest
//
//  Created by M1 Mac on 4/07/22.
//

import Foundation

// This class is in charge of make de the call to the API
class MarvelHeroesAPI: MarvelCharactersAPIServiceProtocol {
    
    func getCharacterDetails(serviceState: MarvelService, completion: @escaping MarvelAPIResponseCompletion) {
        let handler = MarvelAPIResponse(completionClosure: completion)
        
        let service = serviceState
        guard let url = URL(string: service.basePath + service.servicePath) else {
            return
        }
        
        let _: Void = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            handler.processSucceededRequest(withResponse: data)
        }.resume()
    }
    
    func getCharacters(serviceState: MarvelService ,completion: @escaping MarvelAPIResponseCompletion) {
        let handler = MarvelAPIResponse(completionClosure: completion)
        
        let service = serviceState
        guard let url = URL(string: service.basePath + service.servicePath) else {
            return
        }
        
        let _: Void = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            handler.processSucceededRequest(withResponse: data)
        }.resume()
        
    }
}
