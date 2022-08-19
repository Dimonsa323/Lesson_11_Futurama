//
//  InfoVCPresenter.swift
//  Lesson_11_Futurama
//
//  Created by Дима Губеня on 18.08.2022.
//

import Foundation
import UIKit

protocol InfoVCPresenterProtocol {
    var model: Futurama { get }
    func getHeroImage(closure: @escaping (UIImage) -> ())
}

class InfoVCPresenter {
    let model: Futurama
    
    private let navigator: NavigatorProtocol
    private let networking: NetworkingServiceProtocol
    
    init(model: Futurama, navigator: NavigatorProtocol, networking: NetworkingServiceProtocol) {
        self.navigator = navigator
        self.networking = networking
        self.model = model
}
}

extension InfoVCPresenter: InfoVCPresenterProtocol {
    func getHeroImage(closure: @escaping (UIImage) -> ()) {
        networking.loadAsyncImage(image: model.picURL) { image in
            closure(image)
        }
    }
}
