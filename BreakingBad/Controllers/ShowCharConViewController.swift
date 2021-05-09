//
//  ShowCharConViewController.swift
//  BreakingBad
//
//  Created by Dmitry on 06.05.2021.
//

import UIKit

class ShowCharConViewController: UIViewController {
    
    @IBOutlet var charImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var nickNameLabel: UILabel!
    @IBOutlet var birthdayLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var actorLabel: UILabel!
    
    var character: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = character?.name
        nickNameLabel.text = character?.nickname
        birthdayLabel.text = character?.birthday
        statusLabel.text = "Status: \(character?.status ?? "")"
        actorLabel.text = "Actor: \(character?.portrayed ?? "")"
        DispatchQueue.global().async {
            guard let stringUrl = self.character?.img else { return }
            guard let imageUrl = URL(string: stringUrl) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            DispatchQueue.main.async {
                self.charImageView.image = UIImage(data: imageData)
            }
        }
    }
}
