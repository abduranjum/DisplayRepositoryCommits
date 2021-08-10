//
//  ViewController.swift
//  DisplayRepositoryCommits
//
//  Created by Abdurrahman Ali on 8/10/21.
//

import Foundation
import UIKit

class CommitsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        let url = URL(string: "https://api.github.com/repos/abduranjum/Top_100_Albums_on_iTunes/commits")!
        Webservice().getCommits(url: url) { _ in
            
        }
    }

}

