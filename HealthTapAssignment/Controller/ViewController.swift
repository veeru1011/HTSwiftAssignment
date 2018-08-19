//
//  ViewController.swift
//  HealthTapAssignment
//
//  Created by VEER BAHADUR TIWARI on 18/08/18.
//  Copyright © 2018 healthTap. All rights reserved.
//

import UIKit
import ANLoader

class ViewController: UIViewController {
    
    var result: NyTimeResult?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableview()
        fetchDataFromServer()
    }
    
    func fetchDataFromServer()
    {
        ANLoader.showLoading("Loading", disableUI: true)
        APIManger.shared().getResultList { (succes, result, message) in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                ANLoader.hide()
            }
            switch succes {
            case true :
                if let list = result {
                    self.result = list
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case false:
                print("Failure")
            }
        }
    }
    
    // MARK: Helpers
    func setUpTableview() {
        
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 0.01))
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.dataSource = self
    }
    
}

extension ViewController:  UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let movies = self.result?.movies {
            return movies.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellIdentifier", for: indexPath) as! MovieViewCell
        
        if let movies = self.result?.movies {
            let movilewModel = movies[indexPath.row]
            cell.movie = movilewModel
        }
        
    
        cell.setNeedsUpdateConstraints()
        cell.updateConstraintsIfNeeded()
        
        
        return cell
    }
    
}

