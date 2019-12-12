//
//  StocksDetailViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Chelsi Christmas on 12/11/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class StocksDetailViewController: UIViewController {
   
    var stock: StocksData?
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var openingLabel: UILabel!
    
    @IBOutlet weak var closingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        dateLabel.text = "Date: \(stock!.date)"
        openingLabel.text = "Open: \(stock!.open)"
        closingLabel.text = "Close: \(stock!.close)"
        
        if stock!.open > stock!.close {
            imageView.image = UIImage(named: "thumbsDown")
            view.backgroundColor = .red
        } else {
            imageView.image = UIImage(named: "thumbsUp")
            view.backgroundColor = .green
        }
        
        
    }
    
    func chooseBackgroundColor() {
        
    }

  

}
