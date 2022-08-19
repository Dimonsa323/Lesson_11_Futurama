//
//  FuturamaVC.swift
//  Lesson_11_Futurama
//
//  Created by Дима Губеня on 16.08.2022.
//

import UIKit

    // MARK: - Class FuturamaVC

class FuturamaVC: UIViewController {
    
    // MARK: - Properties
    
    private let presenter: FuturamaPresenterProtocol
    
    // MARK: - Init
    
    init(presenter: FuturamaPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    
    @IBAction func nextScreenButton() {
        presenter.showNextScreen(view: self)
    }
}

    // MARK: - Private Extension

extension FuturamaVC {
}
