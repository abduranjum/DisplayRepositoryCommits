//
//  CommitViewModel.swift
//  DisplayRepositoryCommits
//
//  Created by Abdurrahman Ali on 8/10/21.
//

import Foundation

struct CommitViewModel {
    let commitContainer: CommitContainer
}

extension CommitViewModel {
    init(with commitContainer: CommitContainer) {
        self.commitContainer = commitContainer
    }
}

extension CommitViewModel {
    var author: String {
        return self.commitContainer.commit.author.name
    }
    
    var hash: String {
        return self.commitContainer.sha
    }
    
    var message: String {
        self.commitContainer.commit.message
    }
    
    var date: String {
        return self.commitContainer.commit.author.date
    }
}

