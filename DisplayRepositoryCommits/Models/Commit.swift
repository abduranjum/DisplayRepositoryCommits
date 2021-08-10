//
//  Commit.swift
//  DisplayRepositoryCommits
//
//  Created by Abdurrahman Ali on 8/10/21.
//

import Foundation

struct Commit: Decodable {
    let author: Author
    let message: String
}

