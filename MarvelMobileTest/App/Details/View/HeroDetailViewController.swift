//
//  HeroDetailViewController.swift
//  MarvelMobileTest
//
//  Created by M1 Mac on 5/07/22.
//

import Foundation
import UIKit

class HeroDetailViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet private weak var heroImage: UIImageView!
    @IBOutlet private weak var heroName: UILabel!
    @IBOutlet private weak var heroDescription: UILabel!
    
    //MARK: Variables
    private var heroDetailService = MarvelHeroesAPI()
    private var idHero = String()
    private var presenter = DetailPresenter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.setIdHero(idHero: self.idHero)
        self.presenter.view = self
        self.presenter.loadData()
        setupUI()
        
    }

    func setupUI() {
        self.heroImage.layer.cornerRadius = 10
    }
    
    convenience init(id: String){
        self.init()
        self.idHero = id
    }
    
}

extension HeroDetailViewController: DetailViewProtocol {
    func loadInfo(name: String, description: String, imageURL: String) {
        DispatchQueue.main.async {
            self.heroName.text = name
            self.heroDescription.text = description.isEmpty ? "no description found" : description
            self.heroImage.loadFrom(URLAddress: imageURL)
        }
    }
    
}


