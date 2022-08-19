//
//  Assembler.swift
//  Lesson_11_Futurama
//
//  Created by Дима Губеня on 18.08.2022.
//

import Foundation
import UIKit

    // MARK: - Assembler

class Assembler {
    func createDetailVC(model: Futurama, networking: NetworkingServiceProtocol, navigator: NavigatorProtocol) -> UIViewController {
        let presenter = InfoVCPresenter(model: model, navigator: navigator, networking: networking)
        let vc = InfoVC(presenter: presenter)
        
        return vc
    }
}
