//
//  MarvelCharacter.swift
//  MarvelMobileTest
//
//  Created by Orlando Luis Fortich Millan on 6/07/22.
//

import Foundation

// MARK: - MarvelCharacter
struct MarvelCharacter {
    
    var id: Int = 0
    var name = String()
    var resultDescription = String()
    var thumbnail = HeroImage()
    
}

// MARK: - MarvelCharacter
struct HeroImage {
    var path = String()
    var ext = String()
}

 
