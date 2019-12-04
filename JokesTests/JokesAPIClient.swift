//
//  JokesAPIClient.swift
//  Jokes
//
//  Created by Oscar Victoria Gonzalez  on 12/3/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case badURL(String)
    case networkClientError(Error)
    case noResponse
    case noData
    case badStatusCode(Int)
    case decodingError(Error)
}

struct JokesAPIClient {
    static func fetchJokes(completion: @escaping (Result<[Joke], NetworkError>) -> ()) {
        let endpointURLString = "https://official-joke-api.appspot.com/jokes/programming/ten"
        
        guard let url = URL(string: endpointURLString) else {
            completion(.failure(.badURL(endpointURLString)))
            return
        }
        
        // usd URLSession to perform the network GET request to the jokes web API
        
        let dataTask = URLSession.shared.dataTask(with: url) {(data, response , error) in
            
            if let error = error {
                completion(.failure(.networkClientError(error)))
                
            }
            guard let urlResponse = response as? HTTPURLResponse else {
                completion(.failure(.noResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            // find out what the status code
            switch urlResponse.statusCode {
            case 200...299: break
            default:
                completion(.failure(.badStatusCode(urlResponse.statusCode)))
            }
            
            do {
                let jokes = try JSONDecoder().decode([Joke].self, from: data)
                completion(.success(jokes))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }
        dataTask.resume()
    }
    
}
