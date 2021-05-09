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
    
    private var chars: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        guard let charId = chars[indexPath.row].char_id else { return cell}
        
        let char = chars[charId]
        
        cell.setValue(with: char)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        let showCharVC = segue.destination as! ShowCharConViewController
        let charId = chars[indexPath.row].char_id
        showCharVC.character = chars[charId ?? 0]
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let like = likeAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [like])
    }
}

extension DetailViewController {
    private func likeAction(at indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .normal, title: "Like") { action, view, complition in
            
            complition(true)
        }
        action.backgroundColor = .orange
        action.image = UIImage(systemName: "heart")
        return action
    }
}
