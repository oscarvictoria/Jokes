//
//  JokesTests.swift
//  JokesTests
//
//  Created by Oscar Victoria Gonzalez  on 12/3/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import XCTest
@testable import Jokes

class JokesTests: XCTestCase {

    func testJokeModel() {
        // Arrange:
        let jsonData = """
[
{
    "id": 16,
    "type": "programming",
    "setup": "What's the object-oriented way to become wealthy?",
    "punchline": "Inheritance"
},
{
    "id": 15,
    "type": "programming",
    "setup": "What's the best thing about a Boolean?",
    "punchline": "Even if you're wrong, you're only off by a bit."
}]
""".data(using: .utf8)!
    let exptectedJokesCount = 2
        
        // Act
        
        do {
            let jokes = try JSONDecoder().decode([Joke].self, from: jsonData)
            XCTAssertEqual(jokes.count, exptectedJokesCount)
        } catch {
            XCTFail("Decoding error \(error)")
        }
    }

}
