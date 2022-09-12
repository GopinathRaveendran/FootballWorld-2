//
//  MatchViewController.swift
//  FootballWorld
//
//  Created by gopinath.raveendran on 10/09/2022.
//

import UIKit

class MatchViewController: UIViewController {
    
 @IBOutlet weak var tableViewOutlet: UITableView!
    
    
    var match: [Status] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Competitions"
        
        // Do any additional setup after loading the view.
    }
   
  
}

//extension MatchViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0
//    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: <#T##String#>, for: <#T##IndexPath#>)
//
//    }


