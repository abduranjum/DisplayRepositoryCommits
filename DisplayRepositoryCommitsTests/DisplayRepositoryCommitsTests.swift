//
//  DisplayRepositoryCommitsTests.swift
//  DisplayRepositoryCommitsTests
//
//  Created by Abdurrahman Ali on 8/11/21.
//

import XCTest
@testable import DisplayRepositoryCommits

class DisplayRepositoryCommitsTests: XCTestCase {

    var commitContainer: CommitContainer!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let author = Author(name: "Abdurrahman Mubeen Ali")
        let sha = "2aec0139eb59265ff65e3e1e6629e7e30d6bd889"
        let message = "[REFACTORING] Reorganized the files into folders."
        let commit = Commit(author: author, message: message)
        let commitContainer = CommitContainer(sha: sha, commit: commit)
        
        self.commitContainer = commitContainer
    }

    override func tearDownWithError() throws {
        commitContainer = nil
        
        try super.tearDownWithError()
    }

    func testCommitViewModel() throws {
        let commitViewModel = CommitViewModel(commitContainer: commitContainer)
        
        let author = commitViewModel.author
        let sha = commitViewModel.hash
        let message = commitViewModel.message
        
        XCTAssertEqual(author, "Abdurrahman Mubeen Ali", "The author name is incorrect.")
        XCTAssertEqual(sha, "2aec0139eb59265ff65e3e1e6629e7e30d6bd889", "The hash is incorrect.")
        XCTAssertEqual(message, "[REFACTORING] Reorganized the files into folders.", "The message is incorrect.")
    }

    func testCommitViewModelPerformance() throws {
        measure(
           metrics: [
             XCTClockMetric(),
             XCTCPUMetric(),
             XCTStorageMetric(),
             XCTMemoryMetric()
           ]
         ) {
            _ = CommitViewModel(commitContainer: commitContainer)
         }
    }

}
