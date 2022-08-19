//
//  HeroesPresenter.swift
//  Lesson_11_Futurama
//
//  Created by Дима Губеня on 16.08.2022.
//

import Foundation
import UIKit

 // MARK: - Protocol Presenter

protocol HeroesPresenterProtocol {
    var heroesFuturama: [Futurama] { get }
    func fetchInfo(closure: @escaping () -> ())
    func showNextScreen(view: UIViewController, indexPath: IndexPath)
}
// model: Futurama,
 // MARK: - Class

class HeroesPresenter {
    
    // MARK: - Properties
    
    var heroesFuturama: [Futurama] = []
    private let navigator: NavigatorProtocol
    private let networking: NetworkingServiceProtocol
    
    init(navigator: NavigatorProtocol, networking: NetworkingServiceProtocol) {
        self.navigator = navigator
        self.networking = networking
    }
}

 // MARK: - Private Extension 

extension HeroesPresenter: HeroesPresenterProtocol {
   
    func fetchInfo(closure: @escaping () -> ()) {
        networking.fetchInfo { heroesFuturama in
            self.heroesFuturama = heroesFuturama
            closure()
        }
    }
                             
    func showNextScreen(view: UIViewController, indexPath: IndexPath) {
        let model = heroesFuturama[indexPath.row]
        navigator.showDetailVC(model: model, view: view, networking: networking)
    }
    }
    
    
    
