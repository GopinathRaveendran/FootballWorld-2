//
//  MatchTableView.swift
//  FootballWorld
//
//  Created by gopinath.raveendran on 11/09/2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    let myData = ["date", "opponents", "score"]
    override func viewDidLoad() {
        super.viewDidLoad()
        FootballManager.fetchData { match in
            print(match)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
            
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = myData[indexPath.row]
        return cell
    }
    
}

