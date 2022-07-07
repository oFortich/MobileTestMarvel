//
//  DetailPresenter.swift
//  MarvelMobileTest
//
//  Created by M1 Mac on 5/07/22.
//

import Foundation
import UIKit



class DetailPresenter {
    
    //MARK: UseCases
    let getMarvelCharacterDetailsUseCase: GetMarvelCharacterDetailsUseCaseProtocol = GetMarvelCharacterDetailsUseCase()
    
    //MARK: Variables
    private var hero: MarvelCharacter
    private var idHero: String
    weak var view: DetailViewProtocol!
    
    
    init() {
        self.hero = MarvelCharacter()
        self.idHero = ""
        
    }
    
    func loadData() {
        getMarvelCharacterDetailsUseCase.getCharacterDetails(serviceState: .characterDetail(id: idHero)) { response in
            switch response {
            case .success(let hero):
                guard let hero = hero.first else { return }
                self.hero = hero
                self.setupUI()
            case .failure(let error):
                self.showErrorMessage(error: error.localizedDescription )
            }
        }
    }
    
    private func showErrorMessage(error: String) {
        let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
        DispatchQueue.main.async {
            self.view?.navigationController()?.present(alert, animated: true)
        }
    }
    
    func setIdHero(idHero: String) {
        self.idHero = idHero
    }
    
    func getHero() -> MarvelCharacter{
        return self.hero
    }
    
    func setupUI() {
        let imageUrl = "\(self.hero.thumbnail.path).\(self.hero.thumbnail.ext)"
        view.loadInfo(name: self.hero.name,
                              description: self.hero.resultDescription,
                              imageURL: imageUrl)
    }
    
}

