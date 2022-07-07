//
//  Extensions.swift
//  MarvelMobileTest
//
//  Created by M1 Mac on 5/07/22.
//

import Foundation
import UIKit


extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}

extension UIViewController {
    
    func navigationController() -> UINavigationController? {
        return self.navigationController
    }
    
}
