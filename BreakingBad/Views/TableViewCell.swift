//
//  TableViewCell.swift
//  BreakingBad
//
//  Created by Dmitry on 08.05.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var nickNamaLabel: UILabel!
    @IBOutlet var characterImageView: CharacterImageView! {
        didSet {
            characterImageView.layer.cornerRadius = characterImageView.frame.height / 2
        }
    }
    
    func setValue(with character: Character?) {
        nameLabel.text = character?.name
        nickNamaLabel.text = character?.nickname
        characterImageView.fetchImage(from: character?.img ?? "")
//        DispatchQueue.global().async {
//            guard let stringUrl = character?.img else { return }
//            guard let imageUrl = URL(string: stringUrl) else { return }
//            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
//            DispatchQueue.main.async {
//                self.characterImageView.image = UIImage(data: imageData)
//            }
//        }
    }

}
