//
//  ViewController.swift
//  MarvelMobileTest
//
//  Created by M1 Mac on 29/06/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: Variables
    private var presenter = HomePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.presenter.view = self
        
        setupUI()
        registerCells()
        
    }
    
    func setupUI() {
        self.titleLabel.text = "Characters"
        
    }
    
    func registerCells() {
        tableView.register(UINib(nibName: "HeroTableViewCell", bundle: nil), forCellReuseIdentifier: "HeroCell")
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.selectCharacter(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroCell") as! HeroTableViewCell
        cell.selectionStyle = .none
        
        let hero = presenter.getHeroAt(index: indexPath.row)
        cell.setupUI(image: hero.thumbnail, name: hero.name)
        
        return cell
    }
    
    
}

extension HomeViewController: HomeViewProtocol {
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}
