//
//  ViewController.swift
//  Jokes
//
//  Created by Oscar Victoria Gonzalez  on 12/3/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadJokes()
        
    }
    func loadJokes() {
        JokesAPIClient.fetchJokes { result in
            switch result {
            case .failure(let error):
                let alertController = UIAlertController(title:"Network Error", message: "\(error)", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
                alertController.addAction(okAction)
                DispatchQueue.main.async {
                    self.present(alertController,animated: true, completion: nil)
                }
            case .success(let jokes):
                dump(jokes)
            }
        }
    }

}

