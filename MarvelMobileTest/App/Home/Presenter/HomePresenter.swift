//
//  HomePresenter.swift
//  MarvelMobileTest
//
//  Created by M1 Mac on 30/06/22.
//

import Foundation
import UIKit

class HomePresenter {
    
    //MARK: UseCases
    let getMarvelCharactersUseCase: GetMarvelCharactersUseCaseProtocol = GetMarvelCharactersUseCase()
    
    //MARK: Variables
    private var hero: [MarvelCharacter]
    weak var view: HomeViewProtocol?
    
    init() {
        self.hero = []
        
        loadData()
    }
    
    func loadData() {
        getMarvelCharactersUseCase.getCharacters(serviceState: .characters) { response in
            switch response {
            case .success(let heroes):
                self.hero = heroes
                self.view?.reloadTableView()
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
    
    func getNumberOfRows() -> Int{
        return hero.count
    }
    
    func getHeroAt(index: Int) -> MarvelCharacter {
        return hero[index]
    }
    
    func selectCharacter(at index: Int) {
        let id = getHeroAt(index: index).id
        let controller = HeroDetailViewController(id: String(id))
        view?.navigationController()?.pushViewController(controller, animated: true)
    }
    
}
