//
//  ViewController.swift
//  Jokes
//
//  Created by Oscar Victoria Gonzalez  on 12/3/19.
//  Copyright © 2019 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
@IBOutlet weak var tableView: UITableView!
    
    var theJokes = [Joke]() {
        didSet {
            tableView.reloadData()
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadJokes()
        
        
    }
    
  
    
    
    func loadJokes() {
        
        theJokes = [Joke]()
//        JokesAPIClient.fetchJokes { result in
//            switch result {
//            case .failure(let error):
//                let alertController = UIAlertController(title:"Network Error", message: "\(error)", preferredStyle: .alert)
//                let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
//                alertController.addAction(okAction)
//                DispatchQueue.main.async {
//                    self.present(alertController,animated: true, completion: nil)
//                }
//            case .success(let jokes):
//                dump(jokes)
//            }
//        }
//    }

}
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return theJokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jokeCell", for: indexPath)
        let jokes = theJokes[indexPath.row]
        cell.textLabel?.text = jokes.setup
        return cell
    }
}

