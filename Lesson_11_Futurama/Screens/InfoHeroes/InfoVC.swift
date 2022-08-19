//
//  InfoVC.swift
//  Lesson_11_Futurama
//
//  Created by Дима Губеня on 18.08.2022.
//

import UIKit

    // MARK: - InfoVC
    
class InfoVC: UIViewController {

    @IBOutlet weak var infoImageView: UIImageView!
    
    @IBOutlet weak var speciesLable: UILabel!
    @IBOutlet weak var planetLable: UILabel!
    @IBOutlet weak var statusLable: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Properties
    
    private let presenter: InfoVCPresenterProtocol
    
    // MARK: - Init
    
    init(presenter: InfoVCPresenterProtocol) {
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

extension InfoVC {
    func setupUI() {
        presenter.getHeroImage { image in
            self.infoImageView.image = image
        }
        nameLabel.text = presenter.model.name
        ageLabel.text = presenter.model.age
        planetLable.text = presenter.model.planet.rawValue
        statusLable.text = presenter.model.status.rawValue
        speciesLable.text = presenter.model.species.rawValue
}
}
