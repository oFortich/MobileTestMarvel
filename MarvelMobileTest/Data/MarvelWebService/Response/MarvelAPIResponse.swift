//
//  MarvelAPIResponse.swift
//  MarvelTest
//
//  Created by M1 Mac on 4/07/22.
//

import Foundation

typealias MarvelAPIResponseCompletion = (Result<[MarvelCharacter],Error>) -> Void

class MarvelAPIResponse {
    
    private(set) var completionClosure: MarvelAPIResponseCompletion
    
    init(completionClosure: @escaping MarvelAPIResponseCompletion) {
        self.completionClosure = completionClosure
    }
    
    func processFailedRequest(withError failureError: Error?) {
        guard let error = failureError else {
            let err: NetworkError = .badURL
            completionClosure(.failure(err))
            return
        }
        completionClosure(.failure(error))
    }
    
    func processSucceededRequest(withResponse response: Data) {
        guard let data = try? JSONDecoder().decode(MarvelResponse.self, from: response) else {
            self.processFailedRequest(withError: nil)
            return
        }
        let heroes = data.data.results.map{ $0.toMarvelCharacter() }
        self.completionClosure(.success(heroes))
    }
    
}
