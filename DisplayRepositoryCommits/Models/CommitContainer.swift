//
//  CommitContainer.swift
//  DisplayRepositoryCommits
//
//  Created by Abdurrahman Ali on 8/10/21.
//

import Foundation

struct CommitContainer: Decodable {
    let sha: String
    let commit: Commit
}
