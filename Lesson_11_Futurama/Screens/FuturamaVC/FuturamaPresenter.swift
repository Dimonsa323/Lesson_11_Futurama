//
//  FuturamaPresenter.swift
//  Lesson_11_Futurama
//
//  Created by Дима Губеня on 16.08.2022.
//

import Foundation
import UIKit

    // MARK: - Protocol Presenter

protocol FuturamaPresenterProtocol {
    func showNextScreen(view: UIViewController)
}

    // MARK: - Struct

class FuturamaPresenter {
    private let navigator: NavigatorProtocol
    private let networking: NetworkingServiceProtocol
    
    init(navigator: NavigatorProtocol, networking: NetworkingServiceProtocol) {
        self.navigator = navigator
        self.networking = networking
}
}

    // MARK: - Private Extension

extension FuturamaPresenter: FuturamaPresenterProtocol {
    func showNextScreen(view: UIViewController) {
        let presenter = HeroesPresenter(navigator: navigator, networking: networking)
        let vc = HeroesVC(presenter: presenter)
        view.navigationController?.pushViewController(vc, animated: true)
    }
}

