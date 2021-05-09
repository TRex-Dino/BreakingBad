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
    }

}
