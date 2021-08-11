//
//  ViewController.swift
//  DisplayRepositoryCommits
//
//  Created by Abdurrahman Ali on 8/10/21.
//

import Foundation
import UIKit

class CommitsViewController: UITableViewController {
    private var commitsViewModel: CommitsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        let url = URL(string: "https://api.github.com/repos/abduranjum/Top_100_Albums_on_iTunes/commits")!
        Webservice().getCommits(url: url) { commitContainers in
            if let commitContainers = commitContainers {
                self.commitsViewModel = CommitsViewModel(commitContainers: commitContainers)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension CommitsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return commitsViewModel?.numberOfSections() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commitsViewModel?.numberOfRows(in: section) ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommitTableViewCell", for: indexPath) as? CommitTableViewCell else {
            fatalError("CommitTableViewCell not found!")
        }
        
        let commitViewModel = commitsViewModel?.commitViewModel(at: indexPath.row)
        
        cell.authorLabel.text = commitViewModel?.author
        cell.hashLabel.text = commitViewModel?.hash
        cell.messageLabel.text = commitViewModel?.message
        
        return cell
    }
}

