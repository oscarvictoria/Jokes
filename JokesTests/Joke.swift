//
//  Joke.swift
//  Jokes
//
//  Created by Oscar Victoria Gonzalez  on 12/3/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation

struct Joke: Decodable {
    let id: Int
    let type: String
    let setup: String
    let punchline: String
}
