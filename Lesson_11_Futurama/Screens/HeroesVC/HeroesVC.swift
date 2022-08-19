//
//  HeroesVC.swift
//  Lesson_11_Futurama
//
//  Created by Дима Губеня on 16.08.2022.
//

import UIKit

    // MARK: - HeroesVC

class HeroesVC: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    private let presenter: HeroesPresenterProtocol
    
    // MARK: - Init
    
    init(presenter: HeroesPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
}

    // MARK: - Private Extension 

extension HeroesVC {
 func setupUI() {
     setupTableView()
     presenter.fetchInfo {
         self.tableView.reloadData()
     }
 }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(.init(nibName: String(describing: HeroesCell.self), bundle: nil), forCellReuseIdentifier: String(describing: HeroesCell.self))
    }
}

extension HeroesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let model = presenter.heroesFuturama[indexPath.row]
        presenter.showNextScreen(view: self, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.heroesFuturama.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeroesCell.self), for: indexPath) as! HeroesCell
        let hero = presenter.heroesFuturama[indexPath.row]
        cell.config(with: hero)

        return cell
    }
    
}
