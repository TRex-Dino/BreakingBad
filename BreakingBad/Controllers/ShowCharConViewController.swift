//
//  ShowCharConViewController.swift
//  BreakingBad
//
//  Created by Dmitry on 06.05.2021.
//

import UIKit

class ShowCharConViewController: UIViewController {
    
    @IBOutlet var charImageView: CharacterImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var nickNameLabel: UILabel!
    @IBOutlet var birthdayLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var actorLabel: UILabel!
    
    var character: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = .orange
        
        nameLabel.text = character?.name
        nickNameLabel.text = character?.nickname
        birthdayLabel.text = "Birthday - \(character?.birthday ?? "")"
        statusLabel.text = "Status: \(character?.status ?? "")"
        actorLabel.text = "Actor: \(character?.portrayed ?? "")"
        
        charImageView.fetchImage(from: character?.img ?? "")
    }
}
