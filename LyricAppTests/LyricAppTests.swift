//
//  LyricAppTests.swift
//  LyricAppTests
//
//  Created by C4Q on 3/9/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import XCTest
@testable import LyricApp

class LyricAppTests: XCTestCase {
    
    //   test if data is coming back network call
    
    func testLyricAPI() {
//        what am I expecting to get
        let expectedResults = expectation(description:"songs results recieved")
        SearchAPIClient.artistSearch(keyword: "") {(error, TrackWrapper) in
            if let error = error {
                XCTFail("songs search error: \(error)")
            } else if let trackWrapper = TrackWrapper {
                XCTAssertGreaterThan(trackWrapper.count, 0)
                expectedResults.fulfill()
            }
        }
        
//        because this is an async call we need to have to have a timeout
        wait(for: [expectedResults], timeout: 10.0)
    }
}
