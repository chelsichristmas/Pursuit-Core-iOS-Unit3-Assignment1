//
//  StocksViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Chelsi Christmas on 12/6/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class StocksViewController: UIViewController {
    
    var stocksWithSections = [[StocksData]]() {
        
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
        
        stocksWithSections = StocksData.sectionStocks()
        
    }
    
    func getSectionHeader(stock: StocksData) -> String {
           var newTitle = ""
           var title = stock.label.components(separatedBy: " ")
           title.remove(at: 1)
           newTitle = title.joined(separator: " ")
           
           return newTitle
       }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let stocksDVC = segue.destination as? StocksDetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("Unable to access detail view controller")
        }
        
        let stock = stocksWithSections[indexPath.section][indexPath.row]
        stocksDVC.stock = stock
    }

}

extension StocksViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stocksWithSections[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath)
        let stocks = stocksWithSections[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = "\(stocks.date)"
        cell.detailTextLabel?.text = "\(stocks.open)"
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        stocksWithSections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var label = stocksWithSections[section].first?.label.components(separatedBy: " ")
        label?.remove(at: 1)
        let newLabel = label!.joined(separator: " '")
        
        var sum = 0.0
        
        for stock in stocksWithSections[section] {
            sum += stock.open
        }
        
        let average = Double(Int(sum) / Int(stocksWithSections[section].count))
        
        let fullLabel = "\(newLabel) Open: \(average)"
        
        
        
        return fullLabel
    }
    
    
}
