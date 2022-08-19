//
//  InfoVCPresenter.swift
//  Lesson_11_Futurama
//
//  Created by Дима Губеня on 18.08.2022.
//

import Foundation
import UIKit

    // MARK: - Protocol

protocol InfoVCPresenterProtocol {
    var model: Futurama { get }
    func getHeroImage(closure: @escaping (UIImage) -> ())
}

    // MARK: - InfoVC

class InfoVCPresenter {
    
    // MARK: - Properties
    
    let model: Futurama
    private let navigator: NavigatorProtocol
    private let networking: NetworkingServiceProtocol
    
    // MARK: - Init
    
    init(model: Futurama, navigator: NavigatorProtocol, networking: NetworkingServiceProtocol) {
        self.navigator = navigator
        self.networking = networking
        self.model = model
}
}

    // MARK: - Private Extension 

extension InfoVCPresenter: InfoVCPresenterProtocol {
    func getHeroImage(closure: @escaping (UIImage) -> ()) {
        networking.loadAsyncImage(image: model.picURL) { image in
            closure(image)
        }
    }
}
