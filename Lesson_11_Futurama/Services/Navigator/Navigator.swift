//
//  Navigator.swift
//  Lesson_11_Futurama
//
//  Created by Дима Губеня on 18.08.2022.
//

import Foundation
import UIKit


protocol NavigatorProtocol {
    func showDetailVC(model: Futurama, view: UIViewController, networking: NetworkingServiceProtocol)
}

class Navigator {
    
    private let assembler = Assembler()
    
    func showDetailVC(model: Futurama, view: UIViewController, networking: NetworkingServiceProtocol) {
        let vc = assembler.createDetailVC(model: model, networking: networking, navigator: self )
        view.navigationController?.pushViewController(vc, animated: true)
    }
}


extension Navigator: NavigatorProtocol {
    
}
