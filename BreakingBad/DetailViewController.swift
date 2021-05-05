//
//  ViewController.swift
//  BreakingBad
//
//  Created by Dmitry on 05.05.2021.
//

import UIKit

class DetailViewController: UITableViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var birthdayLabel: UILabel!
    
    var chars: [Char] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 90
        NetworkManager.shared.fetchData(with: { charecters in
            self.chars = charecters
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chars.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let char = chars[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = char.name
        content.secondaryText = char.nickname
        
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        cell.contentConfiguration = content
        
        return cell
    }
}

