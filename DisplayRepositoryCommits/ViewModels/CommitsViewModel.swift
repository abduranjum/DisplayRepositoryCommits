//
//  CommitsViewModel.swift
//  DisplayRepositoryCommits
//
//  Created by Abdurrahman Ali on 8/10/21.
//

import Foundation

struct CommitsViewModel {
    let commitContainers: [CommitContainer]
}

extension CommitsViewModel {
    init(with commitContainers: [CommitContainer]) {
        self.commitContainers = commitContainers
    }
}

extension CommitsViewModel {
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return commitContainers.count
    }
    
    func commitViewModel(at index: Int) -> CommitViewModel {
        let commitContainer = commitContainers[index]
        return CommitViewModel(commitContainer: commitContainer)
    }
}
