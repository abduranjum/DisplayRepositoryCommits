//
//  Webservice.swift
//  DisplayRepositoryCommits
//
//  Created by Abdurrahman Ali on 8/10/21.
//

import Foundation

class Webservice {

    func getCommits(url: URL, completion: @escaping ([CommitContainer]?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let commits = try? JSONDecoder().decode([CommitContainer].self, from: data)
                completion(commits)
            }
        }.resume()
    }
}

