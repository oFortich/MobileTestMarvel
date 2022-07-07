//
//  NavigableProtocol.swift
//  MarvelMobileTest
//
//  Created by M1 Mac on 5/07/22.
//

import Foundation
import UIKit

// Protocol implemented in order to delegate the navigation functions to the presenter
protocol NavigableProtocol {
  func navigationController() -> UINavigationController?
}
