//
//  Webservice.swift
//  DisplayRepositoryCommits
//
//  Created by Abdurrahman Ali on 8/10/21.
//

import Foundation

class Webservice {

    func getCommits(url: URL, completion: ([Any]?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            print(data)
        }.resume()
    }
}

