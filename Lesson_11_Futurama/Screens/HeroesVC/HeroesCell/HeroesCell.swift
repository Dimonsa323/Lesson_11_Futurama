//
//  HeroesCell.swift
//  Lesson_11_Futurama
//
//  Created by Дима Губеня on 18.08.2022.
//

import UIKit

    // MARK: - HeroesCell

class HeroesCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    
    
    @IBOutlet weak var imageViewLabel: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        imageViewLabel.layer.cornerRadius = imageViewLabel.bounds.width / 2
    }
    func config(with model: Futurama) {
        nameLabel.text = model.name
        loadAsyncImage(image: model.picURL) { image in
            self.imageViewLabel.image = image
        }
    }
    private func loadAsyncImage(image: String, closure: @escaping (UIImage) -> ()) {
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
