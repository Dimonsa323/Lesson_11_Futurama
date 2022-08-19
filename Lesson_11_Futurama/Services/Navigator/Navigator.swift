//
//  Navigator.swift
//  Lesson_11_Futurama
//
//  Created by Дима Губеня on 18.08.2022.
//

import Foundation
import UIKit
    
    // MARK: - Protocol

protocol NavigatorProtocol {
    func showDetailVC(model: Futurama, view: UIViewController, networking: NetworkingServiceProtocol)
}

    // MARK: - Navigator

class Navigator {
    
    private let assembler = Assembler()
    
    func showDetailVC(model: Futurama, view: UIViewController, networking: NetworkingServiceProtocol) {
        let vc = assembler.createDetailVC(model: model, networking: networking, navigator: self )
        view.navigationController?.pushViewController(vc, animated: true)
    }
}


    // MARK: - Private Extension 

extension Navigator: NavigatorProtocol {
    
}
