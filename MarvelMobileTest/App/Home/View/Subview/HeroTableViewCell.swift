//
//  HeroTableViewCell.swift
//  MarvelMobileTest
//
//  Created by M1 Mac on 30/06/22.
//

import Foundation
import UIKit

class HeroTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var heroImageView: UIImageView!
    @IBOutlet private weak var heroName: UILabel!
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupUI(image: HeroImage, name: String) {
        let url = "\(image.path).\(image.ext)"
        self.heroImageView.layer.cornerRadius = 10
        heroImageView.loadFrom(URLAddress: url)
        heroName.text = name
    }
}

