//
//  StocksViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Chelsi Christmas on 12/6/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class StocksViewController: UIViewController {
    
    var stocks = [StocksData]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()

    }
    
    func loadData() {
        stocks = StocksData.getStocks()
    }
    

    

}

extension StocksViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         stocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath)
        let stock = stocks[indexPath.row]
        
        cell.textLabel!.text = "\(stock.date)"
        cell.detailTextLabel!.text = "\(stock.open)"
        
        return cell
    }
    
    
}
