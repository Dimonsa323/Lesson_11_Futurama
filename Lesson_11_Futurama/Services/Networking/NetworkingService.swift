//
//  NetworkingService.swift
//  Lesson_11_Futurama
//
//  Created by Дима Губеня on 17.08.2022.
//

import Foundation
import UIKit

// MARK: - Protocol

protocol NetworkingServiceProtocol {
    func fetchInfo(closure: @escaping ([Futurama]) -> ())
    func loadAsyncImage(image: String, closure: @escaping (UIImage) -> ())
}

// MARK: - Class

class NetworkingService {
    
    func fetchInfo(closure: @escaping ([Futurama]) -> ()) {
        let stringURL = "https://futuramaapi.herokuapp.com/api/v2/characters"
        guard let infoURL = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: infoURL) { data, response, error in
            if let error = error {
                print (error)
                return
            }
            
            if let response = response {
                print(response)
            }
            
            guard let data = data else {
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let heroesFuturama = try decoder.decode([Futurama].self, from: data)
                // self.heroesFuturama = heroesFuturama
                DispatchQueue.main.async {
                    closure(heroesFuturama)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        } .resume()
    }
    
    func loadAsyncImage(image: String, closure: @escaping (UIImage) -> ()) {
        DispatchQueue.global().async {
            guard let url = URL(string: image) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            guard let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                closure(image)
            }
        }
    }
}

// MARK: - Private Extension

extension NetworkingService: NetworkingServiceProtocol {
}
