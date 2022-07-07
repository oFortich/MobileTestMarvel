//
//  DetailViewProtocol.swift
//  MarvelMobileTest
//
//  Created by M1 Mac on 5/07/22.
//

import Foundation

// This protocol delegates the information charging to the view
protocol DetailViewProtocol: AnyObject, NavigableProtocol {
    func loadInfo(name: String, description: String, imageURL: String)
}
