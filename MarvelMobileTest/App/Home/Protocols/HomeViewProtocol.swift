//
//  HomeViewProtocol.swift
//  MarvelMobileTest
//
//  Created by M1 Mac on 5/07/22.
//

import Foundation
import UIKit

// This protocol comunicates the view with the presenter and delegates the responsability of reload the tableview
protocol HomeViewProtocol: AnyObject, NavigableProtocol {
    func reloadTableView()
}
